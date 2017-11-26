# recon.sh
This tool is for the computer hacking community and gives a framework for storing reconnaissance (recon) information. Recon is a tedious and continuous process that involves mentally processing and parsing command output. Conclusions drawn from this output can lead to new insights about an asset or may even identify security vulnerabilities. In proper recon, assets are scanned on a regular bases and the output of the commands are compared. The wrappers in this tool allow you to collect recon information from multiple nodes in a single git repository and gives an easy interface to search it.

# Installation
The tools are written in bash and have been tested on Mac OS and Linux. `git` is required to be installed in order to use the software. To install the latest version of the tool, clone this repository:

```
git clone git@github.com:jobertabma/recon.sh
```

To make it easier to execute the `recon.sh` helper from the command line, add the following line to your profile:

```
alias recon.sh=~/location/of/recon.sh
```

It's recommended to have `recon.sh` commit to a private repository. Create one for yourself, clone it locally, and run:

```
recon.sh init ~/location/of/recon-data
```

# Usage
When the tool is properly installed, output of commands can be captured globally and can be stored in the designated git repository. Consider the following `nmap` command:

```
$ recon.sh track hackerone 'nmap -Pn -p 80,443 hackerone.com'

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
