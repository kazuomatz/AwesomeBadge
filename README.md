# AwesomeBadge

[![Version](https://img.shields.io/cocoapods/v/AwesomeBadge.svg?style=flat)](https://cocoapods.org/pods/AwesomeBadge)
[![License](https://img.shields.io/cocoapods/l/AwesomeBadge.svg?style=flat)](https://cocoapods.org/pods/AwesomeBadge)
[![Platform](https://img.shields.io/cocoapods/p/AwesomeBadge.svg?style=flat)](https://cocoapods.org/pods/AwesomeBadge)


AwesomeBadgeView is a view class as Like a badge using fontawesome 5. As a use, at the mission reward of the game app etc.

<img src="https://user-images.githubusercontent.com/2704723/51324154-4de49080-1aad-11e9-904c-4046d65d881b.png" width="75%"/>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

[FontAwesome.swift](https://github.com/thii/FontAwesome.swift)

## Installation

AwesomeBadge is available through [CocoaPods](https://cocoapods.org/pods/AwesomeBadge). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AwesomeBadge'
```

## Usage

```swift
import AwesomeBadge


let badgeView = AwesomeBadgeView(
            fontStyle: .brands,            // font awesome style .solid / .regular / .brands
            fontName: "fa-android",        // font awesome font name 'fa-xxxxx'
            frame: CGRect(x:0, y:0, width: 100,height: 100),
            backgroundColor: "a4c639"     // Color (Hex String)
        )
self.view.addSubView(badgeView)       
```

<img src="https://user-images.githubusercontent.com/2704723/51325372-1fb48000-1ab0-11e9-9cc9-b282fa0dbff2.png" width="20%"/>


```swift
let badgeView = AwesomeBadgeView(
            fontStyle: .brands,            // font awesome style .solid / .regular / .brands
            fontName: "fa-android",        // font awesome font name 'fa-xxxxx'
            frame: CGRect(x:0, y:0, width: 100,height: 100),
            backgroundColor: "a4c639"     // Color (Hex String)
            gradient: false               // not add GradientLayer
        )
self.view.addSubView(badgeView)       
```

<img src="https://user-images.githubusercontent.com/2704723/51325479-5a1e1d00-1ab0-11e9-8143-a772138611c0.png" width="20%"/>


```swift
@IBOutlet weak var badgeView:AwesomeBadgeView!

badgeView.drawBadge(
    fontStyle: .solid,
    fontName: "fa-star-and-crescent",
    radius: 200,
    backgroundColor: "273751",
    gradient: true,
    foregroundColor: "f4e242"
)
```
<img src="https://user-images.githubusercontent.com/2704723/51327322-6906ce80-1ab4-11e9-93a6-bbd8583f990f.png" width="20%"/>

## Author

kazuomatz, getlasterror@gmail.com

## License

- AwesomeBadge is available under the MIT license. See the LICENSE file for more info.
- All font files licensed under [SIL OFL 1.1](http://scripts.sil.org/OFL)
- FontAwesome.swift licensed under [MIT](http://thi.mit-license.org/)
