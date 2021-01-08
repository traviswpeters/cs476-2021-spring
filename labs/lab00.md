---
title: 'Lab 00: Getting Started'
localurl: './SEEDVM_VirtualBoxManual.pdf'
seedurl: 'https://seedsecuritylabs.org/Labs_16.04/Documents/SEEDVM_VirtualBoxManual.pdf'
layout: default
tags: [labs, seed]
published: True
duedate: 'Tuesday [01/19/2021] @ 12:00 PM (MST)'
---

# {{page.title}}
##### Due: {{ page.duedate }}
{:.text-center .pt-0 .m-0}

## Objective

This assignment is meant to be a low stakes way to introduce you to this course and some of the technologies we will use.
You may have opportunities to complete parts of this assignment in class, but you should plan to work on this outside of class as well.
Of particular importance, by the end of this assignment you should be setup with a suitable environment for completing assignments for this course.
You will also have had the chance to practice with tools we'll be using this semester.

## Task 1: Sign-up on Slack
{:.pt-1}

Please sign-up for our course {{site.data.settings.slack}}!

## Task 2: Getting Your Repo Set Up
{:.pt-1}

You will use a **private** GitHub repository for all of your work this semester,
which will enable you to share code with the course staff so that we can assess your work and provide feedback.
Please follow the instructions below to get set up.

#### 2.1 Setup Your PRIVATE Repo
{:.pt-1 .pb-1}

Please follow these instructions

- Create a *private* repository in your own account by
    - Going to <https://github.com/new>
    - Enter the name `csci-476-594-spring2021-private`
    - Select `Private`
    - Navigate to the `Settings` >> `Manage Access` section
    - Add {{site.data.settings.github}} as a collaborator

Once your repository is initialized, you can pull it down to your local machine.
Instructions can be found on the home page of your new repository.

<!--
Next, you should add the class repository as an upstream git repo:

```bash
$ git remote add upstream https://github.com/msu/csci-476-594-spring2021.git
$ git pull upstream master
$ git push origin master
```
This will synchronize your private repository with the class repository.

When you want to get an update from the public class repository you can run this command:

```
$ git pull upstream master
```
-->

#### 2.2 Setup Your SSH Identity
{:.pt-1 .pb-1}

