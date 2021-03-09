---
layout: default
tags: [labs, seed]
dirname: 'lab06'
dircode: '06_csrf'
labprefix: 'Lab 06'
labtitle: 'Cross-Site Request Forgery (CSRF) Attack Lab'
title: 'Lab 06: Cross-Site Request Forgery (CSRF) Attack Lab'
duedate: 'Tuesday [03/23/2021] @ 11:59 AM (MST)'
released: False
---

# {{page.labprefix}}: {{page.labtitle}}
{:.pb-4}

## {{page.labtitle}}
{:.titletext}
Adapted from SEED Labs: A Hands-on Lab for Security Education.
{:.subtitletext}

The objective of this lab is to help students understand the Cross-Site Request Forgery (CSRF) attack.
A CSRF attack involves a victim user, a trusted site, and a malicious site.
The victim user holds an active session with a trusted site while visiting a malicious site.
The malicious site injects an HTTP request for the trusted site into the victim user's session, abusing the user's active session with the trusted site.

In this lab, students will attack a social networking web application using the CSRF attack.
The open-source social networking application, Elgg, is accessible as a Docker container.
Elgg has implemented countermeasures against CSRF, but we have disabled them for the purpose of this lab.

This lab covers the following topics:

-   Cross-Site Request Forgery attack
-   CSRF countermeasures: Secret token and Same-site cookie
-   HTTP GET and POST requests
-   JavaScript and Ajax

### Resources

