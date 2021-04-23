---
layout: default
tags: [labs, seed, final]
dirname: 'final'
#dircode: 'final'
labprefix: 'Lab 09'
labtitle: 'Final Lab'
title: 'Final Lab'
duedate: 'Tuesday [04/27/2021] @ 11:59 AM (MT)'
released: True
---

# {{page.labprefix}}: {{page.labtitle}}
{:.pb-4}

<div class="alert alert-dismissible alert-danger text-center" markdown="1">
_**Please Remember:**_ <br/>
The deadline for this lab is a hard deadline. <br/>
No submissions will be graded after **{{page.duedate}}**.
{:.lead}
</div>

## {{page.labtitle}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}

The Final Lab will give you an opportunity to explore ideas we've covered over the course of this semester.
The format of this "final" is intentionally designed to be like any other lab in this course with one caveat:
The Final Lab is to be completed _**individually**_.
You are allowed to use any resources available to you (VM, notes, slides, textbook, Internet, etc.),
but you cannot ask someone---other than the course instructor---for help or get someone to solve the problems for you.
To be clear, posting questions or responses online is not allowed (no posting on Slack, D2L, or else where).
You can use Slack to direct message (DM) me if you need to ask me questions.
Any work used to arrive at a solution must be shown.
If an online resource was used, it must be cited.
As with most of our past labs, the planned duration for the Final Lab is 1 week.
_(I think it should take approximately 3 hours to actually complete the final lab)._

## Lab Tasks
<!-- {:.titletext} -->
<!-- This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM). -->
<!-- {:.subtitletext} -->

### Statement of Academic Honesty
<!-- ### Statement of Academic Honesty and Integrity -->

You _**must**_ include the following statement at the top of your submission (substituting your first name, last name, and Net ID, of course).

> I **firstname lastname (Net ID)** agree that the solutions presented below are entirely my own.<br/>
> If I have used resources that are not my own, I have included appropriate citations.

Failure to include this statement will result in an immediate 0 on the Final Lab; _we will not grade submissions without this statement!_

Failure to adhere to this policy will result in an immediate 0 on the Final Lab.

### Task 1: Short Answer

> Short Answer. Please be clear and concise. (We only want to see that you understand what these concepts are.)

##### Task 1.1 **(5 points)**{:.score}

Both `system()` and `execve()` can be used to execute external programs. Why is `system()` considered to be unsafe while `execve()` is considered to be safe? 

##### Task 1.2 **(5 points)**{:.score}

For the Shellshock vulnerability to be exploitable, two conditions need to be satisfied. What are these two conditions?

##### Task 1.3 **(5 points)**{:.score}

Suppose we run
```bash
$ nc -l 7070
```
on Machine 1 (IP address is 10.0.2.6),
and we then type the following command on Machine 2 (IP address is 10.0.2.7).

```bash
$ /bin/cat < /dev/tcp/10.0.2.6/7070 >&0
```
Describe what is going to happen. 

##### Task 1.4 **(5 points)**{:.score}

What is ASLR and why does ASLR make buffer-overflow attacks more difficult?

##### Task 1.5 **(5 points)**{:.score}

What is the underlying cause for XSS vulnerabilities?

##### Task 1.6 **(5 points)**{:.score}

What is the difference between reflected XSS and stored XSS?

##### Task 1.7 **(5 points)**{:.score}

In the Diffie-Hellman key exchange, Alice sends $$ g^x \bmod p $$ to Bob, and Bob sends $$ g^y \bmod p $$ to Alice.
How do they get a common secret?

##### Task 1.8 **(5 points)**{:.score}

Why do we use hybrid encryption? Why don't we simply use public key cryptography to encrypt everything?

##### Task 1.9 **(5 points)**{:.score}

- **(Part 1)** When you run programs at the command line (e.g., `ls`, `cat`, `top`) or link to libraries (e.g., `libc`),
how are these programs/libraries found?
- **(Part 2)** What is a potential risk of using this approach to find programs/libraries?

##### Task 1.10 **(5 points)**{:.score}

Identify at least three countermeasures to buffer-overflow attacks and briefly describe how they work.










### Task 2: Guest Visit Questions

> Long Answer. These problems may warrant more elaborate responses than in Task 1, but please try to keep your responses clear and concise.

#### Task 2.1: Security in the Real World: Crypto **(10 points)**{:.score}

Please recall our class on 4/20 with a guest visit from **Ryan Darnell**.
During this class we discussed a real-world scenario where you needed to design a feature that used
an assortment of ideas we've learned about from cryptography to protect project files.
Your primary objectives were to
(1) securely store sensitive project data, while
(2) trying to minimize overhead and data loss (e.g., due to partial file corruption).

Please write a brief summary of the approach you settled on, the pros/cons, and any potential challenges or issues with your approach.

#### Task 2.2: Security in the Real World: Compliance **(10 points)**{:.score}

