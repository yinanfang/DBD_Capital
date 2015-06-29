# DBD_Capital iOS
Short description here.

Setup tips:
Create app, add the Podfile and install Pods

    pod install

If there's error about "Could not build module 'xxx'"" or "include of non-modular header inside framework module"

    Try going Build Settings under "Target" and set "Allow Non-modular Includes in Framework Modules" to YES.
    Reference: http://stackoverflow.com/questions/27776497/include-of-non-modular-header-inside-framework-module

Add Class prefix for existing files in main.m, AppDelegate. Click on the project then in the right hand menu Project Document, change Class Prefix

    Reference: http://stackoverflow.com/questions/8069361/how-to-change-the-class-prefix-in-xcode-4

Add GCAppKit to the Bundle directory
Create other groups, corresponding folders in Bundle directory, and relate them in Xcode

Delete default storyboard and viewController

Enable XcodeColor: https://github.com/CocoaLumberjack/CocoaLumberjack/issues/50#issuecomment-34286656






Use Images.xcassets to avoid different naming suffix for image files





