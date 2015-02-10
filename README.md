# Introduction
This repo contains some scripts and instructions for how to setup a brand new Mac.  As I am a developer, most of this is geared towards preping your Mac for software development but feel free to clone this repo and adapt to your needs.

[credit](http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac)

# Install Homebrew
The first tool you should install on your Mac is [Homebrew](http://brew.sh/), the self-proclaimed "missing package manager for OS X".  We will use Homebrew  in the next steps to install all the other software we need.  Use the script homebrew_installer.sh to install Homebrew (or follow the instruction on [their website](http://brew.sh/)):

    $ chmod 755 homebrew_installer.sh
    $ ./homebrew_installer.sh

# Upgrade Unix Tools
## Install GNU core utilities (those that come with OS X are outdated)
    $ brew install coreutils

## Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
    $ brew install findutils

## Install Bash 4
    brew install bash

## Install more recent versions of some OS X tools
    brew tap homebrew/dupes
    brew install homebrew/dupes/grep

You'll also need to update the $PATH in your ~/.bash_profile in order to use these tools over their Mac counterparts:

    $PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install other useful Tools
    $ chmod 755 brew_binaries.sh
    $ ./brew_binaries.sh

This script will also install [fish](http://fishshell.com/) (friendly interactive shell) which is a smart and user-friendly command line shell for OS X, Linux, and the rest of the family.  In order to use fish as your default shell, you do the following:

// Add Fish to /etc/shells, which will require an administrative password:

    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
// Make Fish your default shell:

    chsh -s /usr/local/bin/fish

## Basic fish configuration
Create the Fish config directory:

    mkdir -p ~/.config/fish

Create initial config file:

    vim ~/.config/fish/config.fish

Initial config file contents, which adds /usr/local/bin to the PATH environment variable:

    set -g -x PATH /usr/local/bin $PATH

Open a new terminal session, which should now load the Fish shell by default for the first time. You can enter help, followed by the return key, to load user documentation in your default browser.

You can also see your current configuration in your default browser by first entering this command:

    fish_config

… and then visiting http://localhost:8000/ in your browser of choice.

Fish can parse your installed man pages and automatically generate completion files for your command-line tools. You should periodically run the following command to update those completions, which are stored in ~/.config/fish/completions by default:

    fish_update_completions

Last but not least, running:

    echo "set -g -x fish_greeting ''" >> ~/.config/fish/config.fish

… will eliminate the Fish welcome message that appears by default. If you want to add your own custom welcome message instead of removing the message entirely, insert your preferred text inside the '' marks.

After you're done, you should clean everything up with:

    brew cleanup

# Installing Apps with Homebrew Cask
Homebrew Cask is an extension for Homebrew that allows you to automate the installation of Mac Apps and Fonts.

After you have homebrew installed, you'll want to install Homebrew Cask:

    brew install caskroom/cask/brew-cask

The number of apps you can install with Cask is enormous and growing every day. You can take a look at what applications are installable in their [caskroom/homebrew-cask repo](https://github.com/caskroom/homebrew-cask/tree/master/Casks) or you can search for applications from the CLI, e.g. searching foor Chrome:

    brew cask search /google-chrome/

Everyone's choice of apps will be different, but here is the script I use to install my favorite apps:

    $ chmod 755 homebrew_casks.sh
    $ ./homebrew_casks.sh

Just open the file and change it as you want by adding or removing apps in the list.

# Install custom fonts
    $ brew tap caskroom/fonts
    $ chmod 755 homebrew_fonts.sh
    $ ./homebrew_fonts.sh

These are the fonts that I use, again, open the script and change as you see fit for your personal preference.

# Backup and restore settings from your current Mac
Mackup is a community-driven tool for backing up and restoring system and application settings. You can find the list of applications it supports in the [lra/mackup](https://github.com/lra/mackup/tree/master/mackup/applications) repo.  If you ran the script `brew_binaries.sh` unchanged from this repo, you already have mackup installed, otherwise you can add it now with

    $ brew install mackup

You need to install this on your old Mac first, then backup all the settings on that old Mac using

    $ mackup backup

This will match your installed applications with it's recipes and symlink the settings files to ~/Dropbox/Mackup.

Then, on your new Mac you can restore all these settings with:

    $ mackup restore

# Remove Oracle deamons
If you want to gain back precious system resources you can disable the Oracle software deamons on your Mac.  You do this by going to `/Library/LaunchAgents` and  `/Library/LaunchDaemons/` and remove the plist files related to MyDesktop and McAfee Virus scanner.  Then restart your Mac.
