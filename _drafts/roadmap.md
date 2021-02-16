---
layout: default
published: true
---

## Misc. Future Ideas:

- A summary/more tips around SetUID Programs in general:
  https://www.gnu.org/software/libc/manual/html_node/Tips-for-Setuid.html
- Use a game / editing scores as a motivating example for setuid?
  https://www.gnu.org/software/libc/manual/html_node/Setuid-Program-Example.html


## Spring 2021 Roadmap

**Software Security**
Lab 01: Environment Variable and Set-UID Program Lab
https://seedsecuritylabs.org/Labs_20.04/Software/Environment_Variable_and_SetUID/
Lab 02: Shellshock Attack Lab
https://seedsecuritylabs.org/Labs_20.04/Software/Shellshock/
Lab 03: Buffer Overflow Vulnerability Lab
https://seedsecuritylabs.org/Labs_20.04/Software/Buffer_Overflow_Setuid/
Lab 04: Return-to-libc Attack Lab (Graduate Students Only)
https://seedsecuritylabs.org/Labs_20.04/Software/Return_to_Libc/
Lab 05: CTF Buffer Overflow Attack Lab
https://seedsecuritylabs.org/Labs_20.04/Software/Buffer_Overflow_Server/
Lab 05: Shellcode Development Lab (New for 2021, Candidate to replace old Lab 05)
https://seedsecuritylabs.org/Labs_20.04/Software/Shellcode/
Lab 05: Race-Condition Vulnerability Lab (New for 2021, Candidate to replace old Lab 05)
https://seedsecuritylabs.org/Labs_20.04/Software/Race_Condition/
Lab 05: Dirty-COW Attack Lab (New for 2021, Candidate to replace old Lab 05)
https://seedsecuritylabs.org/Labs_20.04/Software/Dirty_COW/
Lab 05: Format-String Vulnerability Lab (New for 2021, Candidate to replace old Lab 05)
https://seedsecuritylabs.org/Labs_20.04/Software/Format_String/

**Web Security**
Lab 06: SQL Injection Attack Lab
https://seedsecuritylabs.org/Labs_20.04/Web/Web_SQL_Injection/
Lab 07: Packet Sniffing and Spoofing Lab
https://seedsecuritylabs.org/Labs_20.04/Networking/Sniffing_Spoofing/
Lab 07: Cross-Site Scripting Attack Lab (Elgg) (New for 2021, Replaces old Lab 07)
https://seedsecuritylabs.org/Labs_20.04/Web/Web_XSS_Elgg/
Lab 08: TCP/IP Attack Lab
https://seedsecuritylabs.org/Labs_20.04/Networking/TCP_Attacks/
Lab 08: Cross-Site Request Forgery Attack Lab (New for 2021, Replaces old Lab 08)
https://seedsecuritylabs.org/Labs_20.04/Web/Web_CSRF_Elgg/

**Cryptography**
Lab 09: Secret-Key Encryption Lab
https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_Encryption/
Lab 10: MD5 Collision Attack Lab
https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_MD5_Collision/
Lab 11: RSA Encryption and Signature Lab
https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_RSA/

## Roadmap (2021 and beyond)

Myself and others at Montana State University have a vision of expanding the cybersecurity-related course offerings,
  as well as creating a Cybersecurity Masters program.
Currently, however, we have only a single course---Computer Security---to cover this fascinating area.

As a first step, I am selecting a subset of topics that have been covered in courses by
  [Wenliang (Kevin) Du](http://www.cis.syr.edu/~wedu/),
  [Charles Palmer](https://www.cs.dartmouth.edu/~ccpalmer/), and
  [Sean Smith](https://cs.dartmouth.edu/~sws/)---we are all greatly indebted to them.
I am primarily adopting topics from Kevin Du's [Computer & Internet Security: A Hands-on Approach (2nd Edition)](https://www.handsonsecurity.net)
  and the [SEED Labs](https://seedsecuritylabs.org)
  because I admire all of the work towards creating hands-on lessons for security education.

Below is a collection of topics modified from related courses that I envision for future courses at MSU.

<!-- Row 1 -->
<div class="row">

<div class="col-md-6 order-1 mt-3" markdown="1">
## [Computer Security](https://www.handsonsecurity.net/courses/compsec/syllabus.html)

**Introduction and Basics**
- Class Introduction (syllabus, policies, and projects)
- An Overview of Computer Security
- Course projects (labs)
- Unix Security Basics

**Software Security: Vulnerabilities, Attacks, and Countermeasures**
- Privileged programs (Set-UID programs) and vulnerabilities
- Buffer Overflow vulnerability and attack
- Return-to-libc attack
- Race Condition vulnerability and attack
- Dirty COW attack
- Format String vulnerability and attack
- Shellshock attack
- Heartbleed attack

**Web Security: Vulnerabilities, Attacks, and Coutermeasures**
- Same Origin Policy
- Cross-Site Scripting Attack
- Cross-Site Request Forgery Attack
- SQL-Injection Attack
- Click-Jacking Attack
- Web Tracking

**Smartphone Security**
- Access control in Android operating system
- Rooting Android devices
- Repackaging attacks
- Attacks on apps
- Whole-disk encryption
- Hardware protection: TrustZone

**Hardware Security**
- Meltdown attack
- Spectre attack
- 80x86 Protection Mode (access control in hardware)
</div>

<div class="col-md-6 order-2 mt-3" markdown="1">
## [Internet Security](http://www.cis.syr.edu/~wedu/Teaching/InternetSecurity/syllabus.html)

**Introduction and Overview**
- Internet Architecture
- How the Internet works (high-level overview)
- IP Address

**TCP/IP Protocols, Vulnerabilities, Attacks, and Countermeasures**
- Physical Layer: jamming attacks
- Data Link Layer: ARP protocol and ARP cache poisoning
- Network Layer: IP protocols, packet sniffering, IP Spoofing, IP fragmentation attacks
- Network Layer: ICMP protocol and ICMP misbehaviors
- Network Layer: IP Routing protocols and Attacks
- Transport Layer: TCP protocol, TCP session hijacking, reset and SYN flooding attacks
- DoS and DDoS attacks
- DNS protocol, attacks, and DNSSEC
- BGP protocol and Attacks

**Cryptography Basics and Applications**
- Secret-Key Encryption, DES, AES
- One-way Hash Functions, MD5, SHA-1, and SHA-2
- Length extension attacks, Collision attacks
- Diffie-Hellman Key Exchange
- Public-Key Encryption, RSA
- Digital Signatures
- Public-Key Infrastructure (PKI)
- Blockchains and Bitcoins
- Case Studies: common mistakes

**Network Security Mechanisms**
- IP Tunneling and SSH Tunneling
- Virtual Private Networks
- Firewalls
- Bypassing firewalls
- Transport Layer Security (TLS/SSL)
- TLS Programming
</div>

</div>