Please recall our class on 4/22 with a guest visit from **Reese Pearsall**.
During this class we learned about real-world work that aims to automate aspects of compliance.

Please answer the following questions:
- In your own words, what is compliance and why is compliance important?
- What is a compliance framework?
- Please provide three (3) examples of a compliance rule/test, and briefly explain why this check could be helpful towards ensuring compliance?








### Task 3: I Got 99 Problems But Auditing Ain't One

Early in the semester we studied Set-UID programs and considered scenarios where Set-UID programs can be useful.
We considered various examples of Set-UID programs.
One example was a program to allow users to change their passwords.
Another example was a program to allow users to read (but not write) any file on a system, regardless of who owns the file.
In this task, we will consider the latter example ("system auditing"),
and you will demonstrate your understanding of the Set-UID mechanism as well as how it can be exploited.

[audit.c]: https://gist.github.com/traviswpeters/76be624297fb69a30254042f712d6d0a
[audit2.c]: https://gist.github.com/traviswpeters/e9786c9d8ff9cea79a78c76343953e93

> For these tasks, you'll need [audit.c] and [audit2.c].
Both programs are "gists" stored on GitHub - click the link to access them or see below.


##### Task 3.1 **(5 points)**{:.score}

Please read the source code for [audit.c] and, at a high level, describe what this program does and how it works.

> You can assume that the program is compiled into an executable, which is then modified to be a privileged Set-UID program.

<script src="https://gist.github.com/traviswpeters/76be624297fb69a30254042f712d6d0a.js"></script>

##### Task 3.2 **(5 points)**{:.score}

With our understanding of [audit.c] from the previous task,
please demonstrate how it can be exploited to run an arbitrary command with elevated privileges.

For your demonstration, you'll need to compile [audit.c] and  make the resulting executable a privileged Set-UID program.

> You are permitted to change `/bin/sh` to point to a shell without the setuid != ruid countermeasure.

##### Task 3.3 **(5 points)**{:.score}

Suppose now that we want to fix the issue from the previous part.
A sysadmin tweaks the previous audit program and instead uses the new [audit2.c] program.
You can see that this new program uses `execve()` instead of `system()`, and now it uses the `more` program instead of `cat`.

Please read the manual of the `more` program to find out what the auditor could do to gain more privileges beyond what is intended by the sysadmin.
Your task is to explain, and demonstrate, how the auditor can exploit [audit2.c] to do something they should not be able to do.

Again, for your demonstration, you'll need to compile [audit2.c] and make the resulting executable a privileged Set-UID program.

> You are permitted to change `/bin/sh` to point to a shell without the setuid != ruid countermeasure.

<script src="https://gist.github.com/traviswpeters/e9786c9d8ff9cea79a78c76343953e93.js"></script>








### Task 4: Inject This...

In this task you will demonstrate your understanding of SQL Injection attacks.

> In tasks 4.2 and 4.3 we ask that you not only explain your approach,
but also that you **demonstrate** that your approach can be successful.
For the purposes of this task, you may take whatever approach you like to conduct your demonstration.
For example, you may modify any of the code/examples from the lab on SQL Injections,
you may use the MySQL command line, etc.
Whatever you do, you must explain your setup and your approach,
and you must present evidence that your attack was successful.

##### Task 4.1 **(5 points)**{:.score}

To defeat SQL injection attacks, a web application has implemented a filtering scheme on the client side:
basically, on the page where users type their data, a filter is implemented using JavaScript.
It removes any special character found in the data, such as apostrophes, characters for comments, and keywords reserved for SQL statements.
_**Assume that the filtering logic does it job, and can escape/remove all the code from the data**_.

Is this solution able to defeat SQL injection attacks? Explain.

##### Task 4.2 **(5 points)**{:.score}

The following SQL statement is sent to the database to add a new user to the database,
where the content of the `$name` and `$passwd` variables are provided by the user,
but the `EID` and `Salary` field are set by the system.
How can a malicious employee set his/her salary to a value higher than `80000`?
Please demonstrate and explain your approach.

```sql
$sql = "INSERT INTO employee (Name, EID, Password, Salary)
        VALUES ('$name', 'EID6000', '$passwd', 80000)";
```

##### Task 4.3 **(5 points)**{:.score}
The following SQL statement is sent to the database, where `$eid` and `$passwd` contain data provided by the user.
An attacker wants to try to get the database to run an arbitrary SQL statement.
What should the attacker put inside `$eid` or `$passwd` to achieve that goal?
Please demonstrate and explain your approach.

> In this task, you can and should enable the code/database to be able to execute multiple statements. 

```sql
$sql = "SELECT * FROM employee  
        WHERE eid='$eid' and password='$passwd'";
```







## Lab Tasks - Grad Student Credit

In addition to the problems above, students enrolled in CSCI 594 must also complete the following problems.

