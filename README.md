# NKJModalSelector

[![CI Status](http://img.shields.io/travis/nakajijapan/NKJModalSelector.svg?style=flat)](https://travis-ci.org/nakajijapan/NKJModalSelector)
[![Version](https://img.shields.io/cocoapods/v/NKJModalSelector.svg?style=flat)](http://cocoapods.org/pods/NKJModalSelector)
[![License](https://img.shields.io/cocoapods/l/NKJModalSelector.svg?style=flat)](http://cocoapods.org/pods/NKJModalSelector)
[![Platform](https://img.shields.io/cocoapods/p/NKJModalSelector.svg?style=flat)](http://cocoapods.org/pods/NKJModalSelector)

## Usage

NKJModalSelector is the alternative to the library of UIPickerView(drum roll) in Swift. You can select a item using UITableView.
Is inspired to [Etsy](https://www.etsy.com/)'s view controller transition.

## Requirements

- iOS 8.0+
- Xcode 7.2+


## Installation

NKJModalSelector is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NKJModalSelector"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## ViewController

```objc
[NKJModalSelector appearance].shouldTransformScaleDown = YES;

NKJModalSelectorNavigationController *modalNavigationViewController = (NKJModalSelectorNavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"NKJModalSelectorNavigationController"];

modalNavigationViewController.parentNavigationController = self.navigationController;

[self.navigationController addChildViewController:modalNavigationViewController];
[self.navigationController si_presentViewControllerToViewController:modalNavigationViewController];
```

## ModalViewController

- Create NavigationController and ViewController in storyboards.
- Input `NKJModalSelectorNavigationController` in Custom Class for NavigationController.


![Shari](https://raw.githubusercontent.com/nakajijapan/Shari/master/shari01.png)


### Closing a window

You can close using the following code in viewController:

```objc
NKJModalSelectorNavigationController *currentNavigationController;
currentNavigationController = (NKJModalSelectorNavigationController *)self.navigationController;
[currentNavigationController.parentNavigationController si_dismissModalViewWithComplation:^{
    // something
}];
```


## Author

nakajijapan, pp.kupepo.gattyanmo@gmail.com

## License

NKJModalSelector is available under the MIT license. See the LICENSE file for more info.
