---
title: 'Simple Command Line Activity'
id: 1
layout: default
tags: [activity]
published: True
date: 01/21/2021
---

1. In your SEED VM, run the following commands and note your observations.
_(NOTE: each line is a separate command or series of commands.)_
I encourage you to run these commands and to try to get a feel for what might be happening.
After you have run the commands and some intuition, then follow up with looking at a resource
(e.g., a book, cheatsheet, manual, website, etc.) to verify your thinking and your observations.

    ```
    cd ~
    pwd
    mkdir -p /tmp/this/is/a/sub/directory
    ln -s /tmp/this/is/a/sub/directory ~/mydir
    ls -al
    env | grep PATH
    curl -O https://www.traviswpeters.com/classes/vmcustomizations.txt?$(date +%s)
    cat info
    sudo lshw -html > hardwareinfo.html
    id
    xxd
    ```

    > **Note:** Recall that Lab 0 has a number of cheatsheets/references linked for your convenience.

2. Without using Google, Stack Overflow, etc. how can you learn more about commands?

    > **Hint:** Is there some sort of **manual** that you can access from the command line?

3. In your experience, what is your favorite command line tool and why?
