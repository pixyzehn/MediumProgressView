MediumProgressView
====================

Medium Progress View in Swift like a Medium Web application Progress View.

Inspired by [KIProgressView](https://github.com/kaiinui/KIProgressView). I made that a reference and customized a fine point.

## Demo

![MediumProgressView](https://github.com/pixyzehn/MediumProgressView/blob/master/Assets/MediumProgressView.gif)

##Installation

###CocoaPods

The easiest way to get started is to use [CocoaPods](http://cocoapods.org/). Add the following line to your Podfile:

```ruby
platform :ios, '8.0'
use_frameworks!
# The following is a Library of Swift.
pod 'MediumProgressView'
```

Then, run the following command:

```ruby
pod install
```

###Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MediumProgressView into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "pixyzehn/MediumProgressView"
```

Run `carthage update`.

```bash
$ carthage update
```

###Other

Add the MediumProgressView (including MediumProgressView.swift and  MediumProgressViewManager.swift) folder into your project.

## Description

You can set the certain property. For example, position and color, height, duration and so on. If you don't set the these property, default value is used.

```Swift
let progressViewManager = MediumProgressViewManager.sharedInstance
progressViewManager.position = .bottom    // Default is top.
progressViewManager.color = UIColor.red   // Default is UIColor(red:0.33, green:0.83, blue:0.44, alpha:1).
progressViewManager.height = 2.0          // Default is 4.0.
progressViewManager.isLeftToRight = false // Default is true.
progressViewManager.duration = 2.0        // Default is 1.2.
progressViewManager.repeatCount = 3       // Default is infinity.
```

The following method is show method.

```Swift
progressViewManager.show()
```

The following method is hide method.

```Swift
progressViewManager.hide()
```

See MediumProgressView-Sample project for more information.

## Licence

[MIT](https://github.com/pixyzehn/MediumProgressView/blob/master/LICENSE)

## Author

[pixyzehn](https://github.com/pixyzehn)🐈
