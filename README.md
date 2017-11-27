# recon.sh
This tool is for the computer hacking community and gives a framework for storing reconnaissance (recon) information. Recon is a tedious and continuous process that involves mentally processing and parsing command output. Conclusions drawn from this output can lead to new insights about an asset or may even identify security vulnerabilities. In proper recon, assets are scanned on a regular bases and the output of the commands are compared. The wrappers in this tool allow you to collect recon information from multiple nodes in a single git repository and gives an easy interface to search it.

# Installation
The tools are written in bash and have been tested on Mac OS and Linux. `git` is required to be installed in order to use the software. To install the latest version of the tool, clone this repository:

```bash
git clone git@github.com:jobertabma/recon.sh
```

To make it easier to execute the `recon.sh` helper from the command line, add the following line to your profile:

```bash
alias recon.sh=~/location/of/recon.sh
```

It's recommended to have `recon.sh` commit to a private repository. Create one for yourself, clone it locally, and run:

```bash
recon.sh init ~/location/of/recon-data
```

# Tracking
When the tool is properly installed, output of commands can be captured globally and can be stored in the designated git repository. Consider the following `nmap` command:

```bash
recon.sh track hackerone 'nmap -Pn -p 80,443 hackerone.com'
```

```
Starting Nmap 7.60 ( https://nmap.org ) at 2017-11-25 20:52 PST
Nmap scan report for hackerone.com (104.16.99.52)
Host is up (0.0089s latency).

PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 13.09 seconds
[master fc557ea] Tracked output for hackerone ("nmap -Pn -p 80,443 hackerone.com")
 1 file changed, 1 insertion(+)
 create mode 100644 hackerone/08434d2228d58fec3e7c13b0b61f9c9b
```

In the example above, the output of the command is shown in the terminal as it normally would. However, when it is finished, it commits it to the directory with a special name. When you'd run the same command, it'd overwrite the file. This is especially useful when comparing output of the same command with `git diff`.

# History
Because the output of the same command is kept in the same file, a clean and browsable format of the differences can be generated. Here's an example:

```diff
$ recon.sh history hackerone 'nmap -Pn -p 80,443 hackerone.com'

commit 2de16412e7525d3fd9f18e7230311de26f042ad8 (HEAD -> master)
Author: Jobert Abma <jobert@hackerone.com>
Date:   Sat Nov 25 21:11:22 2017 -0800

    Tracked output for hackerone ("nmap -Pn -p 80,443 hackerone.com")

diff --git a/hackerone/08434d2228d58fec3e7c13b0b61f9c9b b/hackerone/08434d2228d58fec3e7c13b0b61f9c9b
index 169fae9..cf35206 100644
--- a/hackerone/08434d2228d58fec3e7c13b0b61f9c9b
+++ b/hackerone/08434d2228d58fec3e7c13b0b61f9c9b
@@ -1,12 +1,12 @@

-Starting Nmap 7.60 ( https://nmap.org ) at 2017-11-25 21:08 PST
+Starting Nmap 7.60 ( https://nmap.org ) at 2017-11-25 21:11 PST
 Nmap scan report for hackerone.com (104.16.99.52)
-Host is up (0.010s latency).
+Host is up (0.0083s latency).
 Other addresses for hackerone.com (not scanned): 2400:cb00:2048:1::6810:6334 2400:cb00:2048:1::6810:6434 104.16.100.52

 PORT    STATE SERVICE
 80/tcp  open  http
+443/tcp open  https

-Nmap done: 1 IP address (1 host up) scanned in 16.09 seconds
+Nmap done: 1 IP address (1 host up) scanned in 13.06 seconds
```

# Search
There's a lot of different reasons why you'd want to come back and search through output. The `recon.sh search` tool does exactly that. It allows a regular expression ([ERE](https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions)) to be passed to it to search through command output. It'll search through commands as well as the output.

```bash
recon.sh search '(80|443)'
```

# Notes
Sometimes you just need to write things down. This is what the `recon.sh notes` command is for. It keeps a single file of raw notes and tracks the output similar to `recon.sh track`.

# Artifacts
Not all command output is human-readable. For those situations, `recon.sh artifacts` can be used. It'll allow you to track a binary file in the repository.
