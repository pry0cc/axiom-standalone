# Axiom OS
---

## What the heck is this?
Axiom OS is a little project to compile several useful tools in a clean, easy and reproducable way.

Axiom OS is designed to give you the bare 'necessities' to get a new box up and running as soon as possible.

The current script is designed to work with Debian 10 Buster but may well work on a range of Debian based systems assuming that the package names are the same (they most likely are not).

## Install

### Step 1 - Install Debian
You have to do this bit yourself, and configure the following:
- Unprivileged user with sudo rights
- Open a terminal with the user chosen to be used daily (not root!)

### Step 2 - Bootstrap Axiom OS
Enter your password when prompted.

```
sudo apt update && sudo apt install git && git clone git@github.com/pry0cc/axiom-standalone.git && cd axiom-standalone && ./install.sh
```

### Step 3 - Reboot
```
sudo reboot
```

