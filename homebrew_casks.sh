# Apps
apps=(
  alfred
  dropbox
  google-chrome
  qlcolorcode
  screenflow
  appcleaner
  firefox
  qlmarkdown
  spotify
  vagrant
  iterm2
  qlprettypatch
  sublime-text3
  virtualbox
  atom
  flux
  qlstephen
  vlc
  nvalt
  quicklook-json
  skype
  transmission
  caffeine
  boom
  evernote
  the-unarchiver
  mysqlworkbench
  dash
  textexpander
  bettertouchtool
  path-finder
  zoom
  mou
  coconutbattery
  marked
  private-internet-access
  vox
  sonos
  plex-media-server
  google-drive
  ubersicht
  pgadmin3
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
