---
layout: default
tags: [labs, seed]
title: 'Systems & Software - Towards Security'
duedate: 'Tuesday [02/02/2021] @ 11:59 AM (MST)'
#published: True
released: True
---

# {{page.title}}
##### Due: {{ page.duedate }}
{:.text-center .pt-0 .m-0}

## Objective

This assignment is meant to be a fun, low stakes way to get you thinking deeper about important ideas in computer systems and software.
This assignment should also give you more practice with using tools like Git, GitHub, Markdown, and even some programming (e.g., C).
For this assignment we'd like you to work through the following questions.
Please make sure your submission is organized and easy to follow.
Your responses should be clear and concise.

1. In your own words, please describe how the `fork()` and `exec()` syscalls work.
2. Make a diagram/sketch depicting how a program is laid out in memory when it is running.
   - Be sure to identify the major segments we discussed in class.
   - Provide a brief description of what things might be be contained in each of the segments and at least one concrete example.
3. As you’ve seen, an application running on a computer is organized into a few major sections, including various sections for code and data. Why do you think the distinction between code and data exists?
4. With our understanding of how an application is laid out in memory, what do you think are some of the threats we may need to be concerned about?
5. What is a "trust boundary"?
6. What are the major elements of a stack frame that we discussed in class?
7. If you haven't already, please make sure the class code is accessible on your VM (we'll reference it frequently throughout the semester).
    ```bash
    [seed@VM][~]$ git clone https://github.com/traviswpeters/cs476-code.git class-code
    ```
    Run the `probe` program:
    ```bash
    [seed@VM][~]$ cd class-code/00_intro/probe
    [seed@VM][~]$ make
    [seed@VM][~]$ ./probe
    ```
    In response to the following questions, please specify the relevant memory segment and any supporting evidence you may have observed.
    - Where is `main` located in memory?
    - Where is `printf` located in memory?
    - Where is `argv` located in memory?
    - Where is `environ` located in memory?
8. Please describe the stages of compilation that we discussed in class?

## Instructions On Submitting Your Assignment
{:.pt-1}

Please submit your assignment via your **private** GitHub repository.
Your work for this assignment should be located within a new directory named `system` within your repository.
Within this new directory, you should have a `README.md` written up in valid Markdown for your submission (i.e., `system/README.md`), along with any other files you create for this assignment.
For general tips on how to write and format your submission, please see the [Lab Info & Tips page](../labs).

> **REMEMBER:**
  Follow instructions and naming conventions EXACTLY!
> Beginning with this lab, we will start **deducting points** from submissions that do not adhere to explicit submission instructions.
