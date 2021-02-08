---
layout: default
---

<!-- links -->
[SEED Labs]: https://seedsecuritylabs.org

## SEED Labs

In this class, you will work through lab assignments---hands-on exercises to guide you through real, practical activities related to a class topic.
Similar to a Physics or Chemistry classes, you will follow the lab instructions and produce a lab report.

<!-- You will submit your lab reports as a **PDF** through **D2L**. -->

The labs we will use this term are from the [SEED Labs] project that started at Syracuse University in New York.
Started in 2002, funded by a total of 1.3 million dollars from NSF, and now used by over a thousand educational institutes worldwide,
  the SEED project's objective is to develop hands-on laboratory exercises (called SEED labs)
  for computer and information security education,
  and to help instructors adopt these labs in their curricula at no charge.
We, along with over a thousand other educational institutions around the world, thank Professor Wenliang Du for this superb effort.

<!-- ## Lab Assignments -->
For our lab assignments you will want to have the SEED VM properly configured in VirtualBox.
Specifically, we recommend using the **pre-built SEED VM (Ubuntu 20.04 VM)**.
See the [SEED Labs setup page](https://seedsecuritylabs.org/labsetup.html) for more information.

{% include assignments.html %}

## Tips for Writing Lab Reports

> **NOTE:** All labs are individual labs.
You are encouraged to discuss ideas, concepts, and strategies with others, but each student must independently carry out the tasks in the labs and submit their own lab write-up.
You should not copy code or command line tasks from other students.
Any submissions found in violation will receive an automatic 0, and the misconduct will be reported to the Office of the Dean of Students at Montana State University.
(See: [Academic Misconduct @ MSU](https://www.montana.edu/deanofstudents/academicmisconduct/academicmisconduct.html))

- Lab write-ups must be composed in valid [Markdown](https://www.markdownguide.org) format. *(Make sure you check that it renders correctly!)*
- Lab write-ups should be concise, but detailed enough to convince graders that you've completed each task.
- For each new question/task, you should clearly identify the question/task that you are solving.
- Address each problem and any subproblems (aka tasks/subtasks), providing code snippets, screenshoots, explanations, etc. as necessary to show your work.
- Each lab should be organized within its own subdirectory (`lab01/`, `lab02/`, `lab03/`, ...).
  - The main write-up should be in a file named `README.md` within the correct subdirectory (e.g., `lab02/README.md`).
  - Any source code or other supporting files should also be located within the relevant subdirectory  (e.g., `lab02/script.py`).
  - Please use a [`.gitignore` file to ignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)
       files that should not get tracked in your git repository.
       **DO** commit your code and files that are needed to build/run/explain your submission.
       **DO NOT** commit executables or other generated files (e.g., `.o` files, swap files).

#### Example Structure of a Lab Report (`README.md`)
{:.pb-2}

Here is a link to my demo repo that I setup to make some of the formatting expectations clear.
- [Raw Markdown (on GitHub)](https://raw.githubusercontent.com/traviswpeters/csci-476-594-spring2021-private/main/lab00/README.md)
- [Rendered Markdown (on GitHub)](https://github.com/traviswpeters/csci-476-594-spring2021-private/blob/main/lab00/README.md)

> **Please Note:** Try to follow the format of the header in my example EXACTLY!

> **Please Note:** I do NOT want your GID, I want to see your Net ID!

> **Please Note:** You'll notice that my demo repo is public so that you all can access it - but yours really should be **private**!
