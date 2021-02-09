---
layout: default
tags: [labs, seed]
id: 'lab02'
title: 'Lab 01: Environment Variables & Set-UID Programs'
duedate: 'Tuesday [02/09/2021] @ 11:59 AM (MST)'
published: True
---

## {{page.title}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}

The learning objective of this lab is for students to understand how
environment variables affect program and system behaviors. Environment
variables are a set of dynamic named values that can affect the way
running processes will behave on a computer. They are used by most
operating systems since they were introduced into Unix in 1979. Although
environment variables affect program behaviors, how they achieve that is
not well understood by many programmers. As a result, if a program uses
environment variables, but the programmer does not know that they are
used, the program may have vulnerabilities.

In this lab, students will understand how environment variables work,
how they are propagated from parent process to child, and how they
affect system/program behaviors. We are particularly interested in how
environment variables affect the behavior of Set-UID programs, which
are usually privileged programs. This lab covers the following topics:

-   Environment variables
-   Set-UID programs
-   How to securely invoke external programs
-   Capability leaking
-   The dynamic linker/loader

### Resources

- Code related to this lab can be found in our [class's GitHub repository](https://github.com/traviswpeters/cs476-code). Specifically, see `01_envvars_setuid/`.
- Chapters 1 & 2 in the [SEED Textbook]({{site.data.settings.textbookseedlink}})
- A related [video lecture](https://www.handsonsecurity.net/video.html) (Udemy course) recorded by Kevin Du.
- [Checklist for Security of Setuid Programs](https://seedsecuritylabs.org/Labs_16.04/Software/Environment_Variable_and_SetUID/files/setuid.pdf)
- [Setuid Demystified](http://www.cis.syr.edu/%7Ewedu/minix/projects/setuid_paper.pdf), Chen et al.
- [How to write a Setuid program](http://nob.cs.ucdavis.edu/%7Ebishop/secprog/1987-sproglogin.pdf), Matt Bishop

## Lab Tasks
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

### Task 1: Manipulating Environment Variables

In this task, we study the commands that can be used to set and unset
environment variables. We are using Bash in the seed account. The
default shell that a user uses is set in the `/etc/passwd` file (the
last field of each entry). You can change this to another shell program
using the command `chsh` (please do not do it for this lab). Please do
the following tasks:

#### Task 1.1

Use the `printenv` or `env` command to print out the environment
variables. If you are interested in viewing particular environment
variables, such as `PWD`, you can use `printenv PWD` or `env | grep PWD`.

#### Task 1.2

Use `export` and `unset` to set or unset environment variables. It
should be noted that these two commands are not separate programs;
they are two of the Bash's internal commands (you will not be able
to find them outside of Bash).

### Task 2: Passing Environment Variables (Parent -> Child)

In this task, we study how a child process gets its environment
variables from its parent. In Unix, `fork()` creates a new process by
duplicating the calling process. The new process, referred to as the
**child**, is an exact duplicate of the calling process, referred to as the
**parent**; however, several things are not inherited by the child (please
see the manual of `fork()` by typing the following command: `man fork`).
In this task, we would like to know whether the parent's environment
variables are inherited by the child process or not.

#### Task 2.1

Please compile and run the following program, and describe your observations.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fmyprintenv.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

#### Task 2.2

Now comment out the `printenv()` statement in the "child process" case,
and uncomment the `printenv()` statement in the "parent process" case.
Compile and run the code again, and describe your
observation. Save the output in another file (e.g., `myenv2`).

#### Task 2.3

Compare the difference of these two files using the `diff` command.
Please draw your conclusions.

### Task 3: Environment Variables and `execve()`

In this task, we study how environment variables are affected when a new
program is executed via `execve()`. The function `execve()` calls a
system call to load a new command and execute it; this function never
returns. No new process is created; instead, the calling process's text,
data, bss, and stack are overwritten by that of the program loaded.
Essentially, `execve()` runs the new program inside the calling process.
We are interested in what happens to the environment variables; are they
automatically inherited by the new program?

#### Task 3.1

Please compile and run the following program, and describe your observations.
This program simply executes a program called `/usr/bin/env`,
which prints out the environment variables of the current process.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fmyenv_execve.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

#### Task 3.2

Change the invocation of `execve()` in to the following;
describe your observations.

```c
execve(argv[0], argv, environ);
```

#### Task 3.3

Please draw your conclusions regarding how the new program gets its environment variables.

### Task 4: Environment Variables and `system()`

In this task, we study how environment variables are affected when a new
program is executed via `system()`. This function is used
to execute a command, but unlike `execve()`, which directly executes a
command, `system()` actually executes `/bin/sh -c command`, i.e., it
executes `/bin/sh`, and asks the shell to execute `command`.

If you look at the implementation of the `system()` function, you will
see that it uses `execl()` to execute `/bin/sh`; `execl()` calls
`execve()`, passing to it the environment variables array. Therefore,
using `system()`, the environment variables of the calling process are
passed to the new program `/bin/sh`. Please compile and run the
following program to verify this.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fmyenv_system.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>


### Task 5: Environment Variables and Set-UID Programs

Set-UID is an important security mechanism in Unix operating systems.
When a Set-UID program runs, it assumes the owner's privileges. For
example, if the program's owner is root, when anyone runs this program,
the program gains root's privileges during its execution. Set-UID
allows us to do many interesting things, but since it escalates the
user's privilege, it is quite risky. Although the behavior of Set-UID
programs is decided by their program logic, not by users,
**users can indeed affect the behavior via environment variables**.
To understand how
Set-UID programs can be affected, let us first figure out whether
environment variables are inherited by a Set-UID program's process
from the user's process.

#### Task 5.1

Use the following program that can print out all the environment variables in the current process.
Verify that your implementation correctly prints the environment variables.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fmyenv_environ.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

#### Task 5.2

Compile the above program, change its ownership to `root`, and make it a Set-UID program.

```bash
$ sudo chown root myenv_environ   # chown = (ch)ange (own)er
$ sudo chmod 4755 myenv_environ   # chmod = (ch)ange file (mod)e bits
```

#### Task 5.3

In your shell (you need to be in a normal user account, not the `root` account),
use the `export` command to set the following environment variables _(**NOTE:** they may exist already!)_:

- `PATH` _--- prepend the current directory symbol to `PATH`_
- `LD_LIBRARY_PATH` _--- prepend the current directory symbol to `LD_LIBRARY_PATH`_
- `TASK5`  _--- this is a non-standard variable; define this however you want_

_To be clear, these environment variables should be set in the user's shell process._

> If you are uncertain about the `export` syntax, there is an example in Task 6.

After you have exported the above environment variables into the user's shell environment,
run the Set-UID program from Task 5.2 in your shell. After you type the
name of the program in your shell, the shell forks a child process, and
uses the child process to run the program. Please check whether all the
environment variables you set in the shell process (parent) are inherited in the Set-UID child process.
Describe your observations.
If there are any surprises to you, describe them.

### Task 6: `PATH` and Set-UID Programs

In this task, we study how Set-UID programs deal with environment variables.
Specifically, we examine the `PATH` environment variable and its potential impact on Set-UID programs.
Because `system()` runs commands by invoking a shell, calling `system()` within a Set-UID program is quite dangerous.
One concern is that the actual behavior of the shell program can be affected by environment variables, such as `PATH`;
these environment variables are provided by the user, who may be malicious.
By changing these variables, malicious users can potentially control the behavior of the Set-UID program.

In `Bash`, you can change the `PATH` environment variable in the following way
(this example adds the directory `/home/seed` to the beginning of the `PATH` environment variable):

```bash
$ export PATH=/home/seed:$PATH
```

The Set-UID program below is supposed to execute the `/bin/ls`
command; however, the programmer only uses the relative path for the
`ls` command, rather than the absolute path:

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fls_vuln.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

Please compile the above program, change its owner to `root`, and make it a Set-UID program.

Can you make this Set-UID program run your code instead of `/bin/ls`?
If you can, is your code running with root privileges? Describe and explain your observations.

<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">
<h4 class="card-title">Shell Countermeasures</h4>
<h6 class="card-subtitle mb-2 text-muted">An important change is needed to circumvent shell countermeasures</h6>

The `system(cmd)` function executes the `/bin/sh` program first, and
then asks this shell program to run the `cmd` command. In Ubuntu 20.04
(and several versions before), `/bin/sh` is actually a symbolic link
pointing to `/bin/dash`. This shell program has a countermeasure that
prevents itself from being executed in a Set-UID process. Basically,
if `dash` detects that it is executed in a Set-UID process, it
immediately changes the effective user ID to the process's real user ID,
essentially dropping the privilege.    

Since our victim program is a Set-UID program, the countermeasure in
`/bin/dash` can prevent our attack. To see how our attack works without
such a countermeasure, we will link `/bin/sh` to another shell that does
not have such a countermeasure. We have installed a shell program called
`zsh` in our Ubuntu 20.04 VM. We use the following commands to link
`/bin/sh` to `/bin/zsh`:

```bash
$ sudo ln -sf /bin/zsh /bin/sh
```

</div>
</div>

### Task 7: `LD_PRELOAD` and Set-UID Programs

In this task, we study how Set-UID programs deal with environment variables.
Specifically, we examine the `LD_PRELOAD` environment variable and its potential impact on Set-UID programs.
Several environment variables, including
`LD_PRELOAD`, `LD_LIBRARY_PATH`, and others with the `LD_` prefix influence the behavior of the dynamic linker/loader.
A dynamic linker/loader is the part of an operating system (OS) that loads an executable from persistent storage to RAM, and
links the shared libraries needed by the executable at run time.

In Linux, `ld.so` or `ld-linux.so`, are the dynamic linker/loader
(`ld-linux.so` supports ELF, which is a common file format for executables today).
Among the environment variables that affect the behavior of the dynamic linker/loader, `LD_LIBRARY_PATH` and `LD_PRELOAD` are the two that we are concerned in this lab.
In Linux,
`LD_LIBRARY_PATH` is a colon-separated set of directories where libraries should be searched for first, before the standard set of directories.
`LD_PRELOAD` specifies a list of additional, user-specified, shared libraries to be loaded before all others.
In this task, we will only focus on `LD_PRELOAD`.

#### Task 7.1

First, we will see how these environment variables influence the behavior of the dynamic linker/loader when running a normal program.
Please follow these steps:

1. Let us build a dynamically linked library.
   Create the following program, and name it `mylib.c`.
   This program basically overrides the `sleep()` function
    in `libc`:

    ```c
    #include <stdio.h>
    void sleep (int s)
    {
      /* If this is invoked by a privileged program, you can do damages here! */
      printf("I am not sleeping!\n");
    }
    ```

2.  We can compile the above program using the following commands
   (in the `-lc` argument, the second character is the lowercase letter "L"):

    ```bash
    $ gcc -fPIC -g -c mylib.c
    $ gcc -shared -o libmylib.so.1.0.1 mylib.o -lc
    ```

3.  Now, set the `LD_PRELOAD` environment variable:

    ```bash
    $ export LD_PRELOAD=./libmylib.so.1.0.1
    ```

4.  Finally, compile the following program `myprog` within the same
    directory as the dynamically linked library you created above (`libmylib.so.1.0.1`):

    ```c
    /* myprog.c */
    #include <unistd.h>
    int main()
    {
      sleep(1);
      return 0;
    }
    ```

#### Task 7.2

After you have done Task 7.1, run `myprog` under the following conditions, and observe what happens.

-   Make `myprog` a regular program, and run it as a normal user.
-   Make `myprog` a Set-UID root program, and run it as a normal user.
-   Make `myprog` a Set-UID root program, export the `LD_PRELOAD`
    environment variable again in the root account and run it.
    > You can run `sudo su` to login as root. Make sure to `exit` when you are done.

-   Make `myprog` a Set-UID user1 program (i.e., the owner is user1,
    which is another user account), export the `LD_PRELOAD` environment
    variable again in a different user's account (not-root user) and run
    it. _(**NOTE:** You may create a new, non-root user for this part)_

#### Task 7.3

You should be able to observe different behaviors in the scenarios
described above, even though you are running the same program. You need
to figure out what causes the difference. Environment variables play a
role here. Please design an experiment to figure out the main causes,
and explain why the behaviors you observed in the previous part are different.
*(__HINT:__ the child process may not inherit the `LD_` environment variables!).*

### Task 8: `system()` versus `execve()`

Although `system()` and `execve()` can both be used to invoke new programs,
`system()` is quite dangerous if used in a privileged program, such as Set-UID programs.
We have seen how the `PATH` environment variable can
affect the behavior of `system()` (because that variable affects how the underlying shell that `system()` invokes works).
`execve()` does not have this problem, because it does not invoke a shell.
Invoking a shell has dangerous consequences that are concerning even if environment variables are handled properly.
_(i.e., the real issue is much worse than improperly handling environment variables!)_

Consider the following scenario.
Bob works for an auditing agency, and he needs to investigate a company
for a suspected fraud. For the purpose of the investigation, Bob needs to be
able to **read** all the files in the company's Unix system.
To protect the integrity of the system, however, Bob should not be able to **modify** any files.
To achieve this goal, Vince, the superuser of the system, wrote a special root-owned Set-UID program (see below),
and then gave "execute" permissions to Bob. This program requires Bob to type a
file name at the command line, and then it will run `/bin/cat` to
display the specified file. Since the program is running as a root, it
can display any file Bob specifies.
However, since the `cat` program does not support write operations,
Vince is confident that Bob cannot use this special audit program to modify any files.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fcatall.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

#### Task 8.1

Compile the above program and make it a root-owned Set-UID program.
This program uses `system()` to invoke the `cat` command.
Assuming the role of Bob, can you compromise the integrity of the system?
For example, can you remove a file that is not writable to you?

#### Task 8.2

Comment out the `system(command)` statement, and uncomment the `execve()` statement;
the program will use `execve()` to invoke the command.
Compile the program, and make it a root-owned Set-UID program.
Do your attacks from Task 8.1 still work?
Please describe and explain your observations.

### Task 9: Capability Leaking

To follow the **Principle of Least Privilege**, Set-UID programs should
relinquish their root privileges as soon as such privileges are no longer needed.
Moreover, sometimes, the program needs to hand over its
control to the user; in this case, root privileges must be revoked. The
`setuid()` system call can be used to set the user identity of the calling process, which can be used to revoke privilege.
According to the manual,

> `setuid()` sets the effective user ID of the calling process.
> If the calling process is privileged (...), the real UID and saved set-user-ID are also set.

Therefore, if a Set-UID program with
effective UID 0 calls `setuid(n)`, the process will become a normal
process, with its UID being set to `n`.

When revoking privileges, one of the most common mistakes is _capability leaking_.
The process may have gained some privileged capabilities when
it was still privileged; when the privilege is downgraded, if the
program does not clean up those capabilities, they may still be
accessible by the non-privileged process. In other words, although the
effective user ID of the process becomes non-privileged, the process is
still privileged because it possesses privileged capabilities.

Compile the following program, change its owner to root, and make it a
Set-UID program. Run the program as a normal user, and describe what
you observe. Will the file `/etc/zzz` be modified? Please explain.

<!-- https://emgithub.com -->
<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F01_envvars_setuid%2Fcap_leak.c&style=github&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

## Submission

{% include lab_submission.html %}
