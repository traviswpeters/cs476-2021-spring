---
layout: default
tags: [labs, seed]
dirname: 'lab06'
dircode: '06_ske'
labprefix: 'Lab 06'
labtitle: 'Secret-Key Encryption Lab'
title: 'Lab 06: Secret-Key Encryption Lab'
duedate: 'Tuesday [04/06/2021] @ 11:59 AM (MST)'
released: True
---

# {{page.labprefix}}: {{page.labtitle}}
{:.pb-4}

## {{page.labtitle}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}

The learning objective of this lab is for students to get familiar with key concepts behind secret-key encryption and some common attacks on encryption.
From this lab, students will gain first-hand experience in encryption algorithms, encryption modes, padding, and initialization vectors (IV).
Moreover, students will learn how to use tools, and write programs, to encrypt and decrypt messages.

There are many common mistakes made by developers when using various encryption algorithms and modes.
These mistakes weaken the strength of the encryption, which can make data vulnerable.
This lab exposes students to some of these mistakes,
and gives students the opportunity to work through the process of exploiting weak encryption.

This lab covers the following topics:

- Secret-key encryption
<!-- - Substitution cipher and frequency analysis -->
- Encryption modes, IV, and padding
- Common mistakes when using encryption algorithms
<!-- - Programming using the crypto library -->

### Resources

