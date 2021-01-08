---
layout: default
published: true
---

I'll keep a running collection of tools, papers, articles, and other interesting resources here.
Use as you see fit.

I may pull from here if relevant topics come up.
I'll also try to post links here to any relevant resources you share with me.

## Books
{:.titletext}
Required and optional course resources, reading materials, etc.
{:.subtitletext}

##### Required Textbook(s)
- Software Security: Principles, Policies, and Protection (SS3P). Mathias Payer (2019, v0.35). [[Website]](https://nebelwelt.net/SS3P/) [[PDF]](files/textbook-softsec.pdf)
> In this course we are using the version of the SS3P book from April 2019 (v0.35), which is freely available to students.
> For convenience and to ensure consistency, this version of the PDF is cached on our course website.
> See the official webpage for SS3P to access the most up-to-date version of the text.
> The author claims that: "​This book is, was, and always will be free and openly accessible in PDF form."

{%comment%}
<!-- - [Operating Systems: Internals and Design Principles (9th Edition)](https://www.amazon.com/Operating-Systems-Internals-Design-Principles/dp/0134670957), by William Stallings -->
<!--    - or check out this [eTextbook Version](https://www.chegg.com/textbooks/operating-systems-9th-edition-9780134670959-0134670957) -->
{%endcomment%}

##### Optional/Recommended Textbook(s)

<!-- Security -->
- [Computer & Internet Security: A Hands-on Approach (2nd Edition)](https://www.handsonsecurity.net). Wenliang Du (2019).
- [Security in Computing (5th Edition)](https://www.amazon.com/Security-Computing-5th-Charles-Pfleeger/dp/0134085043/ref=sr_1_1?keywords=Security+in+Computing&qid=1578348388&s=books&sr=1-1). Pfleeger, Pfleeger, and Margulies (2015).
- [The Craft of System Security (1st Edition)](https://www.amazon.com/Craft-System-Security-Sean-Smith/dp/0321434838). Sean Smith (2007).
- [Applied Cryptography: Protocols, Algorithms, and Source Code in C (2nd Edition)](http://www.amazon.com/Applied-Cryptography-Protocols-Algorithms-Source/dp/0471117099/ref=sr_1_1?ie=UTF8&s=books&qid=1233440847&sr=1-1). Bruce Schneier (1996).
- [Computer-Related Risks (1st Edition)](https://www.amazon.com/Computer-Related-Risks-Press-Peter-Neumann/dp/020155805X/ref=sr_1_1?ie=UTF8&s=books&qid=1233440795&sr=1-1). Peter G. Neumann (1995).

{%comment%}
<!-- OS -->
<!-- - [The C Programming Language](https://www.amazon.com/Programming-Language-2nd-Brian-Kernighan/dp/0131103628). Kernighan and Ritchie. -->
<!-- - [Pthreads Programming](https://www.amazon.com/PThreads-Programming-Standard-Multiprocessing-Nutshell/dp/1565921151). Nichols et al. -->
<!-- - [zyBook - Interactive Operating Systems Textbook (v2020)](https://learn.zybooks.com/zybook/MONTANACSCI460PetersFall2020) -->
<!-- - [Operating System Concepts - 8th Edition](https://www.amazon.com/Operating-Concepts-Silberschatz-Abraham-Hardcover-dp-B011DB56OO/dp/B011DB56OO/ref=mt_other?_encoding=UTF8&me=&qid=). Silberschatz, Galvin, Gagne (2011). -->
{%endcomment%}

## Tools & Technical References
{:.titletext}
Great reference materials for labs and programming
{:.subtitletext}

###### Environment Tools
- [Wireshark](https://www.wireshark.org)
- [Docker](https://www.docker.com)
- [VirtualBox](https://www.virtualbox.org)
  - [VirtualBox Networking Explained - NAT & Port Forwarding, Bridged, Internal, Host-Only (YouTube)](https://youtu.be/cDF4X7RmV4Q)
  - [VirtualBox Network Settings: Complete Guide](https://www.nakivo.com/blog/virtualbox-network-setting-guide/)
- [Vagrant](https://www.vagrantup.com)
  - [Getting Started tutorial](https://learn.hashicorp.com/vagrant)
 - [SSH (Secure Shell)](https://www.ssh.com/ssh/)
   - [My tutorial on setting up SSH on SEED VMs](ssh)
   - [OpenSSH Config File Examples](https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/)
   - [How to Create and Install SSH Keys From the Linux Shell](https://www.howtogeek.com/424510/how-to-create-and-install-ssh-keys-from-the-linux-shell/)
   - [ssh-keygen - Generate a New SSH Key](https://www.ssh.com/ssh/keygen/) (plus other helpful details)

###### Programming & Debugging
- [The C Beginner's Handbook: Learn C Programming Language basics in just a few hours](https://www.freecodecamp.org/news/the-c-beginners-handbook/)
  - [An Introduction to C Programming for Java Programmers]({{site.data.settings.reading}}/intro-to-C-for-java-programmers.pdf)
  - [System Programming Overview / Programming in C Refresher](http://www.lysator.liu.se/c/bwk-tutor.html)
  - [C and C++ in 5 days]({{site.data.settings.reading}}/C-in-5-days.pdf)
  - [The C Cheat Sheet](files/the-C-cheat-sheet.pdf)
- [GDB Cheatsheet](https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf)
- [A Nice `Makefile` Tutorial](https://gist.github.com/isaacs/62a2d1825d04437c6f08)
- [ASCII/Decimal/Hex/Octal Reference Table](https://i.stack.imgur.com/mij6M.jpg)
- [POSIX Threads Programming](https://computing.llnl.gov/tutorials/pthreads/)

###### Linux
- [Linux `man` pages](http://man7.org/linux/man-pages/dir_all_alphabetic.html) (online/HTML version)
- [Infographic: The Linux Kernel - What Is It, and How Does It Work?](https://www.cyberciti.biz/media/new/cms/2017/04/how-does-linux-kernel-works-explained.png)
- [Bash scripting cheatsheet](https://devhints.io/bash)
- [Browse the Linux Source Code *(thanks @bootlin!)*](https://elixir.bootlin.com/linux/latest/source)

###### More Technical References
- [A Tiny Guide to Programming in 32-bit x86 Assembly Language]({{site.data.settings.reading}}/tiny-guide-to-x86-assembly.pdf)
- [The 101 of ELF files on Linux: Understanding and Analysis](https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/)
- [PLT and GOT - the key to code sharing and dynamic libraries](https://www.technovelty.org/linux/plt-and-got-the-key-to-code-sharing-and-dynamic-libraries.html)
- [The Linux Kernel Module Programming Guide]({{site.data.settings.reading}}/readme-linux-kernel-programming-lkmpg.pdf)
- [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/)
- [Intel x86 Assembler Instruction Set Opcode Table](http://sparksandflames.com/files/x86InstructionChart.html)

## Articles, Research Papers, Feeds, Reading Lists
{:.titletext}
Want to go deeper? Here are some links to help you explore more!
{:.subtitletext}

##### Security

- IoT Security and Privacy Reading List
  [[GitHub]](https://github.com/Beerkay/IoTResearch)
- The Greatest Hits in Side Channel Attacks
  [[Website]](https://noorsiddiqui.com/greatest-hits-in-sidechannel-attacks/)
- How to Create a Password That is Actually Secure
  [[Article]](https://www.freecodecamp.org/news/actually-secure-passwords/)
- At death’s door for years, widely used SHA1 function is now dead
  [[Article]](https://arstechnica.com/information-technology/2017/02/at-deaths-door-for-years-widely-used-sha1-function-is-now-dead/)
  _#CollisionAttack #IdenticalPrefixCollision_{:.text-muted}
- PGP keys, software security, and much more threatened by new SHA1 exploit
  [[Article]](https://arstechnica.com/information-technology/2020/01/pgp-keys-software-security-and-much-more-threatened-by-new-sha1-exploit/)
  _#ChosenPrefixAttack_{:.text-muted}
- SHA-1 is a Shambles: First Chosen-Prefix Collision on SHA-1 and Application to the PGP Web of Trust (USENIX Security'20)
  [[Full Paper]](https://eprint.iacr.org/2020/014.pdf)
- Small world with high risks: a study of security threats in the npm ecosystem (USENIX Security'19)
  [[Full Paper]](https://www.usenix.org/conference/usenixsecurity19/presentation/zimmerman)
- in-toto: Providing farm-to-table guarantees for bits and bytes (USENIX Security'19)
  [[Full Paper]](https://www.usenix.org/system/files/sec19-torres-arias.pdf)
- Detecting and Characterizing Lateral Phishing at Scale (USENIX Security'19)
  [[Full Paper]](https://www.usenix.org/conference/usenixsecurity19/presentation/ho)
- Invisible Mask: Practical Attacks on Face Recognition with Infrared (arXiv'18)
  [[Full Paper]](https://arxiv.org/abs/1803.04683)
- "I was told to buy a software or lose my computer. I ignored it": A study of ransomware (SOUPS'19)
  [[Full Paper]](https://www.usenix.org/conference/soups2019/presentation/simoiu)
- Four different tricks to bypass StackShield and StackGuard protection
  [[Full Paper]](https://www.cs.purdue.edu/homes/xyzhang/spring07/Papers/defeat-stackguard.pdf)

##### Systems
- An analysis of performance evolution of Linux’s core operations (SOSP'19)
[[Summary]](https://blog.acolyer.org/2019/11/04/an-analysis-of-performance-evolution-of-linuxs-core-operations/)
[[Full Paper]](https://dl.acm.org/doi/10.1145/3341301.3359640)
- A `fork()` in the road (HotOS'19)
[[Full Paper]](https://www.microsoft.com/en-us/research/uploads/prod/2019/04/fork-hotos19.pdf)
- My VM is Lighter (and Safer) than your Container (SOSP'17)
[[Full Paper]](https://dl.acm.org/citation.cfm?id=3132763)
- Granular Computing (HotOS'19)
[[Full Paper]](https://dl.acm.org/citation.cfm?id=3321447)
- Practical Safe Linux Kernel Extensibility (HotOS'19)
[[Full Paper]](https://dl.acm.org/citation.cfm?id=3321429)
- Efficient Scalable Thread-Safety-Violation Detection - Finding thousands of concurrency bugs during testing  (SOSP'19)
[[Full Paper]](https://www.microsoft.com/en-us/research/uploads/prod/2019/09/sosp19-final193.pdf)
- Twizzler: An Operating System for Next-Generation Memory Hierarchies (2017)
[[Full Paper]](https://www.ssrc.ucsc.edu/pub/bittman-ssrctr-17-01.html)
- CheriABI: enforcing valid pointer provenance and minimizing pointer privilege in the POSIX C run-time environment (ASPLOS'19)
[[Summary]](https://blog.acolyer.org/2019/05/28/cheri-abi/)
[[Full Paper]](https://www.cl.cam.ac.uk/research/security/ctsrd/pdfs/201904-asplos-cheriabi.pdf)
- Compress Objects, Not Cache Lines: An Object-Based Compressed Memory Hierarchy (ASPLOS'19)
[[Summary]](https://blog.acolyer.org/2019/05/24/zippads/)
[[Full Paper]](https://people.csail.mit.edu/poantsai/papers/2019.zippads.asplos.pdf)
