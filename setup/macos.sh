#!/bin/sh
# Sets reasonable macOS defaults.
#
# inspired by https://github.com/caarlos0/dotfiles/blob/master/macos/set-defaults.sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "  › Show the ~/Library folder"
chflags nohidden ~/Library

echo "  › Don't automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "  › Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "  › Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "› Kill related apps"
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
	"Terminal" ; do
	killall "$app" >/dev/null 2>&1
done
set -e
echo "Done. Note that some of these changes require a logout/restart to take effect."