Students enrolled in CSCI 476 are encouraged to try these problems, but are not expected to submit solutions for these problems.






### Task 5: Can't Hack This

In this task you will demonstrate your understanding of various cryptographic operations.
Specifically, your objective will be to use your understanding of cryptographic operations to uncover secret information given only partial context.

##### Task 5.1: XOR Galore **(10 points)**{:.score}

I've hidden some data using XOR with a single byte.

```bash
73626960647f6b206821204f21254f7d694f7624662065622127234f726927756d
```

You need to figure out what byte I used and what the correct decoded data is.

You'll likely want to make sure you understand how the XOR operator works and/or write a little script (e.g., Python) to help you solve this problem.

**Tips & Notes:**
- Don't forget to decode from hex first.
- The correctly decoded data takes the form `crypto{ ...FLAG... }`.
- A brute force solution to this problem is permissible.

> **Credit:** This problem was inspired by 'The Favorite byte' challenge on [cryptohack.org](https://cryptohack.org).

##### Task 5.2: I Lost My Key... Can You Help Me Out? **(10 points)**{:.score}

In this task, you are given a plaintext, IV, and the corresponding ciphertext,
and your objective is to write a Python program to find the key that is used for the encryption.

The plaintext, ciphertext, and IV are as follows:
```
Plaintext (21 characters) : This is a top secret.
Ciphertext (in hex format): 1e479ff8738e2dc5612c00e92782ea81
                            1231cbad8a6a9f9f52ff9c9148b9956a
IV (in hex format)        : aabbccddeeff00998877665544332211
```

You know the following **facts**:
- The `aes-128-cbc` cipher is used for the encryption.
- The key used to encrypt this plaintext is an English word shorter than 16 characters;
  the word can be found in a typical English dictionary.
- Since the word has less than 16 characters (i.e. 128 bits),
  pound signs (#: hexadecimal value is 0x23) are appended to the end of the word to form a key of 128 bits.  
  (**NOTE:** You should download the following English word list: [English Word List](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_Encryption/files/words.txt).)

**Tips & Notes:**
- This does not require a lot of code. My solution is less than 30 lines of Python code.
- If you are stuck, the _"Recommended Extras"_ in Week 14 have helpful videos and examples of using crypto APIs in Python programs.
- A brute force approach is permissible and straightforward. (In fact, I'm not sure of a better way...)
- I recommend storing the plaintext, ciphertext, and IV as variables in your program (no need to read these in from files).
- In this task, you are supposed to write your own program to invoke the crypto library.
  No credit will be given if you simply use the `openssl` commands to do this task.


<!-- Submission Instructions -->
{% include lab_submission.html %}



<!-- ### Candidates... -->

<!--
##### Task 4.3: Hack the Prof. [10 points]

- Travis uses a grading script written in python to download student repos.
- The script downloads information provided by students from the questionnaire.
- Specifically, the script extracts the string from the `githuburl` column of the CSV file generated from the questionnaire.
- The script uses the dangerous `os.system()` call to run `git clone STUDENT_REPO_URL`.
- In the same directory, Travis maintains a text file named NETID.txt with each student’s overall course grade.
- How could you exploit Travis's grading script to change your own grade to an A?
- How could you exploit Travis's grading script to change the grades of other students?
-->

<!-- ##### Task -->
<!-- Alice runs a Set-UID program that is owned by Bob. -->
<!-- The program tries to read from `/tmp/x`, which is readable to Alice, but not to anybody else. -->
<!-- Can this program successfully read from the file? -->
<!-- Please demonstrate. -->

<!--
##### Task
Sam found a very useful web page, which contains links to many interesting papers.
He wants to download those papers.
Instead of clicking on each of the links, he wrote a program that parses a HTML web page, get the papers URLs from the web page,
and then use a program called `wget` to fetch each identified URL.
See the following code snippet:

```C
char command[100];
char* line, url;
line = getNextLine(file);// Read in one line from the HTML file.
while (line != NULL) {
  // Parse the line to get a URL string.
  url = parseURL (line);
  if (url != NULL){
    // construct a command, and execute it
    sprintf(command, "%s %s", "wget", url);
    system(command);
}
  line = GetNextLine(file);
}
```

The function `sprintf()` is quite similar to `printf()`,
except that `sprintf()` puts the output in a buffer pointed by the first argument,
while `printf()` sends the output to the display.
Please be noted that the functions `getNextLine()` and `parseURL()` are also implemented by Sam (their code is not displayed here).
(Recall that the program `wget` is a command-line program in Unix that can be used to download web files from a given URL.)

The owner of the web page knows what Sam is doing with his page;
he wants to attack Sams program.
He knows the code above, but he does not know how Sam implements `GetNextLine()` or `ParseURL()`,
but he suspects that Sam may make some mistakes there.
(1) If you were the attacker, please describe how you could attack Sam's program.
(2) If you were Sam, how could you fix the problem?
-->