- Code related to this lab can be found in `{{page.dircode}}/` of our [class's GitHub repository](https://github.com/traviswpeters/cs476-code).
- Summaries and references that can help you learn about using various [Web Tools]({{ 'webtools' | relative_url }}) (e.g., Burp Suite, HTTP Headers Live).
- Chapter 10 in the [SEED Textbook]({{site.data.settings.textbookseedlink}}).

<!-- BEGIN Special Section (Use Bootstrap "Card" Styles). This is nice for formatting background, setup, special instructions, etc. -->
<div class="card bg-secondary border-primary" markdown="1">
<div class="card-body" markdown="1">

## Environment Setup

In this lab, we will use two websites.
The first website, the vulnerable Elgg site, is accessible at [www.csrflabelgg.com](www.csrflabelgg.com).
The second website is the attacker's malicious website that is used for attacking Elgg,
which is accessible at [www.csrflab-attacker.com](www.csrflab-attacker.com).
These websites are run in docker containers.

> **WARNING:** Do not visit these websites outside of the VM / when the local webserver is not running.

### Container Setup and Commands

{% include lab_docker_overview.html classdir="06_csrf" %}

#### DNS Configuration

We can access the Elgg website, the attacker website, and the defense site using their respective URLs.
To ensure these hostnames are mapped to their corresponding IP addresses
we added the following entries to the `/etc/hosts` file.

```
10.9.0.5        www.csrflabelgg.com
10.9.0.5        www.csrflab-defense.com
10.9.0.105      www.csrflab-attacker.com
```

### The Elgg Web Application

In this lab we use an open-source web application called Elgg.
Elgg is a web-based social-networking application.
It is already set up in the provided container images.

We use two containers, one running the web server (`10.9.0.5`), and the other running the MySQL database (`10.9.0.6`).
The IP addresses for these two containers are hardcoded in various places in the configuration,
so please do not change them within the `docker-compose.yml` file.

{% include lab_elgg_users.html %}

### The Elgg Container

We host the Elgg web application using an Apache web server.
The website setup is included in `apache_elgg_csrf.conf` inside the Elgg image folder.
The configuration specifies the URL for the website and the folder where the web application code is stored.

```
<VirtualHost *:80>
     DocumentRoot /var/www/elgg
     ServerName www.csrflabelgg.com
     <Directory /var/www/elgg>
          Options FollowSymlinks
          AllowOverride All
          Require all granted
     </Directory>
</VirtualHost>
```

### The Attacker Container

We use another container (`10.9.0.105`) to play the role of the attacker machine, which hosts a malicious website.
The Apache configuration for this website is detailed below.

```
<VirtualHost *:80>
    ServerName www.csrflab-attacker.com
    DocumentRoot /var/www/attacker
</VirtualHost>
```

Since we need to create web pages inside this container, for convenience, as well as for keeping the pages we have created,
we mounted a folder on the hosting VM (`attacker`) to the container's `/var/www/attacker` folder,
which is the `DocumentRoot` folder in our Apache configuration.
Therefore, the web pages we put inside the `attacker` folder on the VM will be hosted by the attacker's website.
We have already placed some skeleton code inside this folder.

### MySQL Database

{% include lab_mysql.html classdir="06_csrf" %}

</div>
</div>
<!-- END Special Section -->

## Lab Tasks
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

### Task 1: Observing HTTP Request.

In Cross-Site Request Forget attacks, we need to forge HTTP requests.
Therefore, we need to know what a legitimate HTTP request looks like and
what parameters it uses, etc. We can use a Firefox add-on called
`"HTTP Header Live"` for this purpose. The goal of this task is to get
familiar with this tool. Instructions on how to use this tool is given
in the Guideline
section (§ [5.1](#web:sec:httpheaderlive){reference-type="ref"
reference="web:sec:httpheaderlive"}). Please use this tool to capture an
HTTP GET request and an HTTP POST request in Elgg. In your report,
please identify the parameters used in this these requests, if any.

### Task 2: CSRF Attack using GET Request

In this task, we need two people in the Elgg social network: Alice and
Samy. Samy wants to become a friend to Alice, but Alice refuses to add
him to her Elgg friend list. Samy decides to use the CSRF attack to
achieve his goal. He sends Alice an URL (via an email or a posting in
Elgg); Alice, curious about it, clicks on the URL, which leads her to
Samy's website: `www.csrflab-attacker.com`. Pretend that you are Samy,
describe how you can construct the content of the web page, so as soon
as Alice visits the web page, Samy is added to the friend list of Alice
(assuming Alice has an active session with Elgg).

To add a friend to the victim, we need to identify what the legitimate
Add-Friend HTTP request (a GET request) looks like. We can use the
`"HTTP Header Live"` Tool to do the investigation. In this task, you are
not allowed to write JavaScript code to launch the CSRF attack. Your job
is to make the attack successful as soon as Alice visits the web page,
without even making any click on the page (hint: you can use the `img`
tag, which automatically triggers an HTTP GET request).

Elgg has implemented a countermeasure to defend against CSRF attacks. In
Add-Friend HTTP requests, you may notice that each request includes two
wired-looking parameters, `__elgg_ts` and `__elgg_token`. These
parameters are used by the countermeasure, so if they do not contain
correct values, the request will not be accepted by Elgg. We have
disabled the countermeasure for this lab, so there is no need to include
these two parameters in the forged requests.

### Task 3: CSRF Attack using POST Request

After adding himself to Alice's friend list, Samy wants to do something
more. He wants Alice to say "Samy is my Hero" in her profile, so
everybody knows about that. Alice does not like Samy, let alone putting
that statement in her profile. Samy plans to use a CSRF attack to
achieve that goal. That is the purpose of this task.

One way to do the attack is to post a message to Alice's Elgg account,
hoping that Alice will click the URL inside the message. This URL will
lead Alice to your (i.e., Samy's) malicious website
[www.csrflab-attacker.com](www.csrflab-attacker.com), where you can
launch the CSRF attack.

The objective of your attack is to modify the victim's profile. In
particular, the attacker needs to forge a request to modify the profile
information of the victim user of Elgg. Allowing users to modify their
profiles is a feature of Elgg. If users want to modify their profiles,
they go to the profile page of Elgg, fill out a form, and then submit
the form---sending a POST request---to the server-side script
`/profile/edit.php`, which processes the request and does the profile
modification.

The server-side script `edit.php` accepts both GET and POST requests, so
you can use the same trick as that in Task 1 to achieve the attack.
However, in this task, you are required to use the POST request. Namely,
attackers (you) need to forge an HTTP POST request from the victim's
browser, when the victim is visiting their malicious site. Attackers
need to know the structure of such a request. You can observe the
structure of the request, i.e., the parameters of the request, by making
some modifications to the profile and monitoring the request using the
`"HTTP Header Live"` tool. You may see something similar to the
following. Unlike HTTP `GET` requests, which append parameters to the
URL strings, the parameters of HTTP `POST` requests are included in the
HTTP message body (see the contents between the two symbols):

```
http://www.csrflabelgg.com/action/profile/edit

POST /action/profile/edit HTTP/1.1
Host: www.csrflabelgg.com
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) ...
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Referer: http://www.csrflabelgg.com/profile/elgguser1/edit
Cookie: Elgg=p0dci8baqrl4i2ipv2mio3po05
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 642
__elgg_token=fc98784a9fbd02b68682bbb0e75b428b&__elgg_ts=1403464813  (*@\ding{80}@*)
&name=elgguser1&description=%3Cp%3Iamelgguser1%3C%2Fp%3E
&accesslevel%5Bdescription%5D=2&briefdescription= Iamelgguser1
&accesslevel%5Bbriefdescription%5D=2&location=US
......                                                              (*@\ding{80}@*)
```

After understanding the structure of the request, you need to be able to
generate the request from your attacking web page using JavaScript code.
To help you write such a JavaScript program, we provide a sample code in
the following You can use this sample code to construct your malicious
website for the CSRF attacks. This is only a sample code, and you need
to modify it to make it work for your attack.

```html
<html>
<body>
<h1>This page forges an HTTP POST request.</h1>
<script type="text/javascript">

function forge_post()
{
    var fields;

    // The following are form entries need to be filled out by attackers.
    // The entries are made hidden, so the victim won't be able to see them.
    fields += "<input type='hidden' name='name' value='****'>";
    fields += "<input type='hidden' name='briefdescription' value='****'>";
    fields += "<input type='hidden' name='accesslevel[briefdescription]'
                                    value='2'>";                         (*@\ding{192}@*)
    fields += "<input type='hidden' name='guid' value='****'>";

    // Create a <form> element.
    var p = document.createElement("form");

    // Construct the form
    p.action = "http://www.example.com";
    p.innerHTML = fields;
    p.method = "post";

    // Append the form to the current page.
    document.body.appendChild(p);

    // Submit the form
    p.submit();
}

// Invoke forge_post() after the page is loaded.
window.onload = function() { forge_post();}
</script>
</body>
</html>
```

In Line , the value `2` sets the access level of a field to public. This
is needed, otherwise, the access level will be set by default to
private, so others cannot see this field. It should be noted that when
copy-and-pasting the above code from a PDF file, the single quote
character in the program may become something else (but still looks like
a single quote). That will cause syntax errors. Replace all the single
quote symbols with the one typed from your keyboard will fix those
errors.

#### Questions.

In addition to describing your attack in full details, you also need to
answer the following questions in your report:

-   **Question 1**: The forged HTTP request needs Alice's user id (guid)
    to work properly. If Boby targets Alice specifically, before the
    attack, he can find ways to get Alice's user id. Boby does not know
    Alice's Elgg password, so he cannot log into Alice's account to get
    the information. Please describe how Boby can solve this problem.

-   **Question 2:** If Boby would like to launch the attack to anybody
    who visits his malicious web page. In this case, he does not know
    who is visiting the web page beforehand. Can he still launch the
    CSRF attack to modify the victim's Elgg profile? Please explain.








## Lab Tasks: Defense
{:.titletext}
This lab has been tested on the pre-built SEED VM (Ubuntu 20.04 VM).
{:.subtitletext}

CSRF is not difficult to defend against. Initially, most applications
put a secret token in their pages, and by checking whether the token is
present in the request or not, they can tell whether a request is a
same-site request or a cross-site request. This is called *secret token*
approach. More recently, most browsers have implemented a mechanism
called *SameSite cookie*, which is intended to simplify the
implementation of CSRF countermeasures. We will conduct experiments on
both methods.

### Task 4: Enabling Elgg's Countermeasure

To defend against CSRF attacks, web applications can embed a secret
token in their pages. All the requests coming from these pages must
carry this token, or they will be considered as a cross-site request,
and will not have the same privilege as the same-site requests. Attacker
will not be able to get this secret token, so their requests are easily
identified as cross-site requests.

Elgg uses this secret-token approach as its built-in countermeasures to
defend against CSRF attacks. We have disabled the countermeasures to
make the attack work. Elgg embeds two parameters `__elgg_ts` and
`__elgg_token` in the request. The two parameters are added to the HTTP
message body for the POST requests and to the URL string for the HTTP
GET requests. The server will validate them before processing a request.

#### Embedding secret token and timestamp to web pages.

Elgg adds security token and timestamp to all the HTTP requests. The
following HTML code is present in all the forms where user action is
required. These are two hidden fields; when the form is submitted, these
two hidden parameters are added to the request:

```html
<input type = "hidden" name = "__elgg_ts" value = "" />
<input type = "hidden" name = "__elgg_token" value = "" />
```

Elgg also assign the values of the security token and timestamp to
JavaScript variables, so they can be easily accessed by the JavaScript
code on the same page.

```js
elgg.security.token.__elgg_ts;
elgg.security.token.__elgg_token;
```

The secret token and timestamp are added to Elgg's web pages by the
module. The code snippet below shows how they are dynamically added to
web pages.

```js
$ts = time();
$token = elgg()->csrf->generateActionToken($ts);

echo elgg_view('input/hidden', ['name' => '__elgg_token', 'value' => $token]);
echo elgg_view('input/hidden', ['name' => '__elgg_ts', 'value' => $ts]);
```

#### Secret token generation.

Elgg's security token is a hash value (md5 message digest) of the site
secret value (retrieved from database), timestamp, user session ID and
random generated session string. The code below shows the secret token
generation in Elgg (in ).

```js
/**
 * Generate a token from a session token (specifying the user),
 * the timestamp, and the site key.
 */
public function generateActionToken($timestamp, $session_token = '') {
  if (!$session_token) {
          $session_token = $this->session->get('__elgg_session');
          if (!$session_token) {
                  return false;
          }
  }

  return $this->hmac
          ->getHmac([(int) $timestamp, $session_token], 'md5')
          ->getToken();
}
```

#### Secret token validation.

The elgg web application validates the generated token and timestamp to
defend against the CSRF attack. Every user action calls the `validate`
function inside `Csrf.php`, and this function validates the tokens. If
tokens are not present or invalid, the action will be denied and the
user will be redirected. In our setup, we added a `return` at the
beginning of this function, essentially disabling the validation.

```js
public function validate(Request $request) {
   (*@\textbf{return;}@*) // Added for SEED Labs (disabling the CSRF countermeasure)

   $token = $request->getParam('__elgg_token');
   $ts = $request->getParam('__elgg_ts');
   ... (code omitted) ...
}
```

#### Task: Turn on countermeasure.

To turn on the countermeasure, just remove the `return` from the
`Csrf.php` file inside the `image_elgg/elgg` folder (on your host VM),
rebuild the container images, and restart all the containers. Then
repeat the attack again, and see whether your attack will be successful
or not. Please point out the secret tokens in the captured HTTP
requests. Please explain why the attacker cannot send these secret
tokens in the CSRF attack; what prevents them from finding out the
secret tokens from the web page?

### Task 5: Experimenting with the SameSite Cookie Method

Most browsers have now implemented a mechanism called SameSite cookie,
which is a property associated with cookies. When sending out requests,
browsers will check this property, and decide whether to attach the
cookie in a cross-site request. A web application can set a cookie as
SameSite if it does not want the cookie to be attached to cross-site
requests. For example, they can mark the session ID cookie as SameSite,
so no cross-site request can use the session ID, and will therefore not
be able to launch CSRF attacks.

To help students get an idea on how the SameSite cookies can help defend
against CSTF attacks, we have created a website called
[www.csrflab-defense.com](www.csrflab-defense.com) on one of the
containers. Please visit the following URL (the hostname is already
mapped to `10.9.0.5` in the `/etc/hosts` file; if you are not using the
SEED VM, you should add this mapping to your machine):

```
URL: http://www.csrflab-defense.com/
```

Once you have visited this website once, three cookies will be set on
your browser, `cookie-normal`, `cookie-lax`, and `cookie-strict`. As
indicated by the name, the first cookie is just a normal one, the second
and third cookies are samesite cookies of two different types (`Lax` and
`Strict` types). We have designed two sets of experiments to see which
cookies will be attached when you send an HTTP request back to the
server. Typically, all the cookies belonging to the server will be
attached, but this is not the case if a cookie is a samesite type.

Please follow the links for the two experiments. Link A points to a page
on [csrflab-defense.com](csrflab-defense.com), while Link B points to a
page on [csrflab-attacker.com](csrflab-attacker.com). Both pages are
identical (except for the background color), and they both send three
different types of requests to
[www.csrflab-defense.com/showcookies.php](www.csrflab-defense.com/showcookies.php),
which simply displays the cookies sent by the browser. By looking at the
display results, you can tell which cookies were sent by the browser.
Please do the following:

-   Please describe what you see and explain why some cookies are not
    sent in certain scenarios.

-   Based on your understanding, please describe how the SameSite
    cookies can help a server detect whether a request is a cross-site
    or same-site request.

-   Please describe how you would use the SameSite cookie mechanism to
    help Elgg defend against CSRF attacks. You only need to describe
    general ideas, and there is no need to implement them.

#### Bonus points.

Although it is not required, students are encouraged to modify the Elgg
application, so they can use the samesite cookie mechanism to defend
against CSRF attacks. We recommend instructors to give bonus points to
the students who can do this. Students should check with their
instructors regarding the bonus points.


<!-- Submission Instructions -->
{% include lab_submission.html %}
