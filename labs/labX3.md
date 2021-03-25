---
layout: default
tags: [labs, seed]
dirname: 'crypto'
dircode: 'crypto'
labprefix: 'Lab 06'
labtitle: 'Introduction to Cryptography'
title: 'Introduction to Cryptography'
duedate: 'Tuesday [03/30/2021] @ 11:59 AM (MST)'
released: True
---

# {{page.title}}
##### Due: {{ page.duedate }}
{:.text-center .pt-0 .m-0}

## Objective

This assignment is meant to be a fun, low stakes way to introduce you to cryptography.
For this assignment we'd like you to work through the following questions.
Please make sure your submission is organized and easy to follow.
Your responses should be clear and concise.

### Task 1: Reflection

After watching [the videos linked from the course schedule]({{ site.baseurl }}/#week11), please write a brief reflection on cryptography.

Specifically, please speak to the following topics:

- What is cryptography?
- What problem(s) does it solve?
- What potential issues are there in using and designing cryptography?
- What are some of the big, important ideas in cryptography?

### Task 2: Substitution Ciphers & Frequency Analysis

It is well-known that monoalphabetic substitution cipher (also known as monoalphabetic cipher) is not secure,
because it can be subjected to frequency analysis.
In this lab, [you are given a ciphertext](https://raw.githubusercontent.com/traviswpeters/cs476-code/master/06_ske/files/ciphertext.txt)
that is encrypted using a monoalphabetic cipher;
namely, each letter in the original text is replaced by another letter, where the replacement does not vary
(i.e., a letter is always replaced by the same letter during the encryption).

_**Your task**_ is to find out the original text using frequency analysis.

> **NOTE:** It is known that the original text is an article written in English.

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

#### Tips & Resources

Using frequency analysis, you can decipher the plaintext for some of the characters fairly easily.
For those characters, you may want to change them back to their plaintext form as you go, which may give you more clues.
Since the ciphertext is all lowercase,
I recommend you use capital letters to show your intermediate plaintext/plaintext characters --- then, if the same letter appears as both ciphertext and plaintext,
we know which is plaintext and which is ciphertext.
You can use the `tr` command to help with this.

For example, in the following, we replace letters "a", "e", and "t" in `in.txt`
with letters "X", "G", "E", respectively; the results are then saved in `out.txt`.

```bash
$ tr 'aet' 'XGE' < in.txt > out.txt
```

In general:

```bash
# encipher
$ tr 'a-z' '...key...' < plaintext > ciphertext

# decipher
$ tr '...key...' 'a-z' < ciphertext > plaintext
```

There are many online resources that you can use to help with frequency analysis:

- This [frequency analysis website](https://www.dcode.fr/frequency-analysis), for example, <!-- (http://www.richkni.co.uk/php/crypta/freq.php) -->
  can be used to show statistics from a ciphertext.
  (_You are allowed to use other tools if you find a better one, but please include a citation and any relevant info about how you used the tool._)
- Or this [frequency counter script](https://github.com/traviswpeters/cs476-code/blob/master/06_ske/files/freq_counter.py) from our course GitHub can be used to do basically the same thing.
- This [Wikipedia page on Frequency Analysis](https://en.wikipedia.org/wiki/Frequency_analysis) provides frequencies for a typical English plaintext.
- [Bigram Frequency](https://en.wikipedia.org/wiki/Bigram)
- [Trigram Frequency](https://en.wikipedia.org/wiki/Trigram)

</div>
</div>
<!-- END Special Section -->

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary mt-3" markdown="1">
<div class="card-body" markdown="1">

#### How We Made the Ciphertext

Below, we describe how we pre-process and encrypt the original article to produce the ciphertext.

You don't need to do anything here - this section is included here simply to give you insight into how the article was prepared for this task.

<!-- Instructors can use the same method to encrypt an article of their choices, instead of asking students to use the ciphertext made by us. -->

- **Step 1:** Generate the encryption key, i.e., the substitution table.
  We permute the alphabet from "a" to "z" using Python, and use the permuted alphabet as the key:

    ```python
    #!/bin/env python3
    import random
    s = "abcdefghijklmnopqrstuvwxyz"
    list = random.sample(s, len(s))
    key = ''.join(list)
    print(key)

    # Example Output: sxtrwinqbedpvgkfmalhyuojzc
    ```

- **Step 2:** Apply some transformations to the text to simplify the original article.
  We convert all uppercase letters to lowercase letters, and then remove all punctuation and numbers.
  We do keep spaces between words, so you can still see the boundaries between words in the ciphertext.
  In a more realistic application of encryption that uses a monoalphabetic cipher, spaces would be removed.
  We keep the spaces here to simplify the task.
  We can apply the transformations described in this step by running the following commands:

    ```bash
    $ tr [:upper:] [:lower:] < article.txt > lowercase.txt         # uppercase to lowercase
    $ tr -cd '[a-z][\n][:space:]' < lowercase.txt > plaintext.txt  # preserve only letters and spaces
    ```

- **Step 3:** We use the `tr` command to do the encryption.
  We only encrypt letters, while leaving the space and return characters alone.

    ```bash
    $ tr 'abcdefghijklmnopqrstuvwxyz' 'sxtrwinqbedpvgkfmalhyuojzc' < plaintext.txt > ciphertext.txt
    ```

We have created a ciphertext using a different encryption key (not the one shown above).
<!-- It is included in `Labsetup.zip` file, which can be downloaded from the lab's website. -->
<!-- Your job is to use the frequency analysis to figure out the encryption key and the original plaintext. -->

</div>
</div>
<!-- END Special Section -->


<!-- Submission Instructions -->
{% include lab_submission.html %}