- Code related to this lab can be found in `{{page.dircode}}/` of our [class's GitHub repository](https://github.com/traviswpeters/cs476-code).
- [Sample Code --- Encryption w/ the OpenSSL Cryptography and SSL/TLS Toolkit](https://www.openssl.org/docs/man1.0.2/man3/EVP_EncryptInit.html)
<!-- - [ciphertext.txt (Task 1)](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_Encryption/files/ciphertext.txt) -->
<!-- - [pic_original.bmp (Task 3)](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_Encryption/files/pic_original.bmp) -->
<!-- - [English Word List (Task 7)](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_Encryption/files/words.txt) -->
- Chapter 21 in the [SEED Textbook]({{site.data.settings.textbookseedlink}}).

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

## Environment Setup

In this lab, we use a container to run an encryption oracle.

The container is only needed in Task 6.2 (graduate credit), so you do not need to start the container for other tasks.

### Container Setup and Commands

{% include lab_docker_overview.html classdir="06_ske" %}

</div>
</div>
<!-- END Special Section -->

## Lab Tasks
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

### Task 1: Encryption Ciphers and Modes

In this task, you will experiment with various encryption algorithms and modes.

You can use the following `openssl enc` command to encrypt/decrypt a file.

```bash
$ openssl enc -CIPHERTYPE -e -in plain.txt -out cipher.bin -K KEY -iv IV -p

# Summary of common `openssl enc` options:
# -in <file>     input file
# -out <file>    output file
# -e             encrypt
# -d             decrypt
# -K             the key (in hex format) must follow this option
# -iv            the IV (in hex format) must follow this option
# -[pP]          print the iv/key (then exit if -P)
```

To view the manual pages, type `man openssl` and `man enc`.

You need to replace `-CIPHERTYPE` with a specific cipher type, such as `-aes-128-cbc`, `-bf-cbc`, `-aes-128-cfb`, etc.

You also need to replace `KEY` and `IV` with the encryption/decryption key and initialization vector, respectively.

_**Your task**_ is to use the above `openssl enc` command to encrypt data using at least 3 different ciphers.

### Task 2: Comparing Encryption Modes

In the supplied files, [`files/pic_original.bmp`](https://github.com/traviswpeters/cs476-code/blob/master/06_ske/files/pic_original.bmp) is a simple picture
in the [BMP - or bitmap - file format](https://en.wikipedia.org/wiki/BMP_file_format).

We would like to encrypt this picture so that anyone without the encryption key is unable to know what the file contains.

#### Task 2.1

In this task, you must encrypt the file using the ECB (Electronic Code Book) and CBC (Cipher Block Chaining) modes, and then do the following:

1. Since this encrypted picture is in fact a picture, please start by trying to view the encrypted picture as any other picture.
   Feel free to use your favorite picture viewing software.
   Note, however, that for a properly-formatted `.bmp` file, the first 54 bytes must contain the header information about the picture;
   because the image is in fact encrypted, we have to set the file header correctly so that the encrypted file will be recognized as a legitimate `.bmp` file.
   To achieve this, we must replace the header of the encrypted picture with that of the original picture.

   To make this change we can you could, for example, use the `bless` hex editor tool (already installed on our VM) to directly modify binary files.
   (In general you are free to use [any hex editor you like](https://www.tecmint.com/best-hex-editors-for-linux/).)
   Alternatively, we can also use the following commands to extract the **header** from `p1.bmp`, the **body** (data) from `p2.bmp` (starting from offset 55 to the end of the file),
   and then combine the header and body together into a new file (`new.bmp`).

    ```bash
    $ head -c 54 p1.bmp  > header
    $ tail -c +55 p2.bmp > body
    $ cat header body > new.bmp
    ```

2. Display the encrypted picture using a picture viewing program (we have installed an image viewer program called `eog` on the VM).
   Can you derive any useful information about the original picture from simply viewing the encrypted picture?
   Please explain your observations.

#### Task 2.2

Now, select a picture of your choice, repeat the experiment above, and report your process and observations.

### Task 3: Padding

For block ciphers, when the size of a plaintext is not a multiple of the block size, padding may be required.
The [PKCS\#5 padding scheme](https://www.cryptosys.net/pki/manpki/pki_paddingschemes.html) is widely used by many block ciphers.
We will conduct the following experiments to understand how this type of padding works.

#### Task 3.1

Create three files, which contain 5 bytes, 10 bytes, and 16 bytes, respectively.
We can use the following command to create such files.
The following example creates a file `f1.txt` with length 5 (note that, without the `-n` option, the length will be 6, because a newline character will be added by `echo`):

```bash
$ echo -n "12345" > f1.txt
```

Then use `openssl enc -aes-128-cbc -e` to encrypt these three files using 128-bit AES with CBC mode.

_Please describe the size of the encrypted files._

It is interested to examine what is added as padding during encryption.
To achieve this goal, we will decrypt these files you created above using `openssl enc -aes-128-cbc -d`.
Unfortunately, decryption will automatically remove any padding by default, making it impossible for us to examine the padding.
However, the command does have an option called `-nopad`, which disables the step that attempts to remove padding.
By looking at the resulting decrypted data, we can then see what data are used in the padding.
Please use this technique to figure out what padding values are added to the three files.

It should be noted that padding data may not be printable, so you need to use a hex tool to display the content.
The following example shows how to display a file in the hex format:

```
$ hexdump -C p1.txt
00000000  31 32 33 34 35 36 37 38  39 49 4a 4b 4c 0a   |123456789IJKL.|
$ xxd p1.txt
00000000: 3132 3334 3536 3738 3949 4a4b 4c0a            123456789IJKL.
```

#### Task 3.2

Please repeat the previous task for each of the following modes of operation using the `aes` cipher with 128-bit keys: ECB, CFB OFB.

Please report which modes have padding and which ones do not.
For those that do not need padding, please explain why.

### Task 4: Error Propagation & Corrupted Ciphertext

To understand the error propagation property of various encryption modes, in this task you will create a ciphertext using a specific encryption mode,
intentionally corrupt a bit in the ciphertext, decrypt the corrupted ciphertext, and then examine the result.

#### Task 4.1: Predictions

Before you actually conduct this task, please answer the following question:

_How much information can you recover by decrypting the corrupted file, if the encryption mode is ECB, CBC, CFB, or OFB, respectively?_

Please note your answers (and provide any relevant justification for each) before proceeding with actually carrying out the steps below.

#### Task 4.2: ECB & Data Corruption

_After_ you have answered the question in Task 5.1, please carry out the following steps:

1. Create a text file that is at least 1000 bytes long.
2. Encrypt the file using the AES-128 cipher.
3. Intentionally corrupt the file: change a single bit in the 55th byte in the encrypted file. (You can achieve this corruption using any hex editor.)
4. Decrypt the corrupted ciphertext file using the correct key and IV.

How much information can you recover by decrypting the corrupted file if the mode of operation used in encryption is ECB?
Please provide justification.

#### Task 4.3: CBC & Data Corruption

Please repeat Task 5.2, but this time use the CBC mode when encrypting/decrypting data.

#### Task 4.4: CFB & Data Corruption

Please repeat Task 5.2, but this time use the CFB mode when encrypting/decrypting data.

#### Task 4.5: OFB & Data Corruption

Please repeat Task 5.2, but this time use the OFB mode when encrypting/decrypting data.

### Task 5: Common Mistakes with IVs

Most of the encryption modes require an Initialization Vector (IV).
Properties of an IV depend on the cryptographic scheme used.
If we are not careful in selecting IVs,
_the encrypted data may not be secure, even though we are using a secure encryption algorithm and mode!_
The objective of this task is to help students understand some of the problems that arise if an IV is not chosen properly.
<!-- The detailed guidelines for this task is provided in Chapter 21.5 of the SEED book. -->

#### Task 5.1: Uniqueness of the IV

A basic requirement for the IV is ***uniqueness***, which means that no IV may be reused under the same key.
To understand why, please encrypt the same plaintext using (1) two different IVs, and (2) the same IV.
Please describe your observations and explain why the IV needs to be unique.

## Lab Tasks - Grad Student Credit

In addition to the problems above, students enrolled in CSCI 594 must also complete the following problems.

Students enrolled in CSCI 476 are encouraged to try these problems, but are not expected to submit solutions for these problems.

### Task 6: Exploiting Common Mistakes with IVs

_These tasks are a continuation of Task 5, and allow students to delve deeper into issues that can arise from reusing IVs._

#### Task 6.1: Known Plaintext Attack
<!-- was Task 5.2 -->

One may argue that if the _plaintext_ does not repeat, using the same IV (and key) is safe.
In this task we will investigate this matter.

> The attack used in this experiment is known as the _**known-plaintext attack**_,
> which is an attack model for cryptanalysis where the attacker has access to both the plaintext and its encrypted version (ciphertext).
> If this situation can lead to the revealing of further secret information, the encryption scheme is not considered to be secure.

In this task we will specifically look at the [Output Feedback (OFB) mode](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Output_feedback_(OFB)).

Assume that the attacker gets hold of a plaintext ($$P1$$) and a ciphertext ($$C1$$).

**Question:** _Can they decrypt other (different) encrypted messages if the same IV is always used?_

To examine whether this is possible,
assume you are given the following information.
Please try to figure out the actual content of $$P2$$ based on $$C2$$, $$P1$$, and $$C1$$.

```
Plaintext  (P1): This is a known message!
Ciphertext (C1): a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159
```

```
Plaintext  (P2): (unknown to you)
Ciphertext (C2): bf73bcd3509299d566c35b5d450337e1bb175f903fafc159
```

_**Hint:**_
You may find it useful to have a tool that can help you XOR some values in this task.
You are free to use whatever XOR tool you want.
We provide a simple python script (see below).
Others have used an online [XOR calculator](https://xor.pw).
Feel free to do whatever makes the most sense for you.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F06_ske%2Ffiles%2Fsample_xor.py&style=monokai&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

<!-- **Question:**   -->
<!-- If we replace OFB in this experiment with CFB (Cipher Feedback), _how much of P2 can be revealed?_ -->
<!-- (You only need to answer the question; there is no need to demonstrate.) -->

#### Task 6.2: Chosen Ciphertext Attack
<!-- was Task 5.3 -->

From the previous tasks, we now know that IVs should not be reused.
Another important requirement for IVs is that they need to be _**unpredictable**_ for many schemes,
i.e., IVs need to be randomly generated.
In this task, we will observe what happens if IVs are predictable.

Assume that Bob just sent an encrypted message, and Eve knows that its content are either "Yes" or "No";
Eve can see the ciphertext and the IV used to encrypt the message, but since the AES encryption algorithm has been used, Eve has no idea what the actual content is.
However, Eve knows that Bob uses predictable IVs, so Eve knows exactly what IV Bob is going to use next.

A good cipher should not only tolerate the known-plaintext attack described previously,
it should also tolerate the _**chosen-plaintext attack**_,
which is an attack model for cryptanalysis where the attacker can obtain the ciphertext for an arbitrary plaintext.
Since AES is a strong cipher that can tolerate the chosen-plaintext attack, Bob does not mind encrypting any plaintext provided by Eve;
he does use a different IV for each plaintext, but unfortunately, the IVs he generates are not random, and they can always be easily predicted by Eve.

You must construct a message $$P2$$, and ask Bob to encrypt it and give you the resulting ciphertext.

Your objective then is to use this opportunity to figure out whether the actual content of $$P1$$ is "Yes" or "No".

> _**Hint 1:** You will need to manually pad the message since we will perform XOR operations with various 16 bytes values._
> _For ideas on how to pad your message, recall our discussion of PKCS#5._

> _**Hint 2:**_
> _Having trouble getting started?_
> _Read up a bit more on initialization vectors._
> _For example, you can read this Wikipedia page for ideas:_
> _[https://en.wikipedia.org/wiki/Initialization_vector](https://en.wikipedia.org/wiki/Initialization_vector)._

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">
#### The Oracle

For this task, your are given an encryption oracle which simulates Bob and encrypts message with 128-bit AES with CBC mode.

After you start the container (recall: Environment Setup), you can get access to the oracle by running the following command within the SEED VM:

```bash
$ nc 10.9.0.80 3000
```

Once connected, the oracle prints some known information and asks waits for you to provide your input:

```
Bob's secret message is either "Yes" or "No", without quotations.
Bob's ciphertex: 54601f27c6605da997865f62765117ce
The IV used    : d27d724f59a84d9b61c0f2883efa7bbc

Next IV        : d34c739f59a84d9b61c0f2883efa7bbc
Your plaintext : 11223344aabbccdd
Your ciphertext: 05291d3169b2921f08fe34449ddc3611

Next IV        : cd9f1ee659a84d9b61c0f2883efa7bbc
Your plaintext : <your input>
```

After showing you the _next_ IV, the oracle will ask you to input a plaintext message (as a hex string).
The oracle will encrypt the message with the next IV and output the new ciphertext.
You can try different plaintexts, but keep in mind that every time, the IV will change.
(But it is predictable!)
To simplify your job, the oracle prints out the next IV.
To exit from the interaction, press `ctrl-C`.
</div>
</div>

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary mt-2" markdown="1">
<div class="card-body" markdown="1">
#### Additional Reading
There are more advanced cryptanalysis techniques on IV that is beyond the scope of this lab.
Students can read [this article](https://defuse.ca/cbcmodeiv.htm), for example.
Because the requirements on IV really depend on cryptographic schemes,
it can be difficult to remember what properties should be maintained when we select an IV.
However, we will be safe if we always use a new IV for each encryption,
and if new IV is generated using a good pseudorandom number generator, which makes the IV impossible to predict by adversaries.
If you are interested in this topic, there is another SEED lab,
[Pseudo Random Number Generation Lab](https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_Random_Number/),
which delves deeper into the topic of how to generate cryptographically strong pseudo random numbers.
</div>
</div>


<!--
### Task 7: Programming using the Crypto Library

In this task, you are given a plaintext and a ciphertext, and your goal is to write a Python program
_**to find the key that is used for the encryption**_.

You do know the following facts:
- The `aes-128-cbc` cipher is used for the encryption.
- The key used to encrypt this plaintext is an English word shorter than 16 characters;
  the word can be found in a typical English dictionary.
  Since the word has less than 16 characters (i.e. 128 bits),
  pound signs (#: hexadecimal value is 0x23) are appended to the end of the word to form a key of 128 bits.
  (**NOTE:** You can download a English word list from the Internet.
  We have also linked one here: [English Word List](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_Encryption/files/words.txt).)

The plaintext, ciphertext, and IV are as follows:

```
Plaintext (total 21 characters): This is a top secret.
Ciphertext (in hex format): 764aa26b55a4da654df6b19e4bce00f4
                            ed05e09346fb0e762583cb7da2ac93a2
IV (in hex format):         aabbccddeeff00998877665544332211
```

**Notes:**
- In this task, you are supposed to write your own program to invoke the crypto library.
  No credit will be given if you simply use the `openssl` commands to do this task.
- If you choose to store the plaintext message in a file, and feed the file to your program, you need to check whether the file length is 21.
  If you type the message in a text editor, you need to be aware that some editors may add a special character to the end of the file.
  The easiest way to store the message in a file is to use the following command (the `-n` flag tells `echo` not to add a trailing newline):
  ```bash
  $ echo -n "This is a top secret." > file
  ```
- If you choose to write this in C,
  [sample code can be found here (OpenSSL docs)](https://www.openssl.org/docs/man1.0.2/man3/EVP_EncryptInit.html).
  When you compile your code using `gcc`, do not forget to include the `-lcrypto` flag,
  because your code needs the crypto library.
  See the following example:
  ```bash
  $ gcc -o myenc myenc.c -lcrypto
  ```

<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">
#### Note to Instructors
We encourage instructors to generate their own plaintext and ciphertext using a different key;
this way students will not be able to get the answer from another place or from previous courses.
Instructors can use the following commands to achieve this goal
(please replace the word `example` with another secret word, and add the correct number of \# signs to make the length of the string to be 16):
```bash
$ echo -n "This is a top secret." > plaintext.txt
$ echo -n "example#########" > key
$ xxd -p key
6578616d706c65232323232323232323
$ openssl enc -aes-128-cbc -e -in plaintext.txt -out ciphertext.bin \
      -K  6578616d706c65232323232323232323  \
      -iv 010203040506070809000a0b0c0d0e0f  \
$ xxd -p ciphertext.bin
e5accdb667e8e569b1b34f423508c15422631198454e104ceb658f5918800c22
```
</div>
</div>
-->

<!--
### Task EXTRA: Encrypting UDP Communication

So far, we have learned how to use the existing tools provided by `openssl`to encrypt and decrypt messages.
We would like to build our own tools.
Therefore, the objective of this task is to learn how to use `openssl`'s crypto library to encrypt/decrypt messages in programs.

OpenSSL provides an API called EVP, which is a high-level interface to cryptographic functions.
Although OpenSSL also has direct interfaces for each individual encryption algorithm, the EVP library provides a common interface for various encryption algorithms.
To ask EVP to use a specific algorithm, we simply need to pass our choice to the EVP interface.
Sample code is given in the [EVP_CipherInit](https://www.openssl.org/docs/man1.1.1/man3/EVP_CipherInit.html) manual.
Please get familiar with this program.

In this task, we will build a client/server program, which uses the UDP protocol and the communication will be encrypted.
The client and server side of the program should satisfy the following requirements:

- The data sent between the client and server should be encrypted using an encryption algorithm and mode of your choice
  (e.g. `aes-128-cbc`).

- The client program runs in a loop, and keeps asking the user to type a message.
  Once the user hits the return, the message will be sent to the server using UDP.
  Upon receiving the UDP packet, the server simply prints out the decrypted message.

- The client and server need a common secret key to encrypt the communication.
  Obviously, they cannot send the key to each other in plaintext.
  In practice, they need to run a key-exchange protocol to get the key.
  We will cover that protocol after we have learned the public key encryption.
  In this task, we assume that the client and server have already obtained a secret key,
  so we will just type in the key as an argument when we run the client and server programs.
  **Note:** You cannot hardcode the key in your program --- this is a very bad habit.

- The Initialization Vector (IV) needs to be randomly generated by the client, and should be sent to the server in plaintext.
  You can put the IV at the beginning of the UDP data.
  In your report, please answer why the client cannot reuse the IV throughout its execution
  (**Hint:** Try to fix your IV in your client program, then type the same message, and use Wireshark to see what you can infer about the encrypted data).
-->

<!-- Submission Instructions -->
{% include lab_submission.html %}
