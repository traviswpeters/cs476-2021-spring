---
layout: default
---

<!-- Row 1 -->
<div class="row">

<div class="col-md-3 order-2 mt-3" markdown="1">
{% include contact.html %}
{% include contactTA.html %}
</div>

{%comment%}
<div class="col-md-3 order-2 mt-3" markdown="1">
{% include contactTA.html %}
</div>
{%endcomment%}

<div class="col-md-9 order-1 mt-3" markdown="1">
{% include about.html %}
</div>

</div>

## Logistics (In A Nutshell)
{:.titletext}
We will use **Zoom** to hold synchronous/online class sessions and office hours, **Slack** for synchronous and asynchronous communication and discussions, **GitHub** for collaborating on code and submitting assignments, and **GradeScope** for submitting exams.
{:.subtitletext}

##### Lectures

<!-- & <a target="_blank" href="https://www.montana.edu/calendar/locations.php?building=3"><i class="fas fa-map-pin"></i> Barnard Hall 108</a> -->
-  [Synchronous/Online Class (Zoom)]({{site.data.settings.zoomlink}})
| {{site.data.settings.hours}}
_>> Course dates: {{ site.data.settings.dates }}_{:.text-muted} <br/>

##### Office Hours / People / Getting Help
- Travis's Office Hours: {{site.data.settings.officehours}} *>> A virtual meeting place for Travis's office hours*{:.text-muted} <br/>
- TA Office Hours: {{site.data.settings.taofficehours}} *>> A virtual meeting place for TA office hours*{:.text-muted} <br/>
- [CS Student Success Center]({{site.data.settings.ssclink}}) *>> Get help from TAs and peers*{:.text-muted} <br/>

##### Links
- [Textbook (SS3P)]({{site.data.settings.textbookss3plink}}) *>> **(Required)** {{site.data.settings.textbookss3p}}*{:.text-muted} <br/>
- [Textbook (SEED)]({{site.data.settings.textbookseedlink}}) *>> **(Optional/Recommended)** {{site.data.settings.textbookseed}}*{:.text-muted} <br/>
- [Code]({{site.data.settings.codelink}}) *>> All of the code from class (on GitHub)*{:.text-muted} <br/>
- {{site.data.settings.slack}} *>> For all course-related communications*{:.text-muted} <br/>
- {{site.data.settings.d2l}} *>> For tracking course grades, etc.*{:.text-muted} <br/>
<!-- - {{site.data.settings.gradescope}} *>> For submitting and grading exams, providing exam feedback, etc.*{:.text-muted} <br/> -->

## Schedule
{:.titletext}
This is a tentative schedule that is subject to change with minimal notice
{:.subtitletext}

Below is the calendar for this course.
It is the responsibility of the students to frequently check this web-page for schedule, readings, and assignment changes.
I will attempt to announce any change to the class, but this webpage should be viewed as authoritative.
If you have any questions, please contact me.

<!-- Thanks! https://idratherbewriting.com/documentation-theme-jekyll/mydoc_tables.html -->

<table class="table table-striped table-bordered table-sm">
<colgroup><col width="13%" /><col width="60%" /><col width="30%" /></colgroup>
<thead>
<tr class="header">
<th>Date</th>
<th>Topics & Lectures</th>
<th>Assignments & Reading</th>
</tr>
</thead>

<tbody>

<!-- ========================================= Week 01 ========================================= -->

