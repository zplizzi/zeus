# Sets up an OSX system how I like it

# Set to quit on errors
set -e

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Might need this for brew to work properly
# cd /usr/local && sudo chown -R $(whoami) bin etc include lib sbin share var Frameworks

# Install packages
brew install \
  mosh \
  git \
  wget \
  python3 \
  python \
  zsh \
  gnupg


# Set up a bunch of mac settings

#"Disabling automatic termination of inactive apps"
#defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
#sudo spctl --master-disable
#sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
#defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Automatically quit printer app once the print jobs complete"
#defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
#defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
#defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Setting trackpad & mouse speed to a reasonable number"
#defaults write -g com.apple.trackpad.scaling 2
#defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
#defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
#defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
#/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
#defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
#defaults write com.apple.dock expose-animation-duration -float 0.1

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0



#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Setting screenshots location to ~/Desktop"
#defaults write com.apple.screencapture location -string "$HOME/Desktop"



# Donâ€™t automatically rearrange Spaces based on most recent use
#defaults write com.apple.dock mru-spaces -bool false

killall Finder

echo "Done!"
  
# Run general setup files

bash ~/zeus/setup/setup_vim.sh
bash ~/zeus/setup/setup_zsh.sh
bash ~/zeus/setup/setup_venv.sh

bash ~/zeus/setup/setup.sh
