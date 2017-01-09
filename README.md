KRActivityIndicatorView
===================

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)

# Introduction
`KRActivityIndicatorView` is a collection of awesome loading animations for OSX apps written in Swift 3.0.

This is a fork from [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView), which is made for iOS. Amazing code made by [Vinh Nguyen](https://github.com/ninjaprox)!

The original code for the NVActivityIndicatorView is not 100% compatible with OSX. And the project has some amazing loaders, so I decided to port the code in order for it to work in OSX. Fortunately, KRActivityIndicatorView maintains most of the functionality and all the animations of the iOS counterpart.

# Demo
![alt tag](https://raw.githubusercontent.com/henryforce/KRActivityIndicatorView/master/demo.gif)

# Animation types

| Type | Type | Type | Type |
|---|---|---|---|
1. BallPulse | 2. BallGridPulse | 3. BallClipRotate | 4. SquareSpin
5. BallClipRotatePulse | 6. BallClipRotateMultiple | 7. BallPulseRise | 8. BallRotate
9. CubeTransition | 10. BallZigZag | 11. BallZigZagDeflect | 12. BallTrianglePath
13. BallScale | 14. LineScale | 15. LineScaleParty | 16. BallScaleMultiple
17. BallPulseSync | 18. BallBeat | 19. LineScalePulseOut | 20. LineScalePulseOutRapid
21. BallScaleRipple | 22. BallScaleRippleMultiple | 23. BallSpinFadeLoader | 24. LineSpinFadeLoader
25. TriangleSkewSpin | 26. Pacman | 27. BallGridBeat | 28. SemiCircleSpin
29. BallRotateChase | 30. Orbit | 31. AudioEqualizer

# Installation

## Carthage

Install Carthage if need be.

```bash
$ brew update
$ brew install carthage
```

Add `KRActivityIndicatorView` in your `Cartfile`.

```ruby
github "henryforce/KRActivityIndicatorView"
```

Run `carthage` to build the framework and drag the built `KRActivityIndicatorView.framework` into your Xcode project.

## Manual

Copy `KRActivityIndicatorView` folder to your project. That's it.

_**Note:** Make sure that all files in `KRActivityIndicatorView` are included in Compile Sources in Build Phases._

# Usage

Firstly, import `KRActivityIndicatorView`.

```swift
import KRActivityIndicatorView
```

## Initialization

Then, there are two ways you can create KRActivityIndicatorView:

- By storyboard, changing class of any `NSView` to `KRActivityIndicatorView`.

_**Note:** Set Module to `KRActivityIndicatorView`._

- By code, using initializer. All parameters other than `frame` are optional and `KRActivityIndicatorView.DEFAULT_*` are used as default values.

```swift
KRActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
```

## Control

Start animating.

```swift
activityIndicatorView.startAnimating()
```

Stop animating.

```swift
activityIndicatorView.stopAnimating()
```

Determine if it is animating.

```swift
animating = activityIndicatorView.animating
```

## Change properties

In storyboard, you can change all properties in Attributes inspector tab of Utilities panel.

_**Note:** Use one of values (case-insensitive) in [Animation types](#animation-types) for `Type Name`._

All properties are public so you can change them all after initiating.

_**Note:** All changes must be made before calling `startAnimating()`._





# Acknowledgment

Thanks to [Connor Atherton](https://github.com/ConnorAtherton) for designing the loaders and [Danil Gontovnik](https://github.com/gontovnik) and [Vinh Nguyen](https://github.com/ninjaprox) for the base code.

# License

The MIT License (MIT)

2017 Henry Serrano [@HenrySerrano20](https://twitter.com/HenrySerrano20)
