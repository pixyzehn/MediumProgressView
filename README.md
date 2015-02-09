MediumProgressView
====================

Medium Progress View in Swift like a Medium Web application Progress View.

Inspired by [KIProgressView](https://github.com/kaiinui/KIProgressView). I made that a reference and customized a fine point.

## Demo

![MediumProgressView](https://github.com/pixyzehn/MediumProgressView/blob/master/Assets/MediumProgressView.gif)

## Install

Move MediumProgressView directory (including MediumProgressView.swift and MediumProgressViewManager.swift) into your project.

## Description

You can set the certain property. For example, position and color, height, duration and so on. If you don't set the these property, Default value is used.

```Swift
var mediumProgressViewManager = MediumProgressViewManager.sharedInstance
mediumProgressViewManager.position = .Top // Default is top.
mediumProgressViewManager?.color    = MEDIUM_PROGRESS_COLOR 
// Default is UIColor(red:0.33, green:0.83, blue:0.44, alpha:1).
mediumProgressViewManager?.height   = 4.0 // Default is 4.0.
mediumProgressViewManager?.isLeft   = true // Default is true.
mediumProgressViewManager?.duration = 1.0  // Default is 1.2.
```

This is show method.

```Swift
mediumProgressViewManager.showProgressOnView(view)
```

This is hide method.

```Swift
mediumProgressViewManager.hideProgressView()
```

See MediumProgressView-Sample project for more information.

## Licence

[MIT](https://github.com/pixyzehn/MediumProgressView/blob/master/LICENSE)

## Author

[pixyzehn](https://github.com/pixyzehn)
