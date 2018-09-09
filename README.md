![Header](https://github.com/natmark/HUDMakerKit/blob/master/Resources/header.png?raw=true)

<p align="center">
    <a href="https://travis-ci.com/natmark/HUDMakerKit">
        <img src="https://travis-ci.com/natmark/HUDMakerKit.svg?token=nzmukddH8XeX8xpNA4qP&branch=master"
             alt="Build Status">
    </a>
    <a href="https://github.com/apple/swift">
        <img alt="Swift" src="https://img.shields.io/badge/swift-4.0-orange.svg">
    </a>
    <a href="https://github.com/natmark/HUDMakerKit/releases">
        <img src="https://img.shields.io/github/release/natmark/HUDMakerKit.svg"
             alt="GitHub release">
    </a>
    <a href="https://github.com/natmark/Donut/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg"
             alt="GitHub license">
    </a>
</p>

# HUDMakerKit
HUDMakerKit is customized Head-Up Display Maker written in Swift🐧.  
HUDMakerKit has [ProcessingKit](https://github.com/natmark/ProcessingKit/) engine. You can develop custom HUD with [Processing](https://processing.org/) draw functions. 

## Examples
|HUD|Code|
|:----:|:------:|
|<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/simple.gif?raw=true" alt="SimpleHUD" width="400px">|![SimpleHUD_Code](https://github.com/natmark/HUDMakerKit/blob/master/Resources/simpleHUD.png?raw=true)|
|<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/animate.gif?raw=true" alt="AnimateHUD" width="400px">|![AnimateHUD Code](https://github.com/natmark/HUDMakerKit/blob/master/Resources/animateHUD.png?raw=true)|
|<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/periodically.gif?raw=true" alt="PeriodicallyHUD" width="400px">|![PeriodicallyHUD Code](https://github.com/natmark/HUDMakerKit/blob/master/Resources/periodicallyHUD.png?raw=true)|

## Requirements
- Swift 4.0 or later
- iOS 10.0 or later

## Usage
1. Create custom class that inherits from `HUDMaker`
```swift
class SampleHUD: HUDMaker {
    func draw(frameCount: Int) {
     // the draw() function continuously executes the lines of code contained inside its block until the program is stopped or noLoop() is called.
    }
}
```

2. Implement HUD animation in `draw()` func
```swift
class SampleHUD: HUDMaker {
    func draw(frameCount: Int) {
        // MARK: Examples
        fill(255, 0, 0) // Sets the color used to fill shapes
        ellipse(50, 50, 100, 100) // Draws an ellipse (oval) to the screen
    }
}
```

3. Create a CustomHUD instance & set CustomHUD to `HUDRunner`
```swift
let customHUD = SampleHUD(frame: CGRect(x: 0, y: 0, width: 150, height: 150)) // Create a new instance
customHUD.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.3)
customHUD.layer.cornerRadius = 10

HUDRunner.shared.customHUD = customHUD // Set a customHUD
HUDRunner.shared.show() // Show HUD
```

## What's [Processing](https://processing.org/)
- Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts.
- It provides drawing functions with simple syntax
- [References](https://processing.org/reference/)

### Draw Oval in Processing
<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/oval.png" alt="oval" width="100px">

```Processing
// Draws an ellipse (oval) to the screen
// ellipse(center.x, center.y, width, height) 
ellipse(100, 100, 100, 100);
```

### Fill an oval
<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/oval_fill.png" alt="oval_fill" width="100px">

```Processing
// Sets the color used to fill shapes
// fill(R, G, B)

fill(255, 0, 0);
ellipse(100, 100, 100, 100);
```

### Set the stroke color
<img src="https://github.com/natmark/HUDMakerKit/blob/master/Resources/oval_stroke.png" alt="oval_stroke" width="100px">

```Processing
// Sets the color used to draw lines and borders around shapes
// stroke(R, G, B)

// Sets the width of the stroke used for lines, points, and the border around shapes.
// strokeWeight(weight)

stroke(255, 0, 0);
strokeWeight(5);
ellipse(100, 100, 100, 100);
```

## Installation
### [CocoaPods](http://cocoadocs.org/docsets/HUDMakerKit/)
Add the following to your `Podfile`:
```
  pod "HUDMakerKit"
```

### [Carthage](https://github.com/Carthage/Carthage)
Add the following to your `Cartfile`:
```
  github "natmark/HUDMakerKit"
```

## License
HUDMakerKit is available under the MIT license. See the LICENSE file for more info.
