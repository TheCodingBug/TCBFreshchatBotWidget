# TCBFreshchatBotWidget

[![CI Status](https://img.shields.io/travis/TheCodingBug/TCBFreshchatBotWidget.svg?style=flat)](https://travis-ci.org/TheCodingBug/TCBFreshchatBotWidget)
[![Version](https://img.shields.io/cocoapods/v/TCBFreshchatBotWidget.svg?style=flat)](https://cocoapods.org/pods/TCBFreshchatBotWidget)
[![License](https://img.shields.io/cocoapods/l/TCBFreshchatBotWidget.svg?style=flat)](https://cocoapods.org/pods/TCBFreshchatBotWidget)
[![Platform](https://img.shields.io/cocoapods/p/TCBFreshchatBotWidget.svg?style=flat)](https://cocoapods.org/pods/TCBFreshchatBotWidget)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```Swift
import TCBFreshchatBotWidget

@IBOutlet weak var widgetView: TCBFreshchatBotWidgetView!

// set and call whenever needed
let clientData: [String: Any] = ["name": "TCBFreshchatBotWidget User"]
let botWidget = TCBFreshchatBotWidget(clientHash: "d4980410f479d76eba5e00335eae38e8b04fd21e",
                                      botHash: "f90f6dfa4d478848d045c31ac0493f730c8368fd",
                                      showWidget: true,
                                      clientData: clientData)

widgetView.loadWidget(withBotWidget: botWidget)

// or
// set bot widget with resource directory to use
widgetView.loadWidget(withBotWidget: botWidget,
                      in: .developerDirectory,
                      inDomain: .userDomainMask)

```

## Requirements

## Installation

TCBFreshchatBotWidget is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TCBFreshchatBotWidget', :git => 'https://github.com/TheCodingBug/TCBFreshchatBotWidget.git'
```

## Author

[Neil Francis Ramirez Hipona](https://github.com/nferocious76), nferocious76@gmail.com

## License

TCBFreshchatBotWidget is available under the MIT license. See the [LICENSE](https://github.com/TheCodingBug/TCBFreshchatBotWidget/blob/main/LICENSE) file for more info.
