

![Doric: Design System Foundation in Swift](https://raw.githubusercontent.com/jayeshk/Doric/master/doric.png)

[![Build Status](https://travis-ci.com/jayeshk/Doric.svg?branch=master)](https://travis-ci.com/jayeshk/Doric) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Doric.svg)](https://img.shields.io/cocoapods/v/Doric.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-red.svg?style=flat)](https://github.com/Carthage/Carthage) [![Platform](https://img.shields.io/cocoapods/p/Doric.svg?style=flat)](https://github.com/jayeshk/Doric)
![Documentation](https://github.com/jayeshk/Doric/blob/master/docs/badge.svg)

# **Doric: Design System Foundation**

Design System foundation written in Swift. Protocol oriented, type safe, scalable framework for iOS.

- [Features](#features)
- [Requirements](#requirements)
- [Contribute](#contribute)
- [Installation](#installation)
- [Usage](./Documentation/Usage.md)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Typography
- [x] Iconography
- [x] Colour Palette
- [x] Dynamic scalable font support
- [x] Auto layout
- [x] Gradients, Shadows, Borders and other scales
- [x] Layout spacing
- [x] Themes
- [x] UI Debugging helpers
- [x] [API Document](https://jayeshk.github.io/Doric/usage.html) & [Usage Documentation](Documentation/Usage.md)

## Sketch Plugin

- See [DoricSnippet - BETA](https://github.com/jayeshk/DoricSnippet)
- Generates Swift code snippets for Doric framework.

## Roadmap

> *Not in specific orders to achieve it.*

- [ ] Add debugging tools (Ruler etc.) [In progress]
- [ ] Expand framework to create more Styles
- [ ] Colour processing utilities
- [ ] Trait based layouts (UITraitCollection) [In progress]
- [ ] Accessibility for colour palettes
- [x] Sketch plugin to generate palette. [Try here](https://github.com/jayeshk/DoricSnippet)

## [Usage Guide](https://jayeshk.github.io/Doric/usage.html)
- See documentation
## Requirements

- iOS 11.0+
- Xcode 10.2+
- Swift 5

## Demo
![Preview](https://raw.githubusercontent.com/jayeshk/Doric/master/demo-screenshot.png) ![Preview](https://raw.githubusercontent.com/jayeshk/Doric/master/screens-preview.gif)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is an application level dependency manager for the Objective-C, Swift and any other languages that run on the Objective-C runtime that provides a standard format for managing external libraries. For usage and installation instructions visit [site](https://cocoapods.org)

To integrate `Doric`  using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Doric', '~> 1.0.0'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) builds your dependencies and provides you with binary frameworks, but you retain full control over your project structure and setup. Carthage does not automatically modify your project files or your build settings.

. To integrate `Doric` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jayeshk/Doric" ~> 1.0.0
```

### Manually

If you can integrate project manually as below using git submodule

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialised as a git repository:

  ```bash
  $ git init
  ```

- Add Doric as a git submodule by running the following command:

  ```bash
  $ git submodule add https://github.com/jayeshk/Doric.git
  ```

- Open the new `Doric` folder and drag the `Doric.xcodeproj` into the Project Navigator.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Doric.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see `Doric.framework` nested inside a `Products` folder. Select the `Doric.framework` for iOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Doric` will be listed as `Doric`.

    > `Doric.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.


## Contribute

Doric is open to contribute, see contribution notes.
  - If you **want to contribute**, submit a pull request.
  - If you **found a bug**, open an issue.
  - If you need **help with a feature or need to discuss best practices** please see **usage document** , still anything to discuss contact me (doricdesignsystem@gmail.com).

## FAQ

#### **About Doric name?**

The Doric order was one of the three orders of ancient Greek and later Roman architecture, Doric is named based [Doric_order](https://en.wikipedia.org/wiki/Doric_order). Hence provides pillars for your digital products.

#### **Why Design System required?**

As the number of devices screen variants and environments are increasing, so there is need to create scalable interface Design Systems.

Doric's primary goal is to create a system which allows you to manage design at scale for iOS. Consistency, scalability and efficiency across app are focused areas. See [Awesome Design Systems](https://github.com/alexpate/awesome-design-systems)

#### **It is required to implement all parts of Doric?**

Doric provides various building blocks to implement interface. All blocks can be used independently or can be composed as needed. For example your app can use Typography only or Color Palettes. Better practice would be compose all them into single Design System.

It also allows you to use any of these blocks with other third part frameworks. For example Spacing and Layout can be used any other third party frameworks.

Since it protocol oriented framework you can further extended any of section and customise it. Doric comes with few default implementations. See more for [usage guide](Documentation/Usage.md)

## Credits

`Doric` is influenced by various Design System guidelines and many *stackoverflow* posts.

Major source of inspiration [Atomic Design](http://atomicdesign.bradfrost.com/)

*Brad Frost, author of Atomic Design : “comprehensive collection of the bits and pieces that make up your interface”.*

---
- [OpenSans Fonts](./Demo/Catalogue/Catalogue/open-sans/)

## License

`Doric` is released under the MIT license. See LICENSE for details.