<tr>
<!--   Week #   --><td id="week01" markdown="span">Week 01</td>
<!-- Week Title --><td markdown="span" class="note">Introduction, Course Overview, and Review</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1"></td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/12/2021 (T)</td>
<td markdown="span" markdown="1">
- Course Introduction & Roadmap
- [video](https://zoom.us/rec/share/fg6CE1lch3TFSUxFPffD0xkg532B-lHowZtT0O1vq9V9NHtZaeysOIx9umzLMmdh.5IDXT1ASMGb9WCeB){:.video}
[slides](files/cs476-01-intro.pdf){:.slides}
</td>
<td markdown="span" markdown="1">
- Please fill out our {{site.data.settings.questionnaire}}!
- Please sign-up for our course {{site.data.settings.slack}}!
- [Lab 00](labs/lab00) Released!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/14/2021 (R)</td>
<td markdown="span" markdown="1">
- Help Session
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 02 ========================================= -->

<tr>
<!--   Week #   --><td id="week02" markdown="span">Week 02</td>
<!-- Week Title --><td markdown="span" class="note">Software Security</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapters 1, 2, 3 [(SS3P)]({{site.data.settings.textbookss3plink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/19/2021 (T)</td>
<td markdown="span" markdown="1">
- Intro to Software Security
- [video](https://zoom.us/rec/share/-cvS4-5Pd0k8yOqbKxaDkrFISmFKKRjx8YxEwun3lYS7H2pE_-UA--QhWYiLqXLY.PPccZpkiFXjhT1FM){:.video}
[slides](files/cs476-03-intro2sec-and-review.pdf){:.slides}
[activity](files/activity-01.pdf){:.activity}
</td>
<td markdown="span" markdown="1">
- [Lab 00](labs/lab00) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/21/2021 (R)</td>
<td markdown="span" markdown="1">
- Intro to Software Security (cont.); Review Systems and Software <!-- Unix Security Basics -->
- [video](https://zoom.us/rec/share/44WnPcckNiKjOz9AaEqwoUR2DFPtCM1D3YxZ9U2C6_ndANdNO_Erm5wIUCpUwClG.RbYkbowCRQZL9Dw4){:.video}
[slides](files/cs476-04-intro2sec-and-review.pdf){:.slides}
[activity](files/activity-02.pdf){:.activity}
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 03 ========================================= -->

<tr>
<!--   Week #   --><td id="week03" markdown="span">Week 03</td>
<!-- Week Title --><td markdown="span" class="note">Software Security</td>
<!-- - Shellcode Development? -->
<!-- - Format-String Vulnerability? -->
<!-- - Race Condition? -->
<!--   BLANK    --><td markdown="span" class="note" markdown="1"></td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/26/2021 (T)</td>
<td markdown="span" markdown="1">
- Review Systems and Software
- [video](https://zoom.us/rec/share/fK-_rhEhpQ2KLQQWEwdBNqGzx_uJKzPBn1Msn5El8_81TwK6OQevOax-4KC2BeNY.-gx7RYhFkEQ4rG0N){:.video}
[slides](files/cs476-05-intro2sec-and-review.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Threat Model](labs/labX1) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">01/28/2021 (R)</td>
<td markdown="span" markdown="1">
- Probing Memory and Executables
- [video](https://zoom.us/rec/share/PKBL4n3etmsy5mjOcKfg_0qGgsCRPlM3kmAsQZvqt_AmlqfvNoS3PBV6E4zAk_gO.zbJM6D5gZbj8c_Lt){:.video}
[slides](files/cs476-06-intro2sec-and-review.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 04 ========================================= -->

<tr>
<!--   Week #   --><td id="week04" markdown="span">Week 04</td>
<!-- Week Title --><td markdown="span" class="note">Software Security --- Privileged Programs, Env. Variables, and Attacks via Program Inputs</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapters 6.2, 6.3, 6.4, 7.1.1, 7.1.3 [(SS3P)]({{site.data.settings.textbookss3plink}}),
(Optional) Chapters 1, 2 [(SEED)]({{site.data.settings.textbookseedlink}})
- [[Linux File Permissions Complete Guide]](https://devconnected.com/linux-file-permissions-complete-guide/)
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/02/2021 (T)</td>
<td markdown="span" markdown="1">
- The Set-UID Mechanism & Environment Variables (Part I)
- [video](https://zoom.us/rec/share/nC2feo0ZT3NjQtEaek9lVJC9Pkbav7_ifkEE594Udty8yqavP2cq1n-yqJcOe7tT.jyODnN1CJ6IKSI4L){:.video}
[slides](files/cs476-07-setuid-envvars.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Systems & Software](labs/labX2) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/04/2021 (R)</td>
<td markdown="span" markdown="1">
- The Set-UID Mechanism & Environment Variables (Part II)
- [video](https://zoom.us/rec/share/vmpfH-q97Xob8dnsdYO-QDo_k73GURbSKT5yiBFJH6gBsgYgPGJJ7FsQs_oV4Bsx._sE6zLhTShqPq8B0){:.video}
[slides (new/spring'21)](files/cs476-07-08-setuid-envvars.pdf){:.slides}
[slides (old/spring'20)](files/cs476-08-setuid-envvars-SPRING2020.pdf){:.slides}
- _I decided to remake the slides I lost!_
- _~~Unfortunately I was unable to recover the updated slides I made this year.~~_
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [[Secure Programming - Executing External Programs Securely]](https://www.oreilly.com/library/view/secure-programming-cookbook/0596003943/ch01s07.html)
& [[Environment Variables (slides)]](http://www2.cs.uidaho.edu/~krings/CS270/Notes.S10/270-F10-20.pdf)
</td>
</tr>

<!-- ========================================= Week 05 ========================================= -->

<tr>
<!--   Week #   --><td id="week05" markdown="span">Week 05</td>
<!-- Week Title --><td markdown="span" class="note">Software Security --- The Shellshock Attack</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapters 6.2, 6.3, 6.4 [(SS3P)]({{site.data.settings.textbookss3plink}}),
(Optional) Chapters 3, 9 [(SEED)]({{site.data.settings.textbookseedlink}}),
- [[CVE-2014-6271]](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6271), [[shellshocker.net]](https://www.minttm.com/takeover-shellshocker-net)
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/09/2021 (T)</td>
<td markdown="span" markdown="1">
- The Shellshock Attack (Part I)
- [video](https://zoom.us/rec/share/Ktnsd3Em-Fn6rNqbZ8RcLnLEZp_m6ibIQ8uWP_vQz51Be6tam895GVmOH78pf9nM.Xb8oXel3xuLQUMYp){:.video}
[slides](files/cs476-09-shellshock.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Lab 01](labs/lab01) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/11/2021 (R)</td>
<td markdown="span" markdown="1">
- The Shellshock Attack (Part II)
- [video](https://zoom.us/rec/share/xE9l9czuJJSHaRDDW7JrDqaknRZc3cdishmlf2mxIESD1SqnkfDsAS0Kw9Cz6ve-.Vmm6b15hrxoCH6qA){:.video}
[slides](files/cs476-10-shellshock.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 06 ========================================= -->

<tr>
<!--   Week #   --><td id="week06" markdown="span">Week 06</td>
<!-- Week Title --><td markdown="span" class="note">Software Security --- Buffer Overflow Vulnerabilities, Attacks, and Defenses</td>
<!-- - Return-to-libc Attacks / Generalizing Return-to-libc Attacks: Return-Oriented Programming? -->
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapters 5.4 (focus on 5.4.1-5.4.3), 6.4 [(SS3P)]({{site.data.settings.textbookss3plink}}),
- (Optional) Chapters 4, 9 [(SEED)]({{site.data.settings.textbookseedlink}}),
- [[Demystifying the Execve Shellcode (Stack Method)]](http://hackoftheday.securitytube.net/2013/04/demystifying-execve-shellcode-stack.html)
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/16/2021 (T)</td>
<td markdown="span" markdown="1">
- Buffer Overflow Vulnerabilities, Attacks, and Defenses (Part I)
- _Program layout in memory, examining program execution & stack frames in gdb_{:.text-muted}
- [video](https://zoom.us/rec/share/chlIclKOON-q0fVA7fOS-Ekfqm9fmhZPhsgrGIEyVtQwF1VXKCofCFEKPAuYYlwC.26NbeRzBvpxmwmfT){:.video}
[slides](files/cs476-11-buffer-overflow.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Lab 02](labs/lab02) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/18/2021 (R)</td>
<td markdown="span" markdown="1">
- Buffer Overflow Vulnerabilities, Attacks, and Defenses (Part II)
- _A buffer overflow vulnerability, big ideas, and exploitation strategies_{:.text-muted}
- [video](https://zoom.us/rec/share/d8HOkd3BHm4-BTD3LPZMut1c3kQlUrwKsDzsAbqvcwUJ5D3WKAtRh1ivm-28e_c3.16qWMl9zVk6Ck4RL){:.video}
[slides](files/cs476-12-buffer-overflow.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 07 ========================================= -->

<tr>
<!--   Week #   --><td id="week07" markdown="span">Week 07</td>
<!-- Week Title --><td markdown="span" class="note">Software Security --- Buffer Overflow Vulnerabilities, Attacks, and Defenses</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/23/2021 (T)</td>
<td markdown="span" markdown="1">
- Buffer Overflow Vulnerabilities, Attacks, and Defenses (Part III)
- _Shellcode_{:.text-muted}
- [video](https://zoom.us/rec/share/h0Hpw-hJ_RG62TKiSJIiMjoQWXLU_DPrFL_sGwDPjVfVB7ARUie7ROYU3guRHfXB.LkxXD4Pu6b9tRM--){:.video}
[slides](files/cs476-13-buffer-overflow.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Read Appendix 8.1 [(SS3P)]({{site.data.settings.textbookss3plink}})
- _Lab 03 Deadline Extended!_{:.text-muted}
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">02/25/2021 (R)</td>
<td markdown="span" markdown="1">
- Buffer Overflow Vulnerabilities, Attacks, and Defenses (Part IV)
- _Countermeasures to buffer overflow attacks_{:.text-muted}
- [video](https://zoom.us/rec/share/_yeO2x1Wso8xyxOQXEUNetBg73Owf8VzhmcbBQlMg_3E-F51QC4XzjYbA_PyjMub.zLQ_OWndO9TzYItU){:.video}
[slides](files/cs476-14-buffer-overflow.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 08 ========================================= -->

<tr>
<!--   Week #   --><td id="week08" markdown="span">Week 08</td>
<!-- Week Title --><td markdown="span" class="note">Network & Web Security --- SQL Injection Attacks & Countermeasures</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapter 7.1 (focus on 7.1.4) [(SS3P)]({{site.data.settings.textbookss3plink}}),
- (Optional) Chapter 12 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/02/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
- [video](https://zoom.us/rec/share/CxdMisAAfB22E5g-4x4EzfWvZ0M3DSyi3ogX80uL1UJtW6_LfM-pFDWefR3Cj9u6.I_jY77MY4UJSsaL0){:.video}
[slides](files/cs476-15-web-sqli.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Lab 03](labs/lab03) Due!
<!-- - TBD Due! -->
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/04/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
- [video](https://zoom.us/rec/share/QMRrVJmQmqYOK7yQDHm1dld690jwnH2c3hQMQ8GIzNCJ7dbgPasM3cOmqDV80r1T.4ORu65OvBuhbOG16){:.video}
[slides](files/cs476-16-web-sqli.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 09 ========================================= -->

<tr>
<!--   Week #   --><td id="week09" markdown="span">Week 09</td>
<!-- Week Title --><td markdown="span" class="note">Network & Web Security --- Cross-Site Scripting (XSS) Attacks & Countermeasures</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapter 7.1 (focus on 7.1.5) [(SS3P)]({{site.data.settings.textbookss3plink}}),
- (Optional) Chapter 11 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/09/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
- [video](https://zoom.us/rec/share/KYxk_wqPYygvK6E5N7S20lMTvp9ZFTatsOiERcQem0jbHbeJrPCfkkYf-hKiD4Jb.HXvzqOPnHF8Mm48b){:.video}
[slides](files/cs476-17-web-xss.pdf){:.slides}
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- [Lab 04](labs/lab04) Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/11/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 10 ========================================= -->

<tr>
<!--   Week #   --><td id="week10" markdown="span">Week 10</td>
<!-- Week Title --><td markdown="span" class="note">Network & Web Security --- Cross-Site Request Forgery (XSRF) Attacks & Countermeasures</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- Read Chapter 7.1 (focus on 7.1.6) [(SS3P)]({{site.data.settings.textbookss3plink}}),
- (Optional) Chapter 10 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/16/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Lab 05 Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/18/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 11 ========================================= -->

<tr>
<!--   Week #   --><td id="week11" markdown="span">Week 11</td>
<!-- Week Title --><td markdown="span" class="note">Cryptography</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/23/2021 (T)</td>
<td markdown="span" markdown="1">
- Intro to Cryptography
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Lab 06 Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/25/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 12 ========================================= -->

<tr>
<!--   Week #   --><td id="week12" markdown="span">Week 12</td>
<!-- Week Title --><td markdown="span" class="note">Cryptography --- Symmetric Key Cryptography</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- (Optional) Chapter 21 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">03/30/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- TBD Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/01/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 13 ========================================= -->

<tr>
<!--   Week #   --><td id="week13" markdown="span">Week 13</td>
<!-- Week Title --><td markdown="span" class="note">Cryptography --- Hashing</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- (Optional) Chapter 22 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/06/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Lab 07 Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/08/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 14 ========================================= -->

<tr>
<!--   Week #   --><td id="week14" markdown="span">Week 14</td>
<!-- Week Title --><td markdown="span" class="note">Cryptography --- Asymmetric Key Cryptography</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
- (Optional) Chapter 23 [(SEED)]({{site.data.settings.textbookseedlink}})
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/13/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Lab 08 Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/15/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 15 ========================================= -->

<tr>
<!--   Week #   --><td id="week15" markdown="span">Week 15</td>
<!-- Week Title --><td markdown="span" class="note">Course Wrap-Up</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/20/2021 (T)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Lab 9 Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/22/2021 (R)</td>
<td markdown="span" markdown="1">
<!-- - TBD -->
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- ========================================= Week 16 ========================================= -->

<tr>
<!--   Week #   --><td id="week16" markdown="span">Week 16</td>
<!-- Week Title --><td markdown="span" class="note">"Finals Week"</td>
<!--   BLANK    --><td markdown="span" class="note" markdown="1">
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/27/2021 (T)</td>
<td markdown="span" markdown="1">
- _No Class_
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
- Final Lab Due!
</td>
</tr>

<!-- Date, Topics & Lecture Details, Assignments & Reading -->
<tr>
<td markdown="span">04/29/2021 (R)</td>
<td markdown="span" markdown="1">
- _No Class_
<!-- - [video](){:.video} -->
<!-- [slides](files/){:.slides} -->
<!-- [activity](){:.activity} -->
</td>
<td markdown="span" markdown="1">
</td>
</tr>

<!-- =========================================== END =========================================== -->

</tbody>
</table>

{% comment %}
_More Schedule Details Coming Soon..._
{:.alert .alert-primary .text-center}

<!--

[minute paper (08/21)](https://forms.gle/dxRexo9t9CBbbFm38){:.activity}

<tr class="duedate table-dark">
    <td colspan = "3" class="text-center" markdown="span">**Programming Assignment 0 Due: {{ site.data.settings.assignments.pa0.duedate }}**</td>
</tr>

- _Exam #1_ _>> Released by 8am. Due by 11:59pm. Please upload your completed exam to Gradescope._{:.text-muted}
- [coversheet](files/exam1-coversheet.pdf){:.pdf} << _Read me **before** the exam starts!_

- _Exam #2_ _>> Released by 8am. Due by 11:59pm. Please upload your completed exam to Gradescope._{:.text-muted}
- [coversheet](files/exam2-coversheet.pdf){:.pdf} << _Read me **before** the exam starts!_

Special Topics:
Mobile OS and IoT,
Networks & Distribution [+Distributed File Systems],
How Yalnix Works,
Virtualization [Virtual Machines, Containers, etc.],
SGX / TrustZone,
Safer Languages for OS development (e.g., Rust),
Better Languages for Concurrent Programming (e.g., Go),
Recent Developments in OS,

- _>> Have you completed the [course evaluation](https://montana.campuslabs.com/eval-home/cei/csci/460/801)? If not, please do! :)_{:.text-muted}

-->
{% endcomment %}


## Grading
{:.titletext}
These are tentative details that are subject to change with minimal notice
{:.subtitletext}

I am always happy to chat, review ideas from this course, try to clarify lab/exam questions, and discuss any questions or concerns you may have about graded work.

I do not pre-grade assignments.
I typically do not curve grades.
<!-- The score you earn is the score you receive. -->

**Any grade disputes must be resolved within one week of the release of the grade.**

#### Grade Breakdown

The grade breakdown is as follows:

- **Attend Office Hours:** 5% _>> Stop by office hours to follow up on class discussions, ask questions, provide feedback, chat about interests, etc._{:.text-muted}
- **Active Learning, Quizzes, Critiques:** 10% _>> Low-stakes assessments of comprehension and opportunities for reflection_{:.text-muted}
- **Labs:** 70% _>> Labs (i.e., hands-on exercises) are the emphasis in this course. Start early, try stuff, talk with others... Most importantly, do them!_{:.text-muted}
- **Final Lab:** 15% _>> A replacement for a typical "final exam". This will look and feel similar to the labs you will do this semester, but **must be completed individually**. Furthermore, **topics from throughout the semester are all “fair game”**. As with all labs this semester, this “final lab” will have a mixture of short-answer problems, as well as command line / programming tasks._{:.text-muted}

#### Lab Grading Policy

Labs are typically made up of a series of tasks (tasks may have sub-tasks).
These tasks typically require you to provide short-answers, demonstrate command line knowledge, and/or complete programming-related tasks.
Each task/sub-task will be graded on the following scale:

- **High Pass (+3)**
- **Pass (+2)**
- **Low Pass (+1)**
- **Incomplete (0)**

A high pass is earned if the solution presents a clear demonstration of the task at hand, as well as clear, correct, and concise description (including observations, explanations, etc.).
Solutions lacking clarity in the demonstration and/or the description will be awarded a low pass or pass (depending the quality of the solution).
A grade of incomplete is earned where no solution is present, or where the solution is incorrect or incoherent.

## Assignments
{:.mb-3}

##### Submitting Work
<!-- All assignments are to be submitted in **{{site.data.settings.d2l}}** or via git. -->
All assignments are to be submitted via **your private GitHub repository**.
So long as your work is committed and pushed to your private GitHub repository by the deadline, you should be good to go!
To ensure that we have access, please double check that Travis and the TA(s) are added as "collaborators" in your GitHub repository.

<!-- (Each assignment will clarify the submission method.) -->
<!-- Assignments are **due @ TBD**. -->
<!-- Assignments are **due @ 11:59pm** on the due date. -->
<!-- You can submit an assignment an unlimited number of times. Graders will only grade your most recent submission. -->

##### Labs
_This section will be updated periodically. Stay tuned for more information coming soon..._

{% include assignments.html %}

For more information please see the [Labs page](./labs).

##### Late Penalties

<!-- This course moves _fast_, and  -->
Your evaluation in this course is primarily based on completing the assignments.
<!-- As such, we take timely submissions seriously. -->
<!-- We had previously outlined strict deadlines and penalties for late submissions. -->
In light of this semester's unique circumstances, we have decided to offer some relaxed late penalty policies.
Each assignment has a set deadline.
I encourage students to treat the posted deadlines as "hard" deadlines.
Unlike past offerings of this course, however, there are no "late coupons" nor are there late penalties applied for late submissions.
So long as your assignment is submitted within 48 hours of the posted deadline, your assignment will receive no penalties.
I still recommend that you adhere to the deadlines to stay on track with the course as things keep moving.
To ensure timely feedback with our large class, _**no submissions will be accepted/graded 48 hours after the original deadline.**_

<!-- The penalties for late submissions are as follows: -->
<!-- {:.p-0 .m-0} -->

<!-- * &lt;  8 hours: 10% -->
<!-- * &lt; 24 hours: 25% -->
<!-- * &lt; 48 hours: 50% -->
<!-- * &ge; 48 hours: no credit. -->

<!-- I do understand, however, that extreme circumstances arise (e.g., interviews, illness, family matters). -->
<!-- For this reason, **each student is herby granted two (virtual) "one-day late" coupons** whereby you can turn in an assignment late with no penalty &ndash; no excuse required. -->
<!-- Each coupon is good for a 1-day (24-hour) extension on one project. -->
<!-- However, an N-person project _(think Yalnix!)_ requires N coupons for a 1-day extension. -->
<!-- Plan accordingly. -->
<!-- You must tell me and the TA that you are using a coupon _before_ the official deadline. -->
<!-- Also note that you _cannot_ change this decision later. -->

<!-- _**You MUST send a message to the TA(s) (and Travis) to tell us that you are using a coupon BEFORE the official deadline.**_ -->
<!-- {:.text-center .lead .text-warning .pt-2 .pb-2} -->

<!-- _**No submissions will be accepted/graded 48 hours after the original deadline.**_ -->
<!-- {:.text-center .lead .text-danger .pt-2 .pb-2} -->

<!-- For this reason, you are allowed -->
<!-- **at most one 'late pass' where your submission can be turned in up to 48 hours late with no penalty** &ndash; no excuse required. -->
<!-- To use your free late pass, indicate in a comment along with your submission on D2L that you are electing to use your free pass. -->
<!-- Note that you cannot change this decision later. -->

<!-- Please note, the no-penalty late pass **cannot** be used to extend your effective due date beyond 48 hours. -->
<!-- For example, if an assignment is due at 11:59pm on Sunday, you cannot apply your late pass *and* take additional late penalties on your assignment to extend your due date to 72 or 96 hours beyond the original deadline; whether you use the late pass or not, your (late) submission is due by 11:59pm on Tuesday. -->

<!-- Also note that if you are working on a team assignment, each member must have a late pass.  -->
<!-- For example, if each member of a team of 3 still has their late pass, that team can submit an assignment up to 48 hours late with no penalty.  -->

<!-- **Note:** this cannot be used to receive full credit on any assignment checkpoints. -->

<!-- ##### Poor Faith Assignments -->

<!-- We work hard to make the assignments meaningful experiences for you, to provide help, and to give you good feedback. -->
<!-- We expect you to make good-faith efforts to do the assignments. -->
<!-- Submissions that are extremely careless/sloppy will incur an additional grading penalty. -->
<!-- Do your work---don't try to game the system. -->

## Communication

We will use **{{site.data.settings.slack}}** for all course communication (except for sensitive stuff like grades!).

Please **do not** use other means of electronic communication (e.g., D2L, e-mail) **unless you absolutely have to**.

I typically won't respond to emails or Slack direct messages (DMs) past 6 p.m. or so.
Generally speaking, I will not respond on weekends and certainly not immediately.
Please do not expect an instant answer if you send me an email or DM in Slack.
(I sometimes go off the grid to focus---something that [a great deal of research suggests](https://www.amazon.com/Flow-Psychology-Experience-Perennial-Classics/dp/0061339202) you do too.)
Fortunately, we have a class full of people that are itching to help one another out.
I definitely recommend using an appropriate channel on Slack (e.g., _**#labs**_) to ask general questions have discussions amongst your peers.

<!-- **New to slack?** Here are some helpful links: -->
<!-- {:.p-0 .m-0} -->
<!-- - {{site.data.settings.slack}} _>> join our class's slack workspace_{:.text-muted} -->
<!-- - [Slack Basics - The Ultimate Slack Introduction](https://www.youtube.com/watch?v=pUZzBoAbAOs) -->
<!-- - [How to use Slack](https://www.youtube.com/results?search_query=how+to+use+slack) -->
<!-- - [How to format messages in Slack](https://slack.com/help/articles/202288908-Format-your-messages) -->

## Course Expectations

I greatly value transparency.
To this end, I attempt to summarize what I expect from you all as well as what you can expect from me.

##### Expectations for Students

The expectations for the course are that students will **attend classes** as often as they are able,
do any **readings** assigned for class, and
actively and constructively **participate** in class discussions.
<!-- and work within their team to engage in the course programming assignments. -->
Class participation will be a measure of contributing to the discourse both in class, through discussion and questions,
and outside of class through contributing and responding to class forums.

Online/hybrid learning requires that you be especially disciplined with your time.
If you are experiencing difficulty with time management, it is your responsibility to touch base with me as soon as possible.
Please make sure to regularly check this website and our course Slack workspace.
It is increasingly important for you to communicate with me if our course format is making it difficult for you to do the assigned work.
I am eager to make accommodations that serve students well (within reason...) if you can help me identify such opportunities.
Please communicate with me early and often if you have concerns or are experiencing hardship with this course --- I'm here for you and want to support you however I am able.

<!-- *Out of respect for your classmates, I ask that you turn off all laptops, tablets, and phone screens when they aren't needed for in-class activities!* -->
<!-- When we aren't using computers for in-class activities, I recommend (and research supports) that you write notes by hand. -->
<!-- > There is recent research that attests to the [negative impacts of learning and -->
<!-- > retention when multitasking](http://www.creativitypost.com/psychology/why_learning_and_multitasking_dont_mix). -->
<!-- > It has also been shown that [writing notes by hand rather than on a laptop](http://pss.sagepub.com/content/25/6/1159) -->
<!-- > engages different cognitive processes and has direct (positive) consequences -->
<!-- > for learning. -->

##### Expectations for Instructors & TAs

We understand that these are difficult times, but we will do our best to maintain consistent communication with you,
including updating you on any and all course changes or upcoming assignments, and providing timely feedback.
I will keep the schedule updated with relevant links, videos, readings, and so forth.
Please bear with us as we are constantly trying new and better ways to conduct our course in this new format.
We are always open to feedback, so please let us know if there is something you feel we are missing.

## Respect for Diversity & Inclusivity
{:.titletext}
Adapted from MSU's Center for Faculty Excellence, the University of Iowa, and the University of Northern Colorado
{:.subtitletext}

I support an inclusive learning environment where diversity and individual differences are understood, respected, appreciated, and recognized as a source of strength.
We expect that students, faculty, administrators and staff at MSU will respect differences and demonstrate diligence in understanding how other peoples' perspectives, behaviors, and worldviews may be different from their own.

It is my intent that students from all diverse backgrounds and perspectives be well-served by this course,
that students' learning needs be addressed both in and out of class,
and that the diversity that students bring to this class be viewed as a resource, strength and benefit.
It is my intent to present materials and activities that are respectful of diversity:
gender identity, sexual orientation, disability, age, socioeconomic status, ethnicity, race, religion, culture, perspective, and other background characteristics.
Your suggestions about how to improve the value of diversity in this course are encouraged and appreciated.
Please let me know ways to improve the effectiveness of the course for you personally or for other students or student groups.

##### Religious Observances

In addition, in scheduling exams and deadlines, I have attempted to avoid conflicts with major religious holidays.
If, however, I have inadvertently scheduled an exam or major deadline that creates a conflict with your religious observances,
please let me know as soon as possible so that we can make other arrangements.

## Accommodations for Disabilities

If you are a student with a disability and wish to use your approved accommodations for this course,
I encourage you to reach out to me and the [Office of Disability Services (ODS)](https://www.montana.edu/disabilityservices/) as soon as possible.
Please have your Accommodation Notification or Blue Card available for verification of accommodations.
Accommodations are approved through the Office of Disability Services located in SUB 174.
For more information, please see: [www.montana.edu/disabilityservices](https://www.montana.edu/disabilityservices/).
<!-- If you have a need for accommodations on exams, please see information on the [MSU's Testing Services website](http://www.montana.edu/testing/). -->

## Academic Honesty

Please review [MSU's Code of Conduct, Policies, Regulations, & Reports](http://catalog.montana.edu/code-conduct-policies-regulations-reports/).
A couple of clarifications and additions:
- Although you may discuss and design with others, the work you hand in (e.g., code, write-ups) must be entirely your own. *(Applies to individual assignments only.)*
- Anything you submit that did not originate from you must be accompanied by attribution.
- Also, please do not share solutions or detailed information about solutions (e.g., specific code, non-trivial command line sequences) with others.

## Protection of Intellectual Property Rights in Course Materials

This syllabus, course lectures and presentations, and any course materials provided throughout this term are protected by U.S. copyright laws.
Students enrolled in the course may use them for their own research and educational purposes.
However, reproducing, selling or otherwise distributing these materials without written permission of the copyright owner is expressly prohibited, including providing materials to commercial platforms such as Chegg or CourseHero.
Doing so may constitute a violation of U.S. copyright law as well as MSU’s Code of Student Conduct.

## FAQs

This is a collection of general FAQs related to our course. I will update this section as other questions arise.

###### Q: What should I know about COVID-19 as it relates to this course?
{:.mb-1}

Stay up to date with [Montana State University's official COVID-19 Information page](https://www.montana.edu/health/coronavirus/).
<!-- Please also review our page dedicated to information about [COVID-19 and our course]({{ site.baseurl }}/covid19). -->
<!-- To align with MSU, this course has [adapted some of the syllabus language prepared by the Center for Faculty Excellence regarding COVID-19](http://www.montana.edu/facultyexcellence/teaching/resources/SyllabusLanguage.html). -->
<!-- Specifically, we clarify some of the expectations for our class around wearing masks, health-related absences, and mask-related accommodations. -->

###### Q: How will classes be run?
{:.mb-1}

Our class meetings and office hours will all be conducted in a fully **online/synchronous** format.
Unless otherwise stated, our classes will meet on Zoom on our designated class days/times: {{site.data.settings.hours}}.
We will use Slack inside and outside class to facilitate conversations, make announcements, and so forth.
Sometimes I may choose to post recordings ahead of time instead of holding live class sessions (asynchronous), or point to other helpful content if it makes sense to do so.
I'll make it clear when that is happening.

###### Q: Is attendance required?
{:.mb-1}

While attendance is not required, **attendance is expected** unless unforeseen circumstances prevent students from attending online synchronously.
Synchronous class sessions will be recorded, but recorded sessions will not be shared publicly by default.
Access to these recorded sessions will be made available upon request.
This is to align with the university’s stated expectations:
_In synchronous online courses, students will be expected to participate in the class at the time it is offered.
Provisions for participation through asynchronous viewing should not be expected by students.
These standard expectations can be raised at the discretion of course instructors in ways that promote student success._

> Per our in-class poll (1/12/2021), I (Travis) will plan to post recorded videos by default to this webpage so long as at least 80% of students are regularly attending.
> If synchronous attendance drops below 80% I will stop posting videos by default.
> Videos will still be available upon request.

###### Q: How will office hours be run?
{:.mb-1}

Office hours will follow a similar format as class (though they will not be recorded).

###### Q: What happens if the online stream for class disconnects/drops?
{:.mb-1}

An unfortunate reality is that our course technologies may fail us at times.
If **my** connection during class is unstable or drops, I'll try to fix it, but if I can't I will share a recording later.
If **your** connection is unstable or drops, try to rejoin if you can, but don't worry if you can't (I can share the recording so you can access the recording later).
The worst case scenario would be if our recording fails for some reason.
If this occurs I'll try to restart the recording.
With the increased burden being put on these technologies, however, I cannot (unfortunately) guarantee that we won't encounter issues along the way.
I can, however, promise you this: _**I will always work with you to troubleshoot issues to the best of my abilities.**_
If you encounter any problems, please let me know as soon as possible.

###### Q: Am I required to buy the textbook? What if I have a different version of the book?
{:.mb-1}

Our textbook is required in the sense that I will often assign readings from the book, and you are expected to understand that material.
The good news: _**Our primary textbook is free!**_
This was an intentional move on my part to make our course resources affordable and easy to access for all.
This effort is being supported this semester by the MSU Library---_thank you, MSU Library!_
You should plan to use the version of the book linked from our website above.

<!--
If you obtain an older version of the book, that may be fine in some cases, but understand that your book may be organized differently, or it may not have text or exercises that I assign.
(For instance, new editions often contain new sections that cover new technologies or ideas.)
You are welcome to try to identify and work around any differences between our required version and older versions;
I'll help you as I'm able to, but can't guarantee that this will always work.
The simplest approach is to get the textbook. :-)
-->

{% comment %}
###### Q: Wow, there seems to be a lot of emphasis on programming in this class... Can you elaborate on that?
> Yeah... I don't think learning about operating systems is a spectator sport, so programming and design assignments are really the emphasis in this course.
> We will do a few assignments early on to get used to programming in C, to make sure you have a good handle on some tools, and to drive home a few big concepts in OS.
> Following this, most of the semester will be spent working in a small team to iteratively develop your own OS ("Yalnix").
> This project will have a number of checkpoints (approximately 6).
> We will evaluate checkpoints throughout the semester; we will also evaluate the final project submission.
> This means you'll have the opportunity to fix any issues with your Yalnix project based on feedback from checkpoints. (Take advantage of this!)
> Because you can make changes to your Yalnix implementation along the way based on feedback you receive,
> we expect the final submission to be much more polished in terms of things like readability, correctness, and robustness.
> <br/><br/>The difficulty of assignments will vary, but in general I encourage you to start early, try stuff, talk with others, ask questions when something isn't clear... and most importantly, do them!

{% endcomment %}

###### Q: What programming languages & tools will we use for programming assignments in this class?
{:.mb-1}

We will use a variety of tools and programming languages this semester.
Most of the code we will read and write is either C or Python.
We will spend quite a bit of time at the command line and potentially writing shell scripts (e.g., Bash).
We will also likely make use of other tools for exploration or to make our lives easier (e.g., Makefiles, Docker, VirtualBox/Vagrant, Git/GitHub, debugging tools like GDB).
Needing to use a wide range of tools and languages is sort of an occupational hazard in computer science, and more so in the world of a security practitioner.
If you find yourself struggling with a language or tool needed in this class, please don't hesitate to ask for help.

<!--
- Because, for systems programming and systems education, we need a high-level language that hides as little as possible. (How can you understand how the OS manages address spaces, unless you have a language that makes addresses explicit?)
- Because most operating systems are written in C or C++. (E.g., look at the Linux and glibc source.)

To aid us in building C programs, you will need to be familiar with Makefiles. Makefiles are a nicety when building smaller programs used by one person, but they really are a necessity when developing code that others will compile and run, when working collaboratively, and when developing larger software projects (such as Yalnix).

You will need to know gdb (a debugger) to help you debug your programs. (Let us know ASAP if you need help beyond the short tutorials we produce/share, and the resources we recommend.)

You will need to know Git: a popular Distributed Version Control System (DVCS). This is an essential tool for collaborative software development.
-->

###### Q: What are exams like in this class?
{:.mb-1}

TBD.

{% comment %}
###### Q: What are exams like in Operating Systems (CSCI 460)?
> A smaller portion of the final grade is determined by exams.
> I'm currently planning two exams, each worth 15%.
> Exams will be a mixture of problems; e.g., short-answer, reading/writing/explaining code, design questions.

> Exams will likely be in a take-home format.
> You'll have at least 1 day (perhaps more) to take the exam.
> You'll be able to reference slides from class, your textbook, your brain - stuff like that - but I will ask that you not consult with other students (past, present, or... future?) or other resources outside of what we use in this course.
> My aim here is to assess **YOU** and **HOW YOU THINK** about what we are learning in operating systems.
> To that end, I have not intention of asking you not to use your notes or your code (those are yours after all!).
> Nor do I intend to ask you not to use **legitimate resources** (e.g., our course slides, our textbook).
> What I do expect is that the work you submit is your work.
> So please, out of respect for me and others in this course, don't go looking for solutions to problems online.
> If something isn't clear, ask me or our TA (not the Internet).
> If you don't know something, that's fine, move past it.
> Learn from the feedback we give you, and preferrably, follow up with me so we can chat and make sure you've got a good grip on stuff going forward.

{% endcomment %}

###### Q: Why are we using Zoom instead of WebEx or Microsoft Teams for streaming classes?
{:.mb-1}

Great question! I've gone back and forth on this but I have ultimately decided on Zoom.
This may be a surprise to you. If you know me you've likely heard me rant about Zoom and the wide range of security and privacy concerns I've had in the past.
Zoom has been very proactive in addressing many of the issues that have been brought to light (which is awesome!).
Apart from my past concerns, Zoom---in my opinion and experience---offers far superior video quality, unique features that enhance engagement, and an overall unmatched user experience.
One unique feature specific to Zoom---breakout rooms---will allow us to engage in small-group interactions during class (a.k.a. "active learning").
(While MSU officially supports WebEx and Teams, there is a small group of us in the NACOE who are trying Zoom out in our classes, so you'll likely encounter this in other courses as well.)

###### Q: Why are we using Slack for class communication instead of D2L or Piazza?
{:.mb-1}

A few reasons:
(1) This has worked great in my past courses that have used Slack;
(2) This is a much nicer way to facilitate online collaboration and teamwork; and
(3) Most students will not use a proper learning management system (LMS) such as Brightspace/D2L, Blackboard, or Canvas after they receive their diplomas.
On the other hand, students will almost certainly use a collaboration tool at some point in their careers.
Why not introduce one of the most powerful and popular ones used today while you are still in school? :-)

{% comment %}
###### Q: Why do we use VirtualBox/Virtual Machines?
> Most relevant to this course, the support software for yalnix has many dependencies on what gcc and glibc actually do.
> Using a VirtualBox image means that we no longer have to fix bugs each year to get things to build against the new gcc/glibc---we have tight control over these things.
> Furthermore, it's the only way to get students set up with the right environment since there is a wide range of variability in the computing resources that students use and have access to (e.g., Windows vs. Mac, access to computing labs).
> <br/><br/>
> It is also worth noting that virtualization technologies, such as virtual machines and containers, are extremely popular in industry.
> I personally wish I had more opportunities in school to learn about these technologies and practice using them.
> Furthermore, I've had the opportunity to review exit surveys from our recent CS graduates,
> and one of the most common "asks" was for our department to teach students more practical skills/tools that would be useful in industry.
> **I seriously couldn't agree more!**
> A systems-oriented class such as this is a fantastic place to do these things, so we do! :-)
> <br/><br/>
> Now some may say, "yeah yeah yeah but why **VirtualBox**?"
> Philosophically, I prefer VirtualBox because it is free and widely used today.
> There are other high-quality, paid options for virtualization software (e.g., Parallels) that provide similar features (in some cases, more/better features!),
> but I prefer standardizing around open/free materials where possible as it improves access for our students.
> Apart from the free vs. paid topic, I like using a virtualization tool because it improves reproducibility for you.
> Some years from now you will venture off into the world and no longer have nicely configured computer labs, servers, etc. that we/MSU provide you.
> By empowering you to work in your own reproducible environment, you can have more control over your work and have the ability to run it in the future.

{% endcomment %}

###### Q: I don't have all of the required/recommended prerequisites - can I take this class?
{:.mb-1}

I'm typically supportive of students that wish to enroll in the course even if they do not satisfy all of the recommended prerequisites,
so long as you understand that you may need to talk with me and/or do additional work independently to make sure you are adequately prepared for assignments.

If you haven't taken one of the recommended prerequisites,
  you might consider looking over resources from a recent offering of that class here at MSU or online elsewhere.
For example, [review the faculty at MSU](https://www.cs.montana.edu/directory/) - if you click into their faculty page (and perhaps their websites) you can see the courses they've recently taught;
they likely have links to past classes that are available or you can contact them to inquire further.
Alternatively, checkout resources from
[FreeCodeCamp's List of 500 Free Computer Science Courses from the World’s Top CS Universities](https://www.freecodecamp.org/news/free-courses-top-cs-universities/)
or specific online learning platforms such as [Coursera](https://www.coursera.org), [Udemy](https://www.udemy.com), [edX](https://www.edx.org), or [Khan    Academy](https://www.khanacademy.org) (to name a few).

Feel free to touch base as we get into the semester to discuss any concepts that are unclear.

###### Q: Help! This stuff is hard... How can I get help in this class?
{:.mb-1}

One of the best ways to get help is to participate in office hours.
You are _**always**_ welcome to come to my office hours and/or TA office hours as often as you like.
To get the most out of office hours, you might like reading [How To Ask Questions The Smart Way, by Eric Steven Raymond](http://www.catb.org/esr/faqs/smart-questions.html).
Please note  that I won't merely provide answers to assignments.
I believe in the [Socratic method](https://en.wikipedia.org/wiki/Socratic_method)
  and often [answer students' questions with questions](https://www.philsimon.com/blog/higher-education/analytics-students/).
All of this is to say: come ready to chat :-)

Knowing the proper way to ask for help is a vital skill.
Generally, people are more willing and able to help you when you are clear and concise in your communication.
I encourage you to practice this skill in our class!

**Some specific tips for asking for help:**
- Start by posting conceptual questions to public channels in our Slack workspace.
  <br/> _>> You are more likely to get a fast response than you are if you send a message to one specific person._
- When you need to discuss code, send a DM on Slack to Travis and/or the TA(s).
  <br/> _>> Be as specific as possible about (1) what you are trying to accomplish, (2) what you’ve already tried, and (3) what you think the problem could be._
- Regularly push code to GitHub.
  <br/> _>> This enables Travis and the TA(s) to review your code and be more equipped to help._
- If a Makefile is relevant, have your Makefile put together ASAP.
  <br/> _>> This helps you and Travis and/or the TA(s) easily build your code in a consistent way._
- Make sure your code is commented and formatted consistently.
  <br/> _>> Anything you can do to help YOU and Travis and/or the TA(s) navigate your code, makes us all more effective in troubleshooting issues!_
- Start early / ask questions early!
  <br/> _>> The hours leading up to the deadline is the wrong time to be getting started..._

_This website is a living document. Your feedback is always appreciated regarding typos, suggestions for clarifications, etc._
{:.text-muted .text-center .pt-3}