Setting up an SSH identity makes it possible for you to interact with GitHub repos via the command line without having to re-enter your password all the time.
If you've already setup an SSH key to have passwordless access to GitHub on the command line, you can probably skip this step.
You can check to see if you have a key setup by looking in your `~/.ssh/` directory.
If there is nothing there, or if you don't have a key dedicated to using with GitHub, you should read the following article:
[Adding a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

#### 2.3 Register Your PRIVATE Repo
{:.pt-1 .pb-1}

You will provide information about your PRIVATE repo in the course questionnaire. _(see below)_

<!--
For example, if I were a student with the NetID `W43m513` and my GitHub username was `studentIAm`
I would add a file named `W43m513.txt` to `/repos` with the following line:
```bash
git@github.com:studentIAm/csci-460-fall2020-private.git
```
-->

## Task 3: VirtualBox & The SEED VM
{:.pt-1}

**VirtualBox** is an application that helps us create and run virtual machines (VMs).
The folks behind **SEED Labs** have created a VM that is specifically configured to aid us in our work.
In this task, you'll get these tools setup on your machine.
By the end of this task you should have a fully functional VM where you can run commands, compile software, etc., which is crucial for the rest of this semester.

1. Install [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads) on your machine. Select the relevant download for your OS and architecture under "VirtualBox X.Y.Z platform package."
2. Follow the SEED VM setup instructions to configure your VM.
   <!-- - Go to [https://seedsecuritylabs.org/labsetup.html](https://seedsecuritylabs.org/labsetup.html) and scroll down to the `Ubuntu 20.04 VM` section. -->
   - From [https://seedsecuritylabs.org](https://seedsecuritylabs.org/labsetup.html), I recommend **Approach 1: Use a pre-built SEED VM** under the **Ubuntu 20.04 VM** section.
     - Download [SEED-Ubuntu20.04.zip](https://drive.google.com/file/d/138fqx0F8bThLm9ka8cnuxmrD6irtz_4m/view?usp=sharing) _(The download will take a bit)_
     - Unzip it, and you should be able to see a folder.
     - Then follow the ["Install SEED VM on VirtualBox" manual](https://github.com/seed-labs/seed-labs/blob/master/manuals/vm/seedvm-manual.md).

## Task 4: Course Questionnaire
{:.pt-1}

Please fill out our {{site.data.settings.questionnaire}}!

## Task 5: Review
{:.pt-1}

We will use a variety of tools and languages in this class.
Here is a list of some things you may want to review.

> **NOTE:** You don't have to do anything here necessarily, but if one of these topics is unfamiliar I recommend you take some time to do some individual review.
> This list is not exhaustive, but it highlights some of the major tools and language we will use in this class.
> In my experience, students are happier later in the term if they spend some time up front reviewing some of these topics.

- Your submissions in this course should have a `README.md` composed in **Markdown**. _[**<< cheatsheet >>**](https://devhints.io/markdown)_
    - _**(Try it!)**_ Do a quick survey of READMEs on GitHub to see how other people/projects compose READMEs. (Focus on projects with lots of stars.)

- We will make heavy use of **Git** to version control software, share code, and submit assignments.
  _[**<< cheatsheet >>**](https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf)_
    - _**(Try it!)**_ Go through a [Git tutorial](https://learngitbranching.js.org).

- You will spend a lot of time at the **command line** in this course. _[**<< cheatsheet >>**](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)_
    - _**(Try it!)**_ Go through a [command line tutorial](https://ryanstutorials.net/linuxtutorial/).

- We will read and write **C** programs in this course.
  _[**<< cheatsheet >>**](../files/intro-to-C-for-java-programmers.pdf)_
    - _**(Try it!)**_ Go through some of the [C examples from our OS class](https://www.traviswpeters.com/cs460-2020-fall/pa0/#task-6-programming-in-c).

- We will read and write **Python** programs in this course.
  _[**<< cheatsheet >>**](https://overapi.com/python)_
    - _**(Try it!)**_ Go through a [Python tutorial](https://www.learnpython.org).

- **Makefiles** can be complicated, but they can be extremely useful even if we use only a small subset of Makefile features.
    _[**<< cheatsheet >>**](https://gist.github.com/evertrol/4b6fd05f3b6be2b331c60638b1af7101)_
    - _**(Try it!)**_ Go through a [Makefile tutorial](https://makefiletutorial.com).
    <!-- [Clark Grubb's Makefile Style Guide](https://clarkgrubb.com/makefile-style-guide) -->

- We will often make use of popular **debugging tools** (e.g., `gdb`, `valgrind`) _[**<< cheatsheet >>**](https://wiki.tiker.net/ToolCheatSheet/)_
    - _**(Try it!)**_ Try out some of the debugging tools from the cheatsheet on C programs from the C examples linked above.

<!--
2. Create a README file for your submission.
This file should be named `README.md` and it should be at the top-level directory of your project (a.k.a. the "root" or "base").
**At a minimum your README should include:**
- An overview of what this project (PA0, in this case) is all about. This should be a few sentences at most.
- An overview of what is "here" _(i.e., What is in the folder you submit? Are there subdirectories? Are there any particularly important/useful files?)_
- Examples of how to work with this project _(e.g., What `make` targets should be run to compile you code? How can I quickly verify that the project has been compiled correctly and works? Are there command line arguments or features that are useful to demonstrate to help others effectively use and understand your code?)._
- Responses to the tasks/questions throughout PA0.
 -->

## What To Turn In & Instructions On Submitting your Assignment
{:.pt-1}

Please submit your assignment via your **private** GitHub repository. Specifically,

- Create a top-level `README.md` file (written in Markdown) in your private repo that has your
    - **First Name**,
    - **Last Name**,
    - **NetID**,
    - **CSCI 476** or **CSCI 594** (depending on which section you are enrolled in)
    - A good **Email Address** for you.
- Create a `lab00/` directory for this assignment.
- Create a `lab00/README.md` file (written in Markdown) for this assignment.
- Within your `lab00/README.md`, please include the following:
  - The same information that you included in your top-level `README.md`.
  > **NOTE:** While it may seem redundant, please always include the information requested above at the top of your README for each lab.
  > This makes things a lot easier for us when we need to dig into your repo to provide help and feedback specific to a lab.

  - A screenshot verifying your response to the questionnaire.
  - A screenshot verifying your SEED VM is setup and running on your machine.
  - Please write 3 brief _lessons learned_ from the Tasks and/or review in this assignment.
- Make sure you have added {{site.data.settings.github}} as a collaborator to your project so we can access your submission.
