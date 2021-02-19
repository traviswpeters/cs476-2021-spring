---
layout: default
tags: [labs, seed]
dirname: 'lab03'
labprefix: 'Lab 03'
labtitle: 'Buffer Overflow Attack Lab'
title: 'Lab 03: Buffer Overflow Attack Lab'
duedate: 'Tuesday [03/02/2021]~~[02/23/2021]~~ @ 11:59 AM (MST)'
#published: True
released: True
---

# {{page.labprefix}}: {{page.labtitle}}
{:.pb-4}

## {{page.labtitle}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}


A buffer overflow is defined as the act of writing data beyond the boundary of allocated memory space (e.g., a buffer).
This vulnerability can be used by a malicious user to alter the flow control of the program, leading to the execution of malicious code.
The objective of this lab is for students to gain practical insights into this type of vulnerability, and to learn how to exploit the vulnerability.

In this lab, students will be given a program with a buffer-overflow vulnerability;
their task is to develop a scheme to exploit the vulnerability, and ultimately gain root privileges on the system.
In addition to the attacks we study, students will be guided through several protection schemes that have been implemented in the operating system as countermeasures to buffer-overflow attacks.
Students will evaluate how the  schemes work as well as their potential limitations.

This lab covers the following topics:

-   Buffer overflow vulnerability and attack
-   Stack layout
-   Address randomization, non-executable stack, and StackGuard
-   Shellcode (32-bit and 64-bit)
-   The return-to-libc attack, which aims at defeating the
    non-executable stack countermeasure, is covered in a separate lab.

> This lab is an adaptation of the SEED Labs "Buffer Overflow Attack Lab". (Specifically, the Set-UID version.)

### Resources

