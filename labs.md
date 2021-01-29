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

<!-- all normal labs -->
{% assign sorted_pages = site.pages | sort: 'duedate' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "labs" %}
- [{{page.title}}]({{site.baseurl}}{{page.url}}) _>> Due: **{{page.duedate}}**_{:.text-muted .ml-2}
  {:.m-0 .p-0}
{% endif %}
{% endfor %}
{% endfor %}
<!-- + final lab -->
<!-- <li><a href="{{ site.baseurl }}/labs/final.html">Final Lab</a></li> -->

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

##### Example Structure of a Lab Report (`README.md`):
<!-- At the top of each README include, at a minimum: -->

> **Title of Lab**  
> **FirstName** **LastName** **(NetID)** << NOT GID!  
> **Preferred Email Address**  
> **CSCI 476 or CSCI 594** << depending on the section you are enrolled in   
> **Date**

> **Task 1**  
> _...summary of the purpose of the task/question..._  
> _...solution / code snippets / screenshots / other evidence..._  
> _...observations / conclusions..._  

> **Task 2(a)**  
> _...summary of the purpose of the task/question..._  
> _...solution / code snippets / screenshots / other evidence..._  
> _...observations / conclusions..._  
> **Task 2(b)**  
> _...summary of the purpose of the task/question..._  
> _...solution / code snippets / screenshots / other evidence..._  
> _...observations / conclusions..._  

> ...
