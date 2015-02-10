binaries=(
  graphicsmagick
  webkit2png
  mackup
  rename
  zopfli
  ffmpeg
  python
  gnupg2
  gnupg
  sshfs
  trash
  node
  fish
  tree
  ack
  hub
  git
)

echo "installing binaries..."
brew install ${binaries[@]}
