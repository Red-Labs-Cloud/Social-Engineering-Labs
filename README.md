# Social Engineering Lab
This repository hosts a collection of tools and resources for building and running a social engineering lab.  
Here, you can explore the fascinating world of social engineering, learning how attackers exploit human psychology to compromise security.
![Social Engineering Labs logo, cyberpunk style](./Cover.png)


## What is Social Engineering?

Social engineering is the art of manipulating individuals into divulging confidential information or performing actions that may compromise security. \
It's a critical component of cybersecurity assessments, as human factors are often the weakest link in any system.   



## Installation

```console
rfs@debian:~/$ curl -sSL https://social-engineering.redlabs.cloud/install.sh | bash
```
## Destroy

```console
rfs@debian:~/$ curl -sSL https://social-engineering.redlabs.cloud/destroy.sh | bash
```

## Control Panel

- Traefik - ok
- Control Panel - InDev
- PGAdmin - ok

## Tools


### GoPhish
A powerful and popular open-source phishing framework. You'll use it to create and launch phishing campaigns, track user interactions, and gather credentials.
### EvilGinx
Essential for sophisticated phishing attacks. It allows you to create convincing fake login pages that capture credentials while relaying traffic to the legitimate site, making it hard for users to detect the attack.
### Modlishka
Another excellent tool for reverse proxy phishing. It's known for its ability to bypass 2FA, making it highly effective against even security-conscious targets.
### Muraena
Similar to EvilGinx, Muraena is a flexible and easy-to-use phishing tool. Explore both and see which one fits your workflow better.
### EvilnoVNC
This allows you to embed a VNC server within a phishing page. When a victim interacts with the page, it can give you remote control of their machine (if they accept the VNC prompt) - very powerful but use with extreme caution and only in ethical hacking scenarios.


## Important Disclaimer

Ethical Use Only: This lab is intended for educational and ethical hacking purposes only. \
Obtain Explicit Permission: Always get written consent before conducting any social engineering exercises against individuals or organizations. \
Respect Privacy and Laws: Adhere to all applicable laws and regulations related to data privacy and security.
