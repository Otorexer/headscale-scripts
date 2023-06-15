
# Headscale-scripts

Automatic installation of [Headscale](https://github.com/juanfont/headscale) with a script to set up your own Headscale and fast creation and removal of users.
## Features

- Automatic installation
- Creation of Users
- Linux, Windwos, and Android


## Server
Download the scrips
```bash
  git clone https://github.com/Otorexer/headscale-scripts.git
  cd headscale-scripts
```
Install headscale
```bash
  bash install-headscale.sh
```
Create User
```bash
  bash create-user.sh
```
Remove User
```bash
  bash remove-user.sh
```
## Linux Client
Download and Install Tailscale
```bash
  curl -fsSL https://tailscale.com/install.sh | sh
```
Then go to the server and run the create-user.sh and copy the output comand to the Client console.

Comand should look like this
```bash
  tailscale up --login-server <serverip> --authkey <authkey>
```
## Windwos Client
Download and Install Tailscale
```bash
  https://tailscale.com/download/windows
```
Then go to the server and run the create-user.sh and copy the output comand to the CMD or Powershell.

Comand should look like this
```bash
  tailscale up --login-server <serverip> --authkey <authkey>
```
And Tailscale will connect automaticly

## Android Client
Download and Install Tailscale
```bash
https://tailscale.com/download/android
```
How to enable change server Tutorial

[VideoTutorial](https://github.com/tailscale/tailscale-android/pull/55)

Go to change server and enter your server URL

- Go to your tailscale server and run the create-user.sh to create and user in this case we dont need the command.
- Install the Android tailscale app and open it.
- Tap on the “…” menu 6+ times and “Change Server” should appear in the menu.
- Enter your headscale URL and click Save.
- Tap “Login with Other”.
- Then it will show a Command that you need to copy and paste to headscale server console and chenge the USERNAME with the user that you created firstly
- And finally refresh the Android app and click “Login with Other”
