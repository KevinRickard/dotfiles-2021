# Allow use of comments in interactive session (for copy and paste from this document)
echo "setopt interactivecomments" >> ~/.zshrc

source ~/.zshrc

# set up sudo, may or may not actually work
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
# perform brew manual next steps listed in the output

# set up refaults
brew install diffutils
# switch to a new terminal for diffutils to take effect
echo 'alias refaultswrite="defaults read > /Users/kevin/.refaults.json"' >> ~/.zshenv
echo 'alias refaults="diff --color /Users/kevin/.refaults.json <(defaults read)"' >> ~/.zshenv
echo 'alias r="refaults"' >> ~/.zshenv
echo 'alias rw="refaultswrite"' >> ~/.zshenv

# aliases
echo "alias l='ls -lah'" >> ~/.zshenv

source ~/.zshenv

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# dns setup
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1

# when you close a window it will not ask if you want to save, it will just save
defaults write "Apple Global Domain" NSCloseAlwaysConfirmsChanges -int 1

# Monday is the first day of the week
defaults write "Apple Global Domain" AppleFirstWeekday -dict gregorian 2


defaults write "Apple Global Domain" NSQuitAlwaysKeepsWindows -int 1
defaults write "Apple Global Domain" AppleSpacesSwitchOnActivate -int 0

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Hide Spotlight Icon
defaults write com.apple.Spotlight "NSStatusItem Visible Item-0" 0

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

defaults write "com.apple.AppleMultitouchTrackpad" Clicking -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" Clicking -int 1
defaults write "Apple Global Domain" com.apple.swipescrolldirection -bool false
defaults write "Apple Global Domain" ContextMenuGesture -bool true
defaults write "Apple Global Domain" AppleEnableSwipeNavigateWithScrolls -bool true
defaults write "Apple Global Domain" CGDisableCursorLocationMagnification -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadFiveFingerPinchGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadFiveFingerPinchGesture -int 0
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadFourFingerHorizSwipeGesture -int 2
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadFourFingerHorizSwipeGesture -int 2
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadFourFingerPinchGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadFourFingerPinchGesture -int 0
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadPinch -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadPinch -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadRightClick -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadRightClick -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerTapGesture -int 2
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerTapGesture -int 2
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadTwoFingerDoubleTapGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadTwoFingerDoubleTapGesture -int 0
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write "com.apple.dock" showAppExposeGestureEnabled -int 0
defaults write "com.apple.dock" showDesktopGestureEnabled -int 0
defaults write "com.apple.dock" showLaunchpadGestureEnabled -int 0
defaults write "com.apple.dock" showMissionControlGestureEnabled -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerDrag -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerDrag -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerVertSwipeGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerVertSwipeGesture -int 0
# Trackpad: disable trackpad rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 0
defaults write NSGlobalDomain com.apple.trackpad.rotateGesture -int 0

# Always show scroll bars, so that it doesn't resize windows when changing from trackpad to mouse and vice versa
defaults write -g AppleShowScrollBars -string Always

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly moderate keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Sleep the display after 18 minutes
sudo pmset -a displaysleep 18

# Save screenshots to the screenshots directory
mkdir "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set Home as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Do manual Finder preferences settings

############## Dock #############

# Set the icon size of Dock items to 42 pixels
defaults write com.apple.dock tilesize -int 42

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# ?????
defaults write com.apple.spaces spans-displays -int 0

# Disable the annoying line marks in terminal
defaults write com.apple.Terminal ShowLineMarks -int 0

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Don't start on startup
defaults write "com.spotify.client" AutoStartSettingIsHidden -int 0

# Don't show recent apps
defaults write com.apple.dock "show-recents" -bool "false"

########## Transmission #########

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true

# Skim tooltips
defaults write net.sourceforge.skim-app.skim SKDisableTableToolTips -boolean true

# Show bluetooth in menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# Show sound in menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true


brew install --cask spotify
brew install --cask sublime-text

brew install git
brew install wget
brew install the_silver_searcher
brew install tree

brew install coreutils
# perform addition of gnupath variable in zshenv, as seen in brew output
brew install findutils
brew install gnu-sed

brew install --cask firefox
brew install --cask google-drive
brew install --cask keepassxc
brew install --cask private-internet-access
brew install --cask discord
brew install --cask android-platform-tools
brew install --cask intellij-idea-ce
brew install --cask google-chrome
brew install --cask skim
brew install --cask vlc
brew install --cask reaper
brew install --cask signal
brew install --cask istat-menus
brew install --cask the-unarchiver
brew install --cask aerial
brew install --cask steam
brew install --cask grandperspective
brew install --cask sensiblesidebuttons
brew install --cask transmission
brew install --cask topnotch

# install ubiquiti unifi
brew install --cask temurin8
brew tap homebrew/cask-drivers
brew install --cask ubiquiti-unifi-controller

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
# Switch to a new terminal and set up powerlevel10k

git clone https://github.com/google/fonts.git ~/Library/Fonts/google-fonts

# sign in to app store
# install pixelmator from app store
# update apps as necessary from app store
