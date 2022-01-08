xcodebuild -scheme iOS build -quiet -destination 'platform=iOS Simulator,name=iPhone 13'
echo iOS done
xcodebuild -scheme tvOS build -quiet -destination 'platform=tvOS Simulator,name=Apple TV 4K (at 1080p) (2nd generation)'
echo tvOS done
xcodebuild -scheme watchOS build -quiet -destination 'platform=watchOS Simulator,name=Apple Watch Series 7 - 45mm'
echo watchOS done
xcodebuild -scheme macOS build -quiet -destination 'platform=macOS,arch=x86_64'
echo macOS done