- Code related to this lab can be found in our [class's GitHub repository](https://github.com/traviswpeters/cs476-code). Specifically, see `03_buffer_overflow/`.
- [The Definitive Guide to Linux System Calls](https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/)
<!-- - [x86 Assembly/X86 Architecture](https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture#Segment_Registers) -->
- [Calling Conventions Demystified](https://www.codeproject.com/articles/1388/calling-conventions-demystified)
<!-- - [Calling Conventions (slides)](http://www.cs.cornell.edu/courses/cs3410/2019sp/schedule/slides/10-calling-notes-bw.pdf) -->
<!-- - [Calling Conventions (x86 cheatsheet)](https://wiki.osdev.org/Calling_Conventions) -->
- A handy [gdb cheatsheet](https://gist.github.com/rkubik/b96c23bd8ed58333de37f2b8cd052c30)
- Chapter 4 in the [SEED Textbook]({{site.data.settings.textbookseedlink}}).
- A related [video lecture](https://www.handsonsecurity.net/video.html) (Udemy course) recorded by Kevin Du.

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

<!--
## Note for Instructors

Instructors can customize this lab by choosing values for `L1`, \...,`L4`.
See Section [4](#sec:vulnerable_program){reference-type="ref" reference="sec:vulnerable_program"} for details.
Depending on the background of students and the time allocated for this lab,
instructors can also make the Level-2, Level-3, and Level-4 tasks (or some of them) optional.
The Level-1 task is sufficient to cover the basics of the buffer-overflow attacks.
Levels 2 to 4 increase the attack difficulties.
All the countermeasure tasks are based on the Level-1 task, so skipping the other levels does not affect those tasks.
-->

## Environment Setup

Modern operating systems have implemented several security mechanisms to
make the buffer-overflow attack difficult. To simplify our attacks, we
need to disable them first. Later on, we will enable them and see
whether our attack can still be successful or not.

### Disable ASLR

Ubuntu and several other Linux-based systems uses ASLR (address space layout randomization)
to randomize the starting address of heap and stack.
This makes guessing the exact addresses difficult;
guessing addresses is one of the critical steps of buffer-overflow attacks.
This feature can be disabled using the following command:

```bash
$ sudo sysctl -w kernel.randomize_va_space=0
```

### Configuring `/bin/sh`

In the recent versions of Ubuntu OS, the `/bin/sh` symbolic link points
to the `/bin/dash` shell.
The dash and bash shells have implemented a security countermeasure that prevents itself from being executed in a set-uid process.
Basically, if they detect that they are executed in a set-uid process,
they will immediately change the effective user ID to the process's real user ID,
effectively dropping any elevated privileges.

The victim of many of our attacks in this lab is a set-uid program, and our attack relies on running `/bin/sh`;
the countermeasure in `/bin/dash` makes our attack more difficult.
Therefore, we will link `/bin/sh` to another shell that does not have this countermeasure.
(In later tasks, we will show that with a little more effort, the countermeasure in `/bin/dash` can be easily defeated!)
We have installed a shell program called `zsh` in our Ubuntu 20.04 VM.
The following command can be used to link `/bin/sh` to `/bin/zsh`:

```bash
$ sudo ln -sf /bin/zsh /bin/sh
```

You can verify how `/bin/sh` is configured at any time:
```bash
$ ls -l /bin/sh /bin/zsh /bin/dash
```

<!--
### StackGuard and Non-Executable Stack.

These are two additional countermeasures implemented in the system. They
can be turned off during the compilation. We will discuss them later
when we compile the vulnerable program.
-->

### A Vulnerable Program

The following program has a buffer-overflow vulnerability.

Your **main objective** throughout parts of this lab will be to exploit this vulnerability and get a shell with root privileges.

##### A Brief Summary of How the Program Works

The program first reads in input from a file called `badfile`, and ultimately passes this input to another buffer in the function `bof()`.
The original input can have a maximum length of `517` bytes, but the buffer in `bof()` is only `BUF_SIZE` bytes long,  which is less than `517`.
Because `strcpy()` does not check boundaries, a buffer overflow can occur.
In this lab, this program is will be compiled and run as a root-owned set-uid program;
if a normal user can exploit this buffer overflow vulnerability, the user might be able to get a root shell.

It should be noted that the program gets its input from a file called `badfile`.
The contents of this file are specified by an untrusted user (you!).
Thus, your objective is to create the `badfile` with the necessary contents such that,
when the vulnerable program copies the contents into its buffer, a root shell gets spawned.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fcode%2Fstack.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

##### A Note About Compilation

When compiling the above program for this task,
we must not forget to turn off the StackGuard (`-fno-stack-protector`) and the non-executable stack (`-z execstack`) countermeasures.
After the compilation, we need to make the program a root-owned set-uid program.
We can achieve this by first changing the ownership of the program to `root`, and then changing the permissions for the executable to `4755`, which enables the set-uid bit.
It should be noted that changing ownership must
be done _**before**_ enabling the set-uid bit; changing ownership will cause the set-uid bit to be turned off.

In summary, a command sequence such as this will yield the desired setup:

```bash
$ gcc -DBUF_SIZE=100 -m32 -o stack -z execstack -fno-stack-protector stack.c
$ sudo chown root stack  # change owner to root
$ sudo chmod 4755 stack  # flip the set-uid bit
```

The compilation and setup commands are already included in the [Makefile](https://github.com/traviswpeters/cs476-code/blob/master/03_buffer_overflow/code/Makefile),
so your just need to type `make` in this directory to execute the needed commands.

> Note that the example here, where we set the `BUF_SIZE=100` is just an example.
> In the Makefile there are variables `L1`, \..., `L4`, which are used during the compilation.
> This program and Makefile can actually be configured in different ways, mostly aimed at varying the buffer size used in the program.
> I have configured these values for you to ensure that you compile the program for various tasks with the correct buffer size.
> **DO NOT CHANGE THESE VALUES!**

> For each "level" that we explore in this lab, our Makefile will also compile a version of the executable suitable for debugging (e.g., `stack-L1` and `stack-L1-dbg`)

</div>
</div>
<!-- END Special Section -->

## Lab Tasks
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

### Task 1: Getting Familiar with Shellcode

The ultimate goal of the buffer-overflow attacks we'll study in this lab is to inject malicious code into the target program,
so the code can be executed using the target program's privileges (yes, we'll target root-owned set-uid programs as in labs past!).
Shellcode is widely used in most code-injection attacks.
In this task we will spend some time getting familiar with shellcode.

> In class, we walked through how the 32-bit shellcode works.
> 64-bit shellcode is quite similar to the 32-bit shellcode,
> except that the names of the registers are different and the registers used by the `execve()` system call are also different.


<!--
##### The C Version of Shellcode

A shellcode is basically a piece of code that launches a shell.
We've already seen examples of C code that do this:

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fdemos%2Fsimpleshell.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

Unfortunately, we cannot just compile this code and use the binary code as our shellcode.
_(Why?! We touched on this in class!)_
The best way to write a shellcode is to use assembly code.
Writing shellcode is a non-trivial task, so we provide you with a version of 32-bit shellcode to use in this lab.
-->

<!-- If you are interested in how exactly shellcode works and you want to write a shellcode from scratch,  -->
<!-- you can learn that from a separate SEED lab called [*Shellcode Lab*](https://seedsecuritylabs.org/Labs_20.04/Software/Shellcode/). -->

<!--

##### 32-bit Shellcode

```asm
; Store the command on stack
xor  eax, eax
push eax          
push "//sh"
push "/bin"
mov  ebx, esp     ; ebx => "/bin//sh": execve()'s 1st argument

; Construct the argument array argv[]
push eax          ; argv[1] = 0
push ebx          ; argv[0] => "/bin//sh"
mov  ecx, esp     ; ecx => argv[]: execve()'s 2nd argument

; For environment variable
xor  edx, edx     ; edx = 0: execve()'s 3rd argument

; Invoke execve()
xor  eax, eax     ;
mov  al,  0x0b    ; execve()'s system call number
int  0x80
```

The shellcode above basically invokes the `execve()` system call to execute `/bin/sh`.

In summary:

-   The third instruction pushes `"//sh"`, rather than `"/sh"` onto the stack.
    This is because, for 32-bit shellcode, we need a 32-bit value here, and `"/sh"` has only 24 bits.
    Fortunately, `"//"` is equivalent to `"/"` when specifying paths on a file system, so we can get away with a double slash symbol.
-   We need to pass three arguments to `execve()` via the `ebx`, `ecx`
    and `edx` registers, respectively. The majority of the shellcode
    basically constructs the content for these three arguments.
-   The system call `execve()` is called when we set `al` to `0x0b`, and
    execute `"int 0x80"`.

##### 64-Bit Shellcode

We also provide a sample version of 64-bit shellcode, which is quite similar to the 32-bit shellcode,
except that the names of the registers are different and the registers used by the `execve()` system call are also different.
Some explanation of the code is given in the comments.

```asm
xor  rdx, rdx        ; rdx = 0: execve()'s 3rd argument
push rdx
mov  rax, '/bin//sh' ; the command we want to run
push rax             ;
mov  rdi, rsp        ; rdi => "/bin//sh": execve()'s 1st argument
push rdx             ; argv[1] = 0
push rdi             ; argv[0] => "/bin//sh"
mov  rsi, rsp        ; rsi => argv[]: execve()'s 2nd argument
xor  rax, rax
mov  al,  0x3b       ; execve()'s system call number
syscall              
```
-->

<!-- #### Task: Invoking the Shellcode -->

<!-- We have generated the binary shellcode and put this code in a C program called `call_shellcode.c` inside the `shellcode` folder. -->
<!-- If you would like to learn how to generate the binary code yourself, you should work on the Shellcode lab.  -->

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fshellcode%2Fcall_shellcode.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

In this task, you will examine different versions of shellcode.
Specifically, the code above includes two copies of shellcode:
one is the 32-bit shellcode and the other is 64-bit shellcode.
When we compile the program using the `-m32` flag, the 32-bit version will be used; without this flag, the 64-bit version will be used.
Using the provided [Makefile](https://github.com/traviswpeters/cs476-code/blob/master/03_buffer_overflow/shellcode/Makefile),
you can compile the code by typing `make` in that directory.
The Makefile will produce two binaries: `a32.out` (32-bit shellcode) and `a64.out` (64-bit shellcode).

#### Task 1.1

Please compile and run both executables, and describe your observations.

#### Task 1.2

Please briefly describe what this program is doing; i.e., what does the code in `main()` actually do?

> **NOTE:** If you look at the Makefile you can see that we use the `execstack` option when compiling the programs,
> which allows code to be executed from the stack; without this option, the program will fail.

### Task 2: Attacking a Vulnerable 32-bit Program (Level 1)

In this task, you need to compile the vulnerable program into a 32-bit binary called `stack-L1`.

> The compilation and setup commands are already included in `Makefile`.

> For each "level" we explore, our Makefile will also compile a version of the executable suitable for debugging (e.g., `stack-L1-dbg`)

To exploit the buffer-overflow vulnerability in the target program, the
most important thing to know is the distance between the buffer's
starting position and the place where the return-address is stored.
We will use a debugging method to determine this value.
Since we have the source code of the target program, we can compile it with the debugging flag (`-g`) turned on, which makes debugging a lot more convenient.
(You should be using our provided Makefile. If you are, when you run `make`, the debugging version should be created automatically.)

#### Task 2.1: Finding the Return Address

We will use `gdb` (**[gdb cheatsheet!](https://gist.github.com/rkubik/b96c23bd8ed58333de37f2b8cd052c30)**) to debug `stack-L1-dbg`.

Before running the program under `gdb`, we need to create a file called `badfile`.

Now, use `gdb` as follows to determine the buffer/ebp offset,
which you can use to determine where the return address should be in memory.


```
$ touch badfile            # <= Create an empty badfile
$ gdb stack-L1-dbg
gdb-peda$ b bof            # <= Set a break point at function bof()
Breakpoint 1 at 0x124d: file stack.c, line 18.
gdb-peda$ run              # <= Start executing the program
...
Breakpoint 1, bof (str=0xffffcf57 ...) at stack.c:18
18  {
gdb-peda$ next             # <= See the note below
...
22      strcpy(buffer, str);
gdb-peda$ p $ebp           # <= Get the ebp value
$1 = (void *) ADDR1   
gdb-peda$ p &buffer        # <= Get the buffer's address
$2 = (char (*)[100]) ADDR2
gdb-peda$ p/d ADDR1 - ADDR2
$3 = ???
gdb-peda$ quit             # <= exit
```

> ##### Note: Getting `bof()`'s `ebp`
> When `gdb` stops inside the `bof()` function, it stops before the `ebp` register is set to point to the current stack frame,
so if we print out the value of `ebp` here, we will get the caller's `ebp` value.
Thus, we need to use `next` to execute a few instructions
and stop after the `ebp` register is modified to point to the stack frame of the `bof()` function;
i.e., we need to get past the [function prologue](https://stackoverflow.com/questions/3699283/what-is-stack-frame-in-assembly/3700219#3700219)
to ensure that `ebp` is set to the callee's frame pointer, not the caller's frame pointer.

> ##### Note: The Woes of Using A Debugger
> It should be noted that the frame pointer value obtained when using `gdb` is different from that during the actual execution (without using `gdb`).
This is because `gdb` has pushed some environment data into the stack before running the debugged program.
When the program runs directly without using `gdb`, the stack does not have that data, so the actual frame pointer value will be "larger" (aka higher in memory).
You should keep this in mind when constructing your payload.

#### Task 2.2 Launching Your Attack

To exploit the buffer-overflow vulnerability in the target program, you need to prepare a payload, and save it inside `badfile`.
One could do this manually _(sounds tedious...)_ or use another program, such as a Python script to help us make our `badfile` _(yay, Python!)_.
For this lab, we provide a skeleton program called `exploit.py`.
Note that the code is incomplete, however, and students need to replace some of the essential values in the code to generate a suitable `badfile`.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fcode%2Fexploit.py&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

After you finish the above program, run it.
This will generate the contents for your `badfile`.
Then run the vulnerable program for this task.
If your exploit is implemented correctly, you should be able to get a root shell!

```bash
$./exploit.py     # create the badfile
$./stack-L1       # launch the attack by running the vulnerable program
# <---------------- Bingo! Root shell! (You can also verify with commands like `id`)
```

In your lab report, in addition to providing screenshots and/or code/command snippets to demonstrate your investigation (Task 2.1) and attack (Task 2.2),
you also need to explain how the values used in your `exploit.py` were decided.
Since we provide the skeleton code (`exploit.py`),
these values really are the most important part of the attack;
a detailed explanation verifies that you understand what is going on here.
To be clear, only demonstrating a successful attack _without explaining why/how the attack works_ will not receive full credit.

### Task 3: Attacking a Vulnerable 32-bit Program Without Knowing the Buffer Size (Level 2)

In this task, you need to compile the vulnerable program into a 32-bit binary called `stack-L2`.

> The compilation and setup commands are already included in `Makefile`.

In the previous task (Level 1), you were able to use `gdb` to determine the size of the buffer.
In the real world, this piece of information is unlikely to be so readily accessible.
For example, if the target is a server program running on a remote machine, we will not be able to get a copy of the binary or source code,
making our approach in the previous task infeasible.
In this task, we are going to add a constraint:
**you can still use `gdb`, but you are not allowed to use it to derive the buffer size.**
(In reality, the buffer size is provided in `Makefile`, but you are not allowed to use that information in your attack.)

Your task is to get the vulnerable program to run your shellcode under this constraint.
**We assume that you do know the range of the buffer size**, which can be anywhere from 100 to 200 bytes.
Another fact that may be useful to you is that, due to the memory alignment, the value stored in the frame pointer is always a multiple of four (for 32-bit programs).

Please be noted, you are only allowed to construct one payload that works for any buffer size within this range.
_You will not get full credit if you use a brute-force method_,
i.e., iteratively trying a bigger/smaller buffer size each time.
In the real world, the more you try, the easier it will be for your attack to be detected and defended against.
That's why minimizing the number of trials is important for attacks.

In your lab report, please describe your method, and provide supporting evidence that demonstrates your successful attack.

### Tasks 4: Defeating `dash`'s Countermeasure

The `dash` shell in the Ubuntu OS drops privileges when it detects that the effective UID is not equal to the real UID (i.e., EUID != RUID),
which is the case in a set-uid program.
This is achieved by changing the effective UID back to the real UID, essentially, dropping any elevated privilege.

In previous tasks, we let `/bin/sh` points to another shell called `zsh`, which does not implement this countermeasure.
In this task, we will change our shell back to `dash`, and see how we can defeat this countermeasure.

First, set your shell back to `dash`:

```bash
$ sudo ln -sf /bin/dash /bin/sh
```

To defeat the countermeasure in our buffer-overflow attacks, all we need to do is to change the real UID, so it equals the effective UID.
When a root-owned set-uid program runs, the effective UID is zero, so _before we invoke the shell program_, we just need to change the real UID to zero
(which we can do... because at the time that we do this we are effectively running as root!).
We can achieve this by invoking `setuid(0)` before executing `execve()` in the shellcode.
The assembly code to do this is already inside the `call_shellcode.c` code
(it is commented out at the top of the file.)
You just need to add it to the beginning of the shellcode.

<!-- The following assembly code shows how to invoke `setuid(0)`. -->
<!-- The binary code is already put inside `call_shellcode.c`. -->
<!-- You just need to add it to the beginning of the shellcode. -->
<!-- Below is a summary of how new assembly code works: -->

<!--
```asm
; Invoke setuid(0): 32-bit
xor ebx, ebx      ; ebx = 0: setuid()'s argument
xor eax, eax
mov  al, 0xd5     ; setuid()'s system call number
int 0x80

; Invoke setuid(0): 64-bit
xor rdi, rdi      ; rdi = 0: setuid()'s argument
xor rax, rax       
mov  al, 0x69     ; setuid()'s system call number
syscall
```
-->

<!--
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fshellcode%2Fassembly_setuid0.asm&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fshellcode%2Fassembly_shellcode32.asm&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fshellcode%2Fassembly_shellcode64.asm&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>
-->

#### Task 4.1: Experimenting with Set-UID Assembly Code

Compile `call_shellcode.c` into root-owned binary.

> The Makefile in the `shellcode/` folder on GitHub has a target that you can use by running: `make setuid`

Run both the `a32.out` and `a64.out` shellcode programs _with_ and _without_ the assembly that makes the `setuid(0)` system call.

Please describe your observations and provide supporting evidence.

#### Task 4.2: Launching the Attack (Again)

Now, using the updated shellcode from the previous task, we can attempt the attack again on the vulnerable program, and this time, with the shell's countermeasure turned on.
Repeat your attack on the Level 1 executable (Task 2), and see whether you can get a root shell.
_(**Hint:** you should be able to!)_

After getting a root shell, please run the following commands to prove that
(1) you are using a shell with countermeasure, and
(2) you are running in a shell as root.

```
# ls -l /bin/sh /bin/zsh /bin/dash
# id
```

> Repeating the attacks on Level 2 and beyond is not required, but please do feel free to do that and see whether those attacks work!

### Task 5: Defeating ASLR

On 32-bit Linux machines, stacks only have 19 bits of entropy, which means the base address for the stack can have $$2^{19} = 524,288$$ possibilities.
This number is not that high and can be exhausted easily with a brute-force approach.
In this task, we use such an approach to defeat the ASLR countermeasure on our 32-bit VM.

#### Task 5.1: Attacking a System with ASLR Enabled

First, turn on ASLR using the following command:

```bash
$ sudo /sbin/sysctl -w kernel.randomize_va_space=2
```

Then, run the same kind of attack as before against `stack-L1`.

Please describe your observations and provide supporting evidence.

#### Task 5.2: A Brute Force Attack on a System with ASLR Enabled

Now, we can use a brute-force approach to attack the vulnerable program repeatedly, hoping that the address we put in the `badfile` will _eventually_ be correct...
For this task, you can use the following shell script to invoke the vulnerable program repeatedly (i.e., in an infinite loop!).
If your attack succeeds, the script will stop; otherwise, it will keep running.

Please describe your observations and provide supporting evidence.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F03_buffer_overflow%2Fcode%2Fbrute-force.sh&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

> Please be patient, as this may take a few minutes... but if it turns out that you are very unlucky, it may take longer... If this is the case, please don't invite me out to the casinos with you... :-)

> You only need to try this on `stack-L1`, which is a 32-bit program.
A Brute-force attack on 64-bit programs is much harder, because the entropy is much larger.
Although this is not required, free free to try it just for fun.
Maybe let it run overnight? Who knows, you may get lucky!

### Tasks 6: Experimenting with Other Countermeasures

In this task we will explore some of the other countermeasures that exist to defend against buffer overflow attacks.

#### Task 6.1: Turn on the StackGuard Protection

Many compilers, such as `gcc`, implement a security mechanism called *StackGuard* to prevent buffer overflows.
In the presence of this protection, the buffer overflow attacks we've studied in this lab will not work.
In our previous tasks, we disabled the StackGuard protection mechanism when compiling the programs.
In this task, we will turn it back on and see what happens.

> Before diving into this task, remember to turn off the address randomization if it is still enabled!

First, repeat the Level-1 attack (Task 2) with StackGuard off, and make sure that the attack is still successful.
Then, turn on the StackGuard protection by recompiling the vulnerable `stack.c` program without the `-fno-stack-protector` flag.
(In `gcc` version 4.3.3 and above, StackGuard is enabled by default.)
Now, conduct your attack again.

Please describe your observations and provide supporting evidence.

#### Task 6.2: Turn on the Non-Executable Stack Protection

In the past, Operating systems did allow executable stacks, but this is not common today:
In the Ubuntu OS,
the binary images of programs (and shared libraries) must declare whether they require executable stacks or not,
i.e., they need to mark a field in the program header of the ELF binary.
The kernel and dynamic linker can use this information to decide whether to make the stack of this  running program executable or non-executable.
Specifying this information is done automatically by our compiler, `gcc`, which by default makes stack non-executable.
While non-executable stacks is the default setting these days, we can specifically make it non-executable using the `-z noexecstack` flag when we compile the program.
In our previous tasks, we have used `-z execstack` to make stacks executable.

In this task, we will make the stack non-executable.
If you recall from Task 1, the `call_shellcode` program puts a copy of shellcode on the stack, and then executes the code from the stack.
Please recompile `call_shellcode.c` into `a32.out` and `a64.out` **without the `-z execstack` option**.

Please run them both and describe your observations. Also provide supporting evidence.

**Defeating the non-executable stack countermeasure.**
While we will not study this idea in this lab, it should be noted that non-executable stack only makes it impossible to run shellcode on the stack, it does not prevent buffer-overflow attacks.
Tthere are in fact other ways to run malicious code after exploiting a buffer-overflow vulnerability.
_(Think about it! How could this work?!)_
The *return-to-libc* attack is one such example.
If you are interested, there is another SEED Lab ([Return-to-libc Attack Lab](https://seedsecuritylabs.org/Labs_20.04/Software/Return_to_Libc/)) covering this topic.
I encourage you to check it out if you are interested!

## Lab Tasks - Grad Student Credit

In addition to the problems above, students enrolled in CSCI 594 must also complete the following problems.

Students enrolled in CSCI 476 are encouraged to try these problems, but are not expected to submit solutions for these problems.

### Task 7: Attacking a Vulnerable 64-bit Program (Level 3)

In this task, you need to compile the vulnerable program into a 64-bit binary called `stack-L3`.

> The compilation and setup commands are already included in `Makefile`.

Using `gdb` to conduct an investigation on 64-bit programs is the same as that on 32-bit programs.
The only difference is the name of the register for the frame pointer.
In the x86 architecture (32-bit), the frame pointer is known as `ebp`, while in the x86-64 (aka x64) architecture (64-bit), it is known as `rbp`.

##### Challenges Posed By 64-Bit Addresses
Compared to buffer-overflow attacks on 32-bit machines, attacks on 64-bit machines are more difficult.
The most difficult part relates to 64-bit addresses.
Although the x64 architecture supports a 64-bit address space, only the address from `0x00` through `0x00007FFFFFFFFFFF` is allowed.
That means for every address (8 bytes), the highest two bytes are always zeros.
This causes a problem...

In our buffer-overflow attacks, we need to store at least one address in the payload, and the payload will be copied onto the stack via `strcpy()`.
We know that `strcpy()`, however, will stop copying when it sees a zero byte.
Therefore, if any zero byte appears in the middle of the payload, the content following the zero byte will not be copied onto the stack.
How to solve this problem is the most difficult challenge in this attack.

In this task, you must figure out how to solve this problem and show that you can successfully exploit the vulnerable 64-bit program.

You must describe your method, and provide supporting evidence that demonstrates your successful attack.

### Task 8: Attacking a Vulnerable 64-bit Program (Level 4)

In this task, you need to compile the vulnerable program into a 64-bit binary called `stack-L4`.

> The compilation and setup commands are already included in `Makefile`.

The target program (`stack-L4`) in this task is similar to the one in the Level 2, except that the buffer size is extremely small.
Here, we set the buffer size to 10 (in Level 2 the buffer size was much larger).
Your goal is the same: **get a root shell by attacking this set-uid program**
You may encounter additional challenges in this attack due to the small buffer size.

You must describe your method, and provide supporting evidence that demonstrates your successful attack.


<!-- Standard Submission Info -->
{% include lab_submission.html %}
