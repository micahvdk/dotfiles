# Oneflare Dotfiles

The goal of these dotfiles is to be a base for you to get your dev machine up and running at Oneflare with a functional and useful terminal.

This is a highly opinionated setup, so we recommend cloning this repository if you have never setup dotfiles before and start customising it to your liking. If you already have a existing dotfile setup, please read the instructions about merging in your existing configuration files. We also recommend not removing any of the core dependencies installed under the 'REQUIRED' comment, as these are required to run the various Oneflare code bases.

If you are already a 10X developer with wizard level 9 dotfile skills, feel free to continue to use your own or take some inspiration from this repository. We highly recommend using the `dependencies/Brewfile` as a minimum base to get your laptop installed with the basic everyday requirements to operate at Oneflare.

---

## General Structure

This dotfile setup utilises the [dotbot](https://github.com/anishathalye/dotbot) framework for easy dependency management and setup.

There has been a large amount of influence from other dotfile examples like:

- https://github.com/sobolevn/dotfiles
- etc

The repository is split into a few parts:

| what              | why                                                           |
| ----------------- | ------------------------------------------------------------- |
| config            | this is where the base configuration components exist         |
| dotbot            | for managing the installation and setup                       |
| dotbot-brew       | dotbot plugin for brew file dependencies                      |
| shell             | configuration for your shell like exports and aliases         |
| Brewfile          | required dependencies to get you up and running               |
| install.sh        | RUN ME!                                                       |
| install.conf.yaml | installation configuration                                    |
| pre-install.sh    | ensures that you have some basic things in place (like brew!) |

**These dotfiles setup ZSH as your shell.**

We feel that ZSH is superior for a number of reasons, if you wish to not use it, you can always remove the parts in `install.conf.yaml` that copy in the `.zshrc` files.

The setup symlinks your shell files to the project folder so if you change anything, you should only need to restart a new shell session for things to take affect. This excludes adding new brew components, which we suggest adding to the Brewfile and rerunning the install script.
### Prerequisites

You need to make sure your SSH key has been installed.

[Generate and Install SSH Key](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Import SSH Key into GitHub](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account)

This is used to make sure you can clone from GitHub. 


### Installation

1.  Fork the repository.

Make sure to make a fork of this repository so you can hack on your personal config. If you want to add something back into the master repository, feel free to make a pull request.

2.  Clone your new dotfiles down and change into the directory.


At this point it does not matter where the dotfiles project folder exists, but we recommend cloning into `~/`

    cd ~
    git clone git@github.com:{yourname}/dotfiles.git
    cd dotfiles

3.  Create your secret files

These secret files should be used to export credentials, access keys, tokens etc so they are available on your shell. We recommend splitting work and personal out for ease of management. The work_secrets file contains some required tokens for use at Oneflare. Whilst it is not a requirement to populate them before continuing with the installation, we recommend it, or at least the ones marked with a ! for important

    cp secrets/.work_secrets.template secrets/.work_secrets
    cp secrets/.personal_secrets.template secrets/.personal_secrets

4. Update the EXPORTS files

You will need to change a few things in `shell/.exports` to match your details:

    GIT_AUTHOR_NAME=
    GIT_AUTHOR_EMAIL=
    EDITOR=

Set `EDITOR` to one of atom, vscode, sublime or vim

5. Sign into the mac app store. You need to do this manually via the App Store application prior to running the installation script otherwise dependencies will not install correctly.

6. Run the installation

   `./install`

This may take some time (like 30 mins) on the first setup so go grab a coffee.
You may be asked for your password a few times so make sure to enter it when needed.

7. Install Editor/s

   `./editor/install.sh`

You can install multiple or just one, make sure to install the one you set as `EDITOR` earlier!

8. Setup iTerm2.

- Open iTerm2 from Applications and go to *Preferences -> Profiles*
- Import colour schemes under the *Colors* Tab, *Colors Preset* drop down bottom right. We have included some nice material design ones but feel free to use what ever you feel like. Some more are found [here](https://iterm2colorschemes.com)
- Change your font under *Text -> Change Font*. Make sure to select a "*Nerd Font*" that was installed as part of the setup to ensure the icons work properly.
