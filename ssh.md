---
layout: default
published: true
---

## SSH Into SEED VMs

[<i class="fas fa-play-circle"></i> **Watch my video walkthrough online here!**](https://montana.techsmithrelay.com/fEM2)
{:.text-center}

Many have asked how I SSH into the SEED VMs.
Below is a summary of my approach.
You should run all of the following commands on the host (not the guest/VM).

```bash
# set up port forwarding via VirtualBox.
# (You will need to know the ip address of the VM)
# I have a rule setup like this:
#   127.0.0.1:7333 --> 10.0.2.15:22

# *manually* test your SSH connection (login with your password):
ssh seed@127.0.0.1 -p 7333
```

Now, create a dedicated public/private keypair that will be used to facilitate SSH-ing into the VM:

```bash
# make sure you are in your .ssh folder (where you will stash keys, config file, etc.)
cd ~/.ssh

# generate your SSH keypair...
ssh-keygen -t rsa -b 4096 -f ~/.ssh/myseedkey -C "seedkey//travis"

# ...and install the PUBLIC KEY into the `authorized_users` w/ ssh-copy-id
ssh-copy-id -i ~/.ssh/myseedkey seed@127.0.0.1 -p PORT

# finally, test your connection using your new ssh key (not your password)
ssh -i ~/.ssh/myseedkey seed@127.0.0.1 -p PORT  
```

Once you've verified the connection, you can configure your `~/.ssh/config` file to make SSH-ing easier.
This is a minimal ssh rule that should work for SSH-ing into a SEED VM:

```bash
Host seed # the host name (e.g., 'ssh seed')
  HostName 127.0.0.1 # the IP address where the target ssh server can be found
  User seed # the user name
  Port 7333 # the forwarded port I setup in VirtualBox
  IdentityFile /Users/twp/.ssh/myseedkey # my ssh key file
```

Now you should be able to SSH into your VM with a simple command like this:

```bash
ssh seed
```
