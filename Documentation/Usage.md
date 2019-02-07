## **Doric Usage Guide**

### **Integration**
Follow installation instructions and import framework as below

```swift
import Doric
```
------
### **Color Palette**

Colors are one of important building block along with Typography & Layout. Colors are *everywhere* in product and gives meaningful identity. So defining a color palette and keeping consistency is most important part while designing interface.

Color palette `MainColorPalette` supports 3 color set, a Grayscale color set and a Semantic color set, however it can be further extended if required.

> Best practice would be define limited number of color sets, i.e. primary color, secondary color and supplementary color along with grayscale and colors for messaging would be sufficient in most of the cases.

#### Creating Color Palettes

To create a color palette implement `ColorPalette` with `base` color.
For example as below creates *'Astronaut Blue'* as base color. It will have 2 lighter and darker colors with default implemention by `ColorPalette`.  

```swift
public struct BrandPrimaryColor: ColorPalette {
    /// 'Astronaut Blue' color, HEX #013e62, RGB (1,62,98)
    public static let base = UIColor("#013e62")
}
```

Define additional secondary and supplementary colors and compose them into `AppColorPalette` :

```swift
// Define color palette
struct AppColorPalette: MainColorPalette {
    static let primary: ColorPalette.Type = BrandPrimaryColor.self
    static let secondary: ColorPalette.Type = BrandSecondaryColor.self
    static let supplementary: ColorPalette.Type = SupplimantoryColor.self
    static let semantic: SemanticColorPalette.Type = DefaultSemanticColorPalette.self
    static let grayscale: LargerColorPalette.Type = DefaultGrayScalePalette.self
}

// Design System
struct DesignSystem {
  // Define color palette
  static let colorPalette: MainColorPalette.Type = AppColorPalette.self
}

// Access primary color as below
DesignSystem.colorPalette.primary.base
```

#### Shades and Tints

In color theory, a tint reduces darkness, while a shade increases darkness.
Lighter and darker colors are produced by adjusting `UIColor`'s brightness and saturations.

By default `ColorPalette` will generate two darker and lighter colors based on defined `base` color.
But optionally can be defined as below :

```swift
public struct BrandPrimaryColor1: ColorPalette {
    // more lighter shade of base
    public static let lighten2 = UIColor("#668ba0")

    // lighter shade of base
    public static let lighten1 = UIColor("#336481")

    // base color
    public static let base = UIColor("#013e62")

    // darker color of base
    public static let darken1 = UIColor("#00314e")

    // more darker color of base
    public static let darken2 = UIColor("#00253a")
}
```

#### Grayscales

With primary and secondary colors an application also needs few grayscale colors too. Grayscale colors are used for text, lines, borders and view backgrounds.

Framework has built-in grayscale color palette with 9 shades and tints of gray. Use `DefaultGrayScalePalette` or if required specific gray colors then implement color palette protocol same as above.

```swift
static let grayscale: LargerColorPalette.Type = DefaultGrayScalePalette.self
```

#### Semantic Color Palettes

App also needs colors for messaging. So there is need of colors that can be used for success, warning, danger, error, information etc.
Semantic color sets are unique and different then brand primary, secondary colors.

By default framework provides SemanticColorPalette which has color set for error, warning, success, info.


```swift
static let semantic: SemanticColorPalette.Type = DefaultSemanticColorPalette.self
```

Implement `SemanticColorPalette` protocol in case if you need different set of semantic colors.

#### Gradients

`GradientColor` protocol provides gradient definition with start & end colors and start & end points. It is just and helper to create gradient using `CAGradientLayer`.

```swift
  // Left-to-Right gradient color can be defined as below
 struct CardGradientColor: GradientColor {
   let startColor = UIColor("#1e3c72")
   let endColor =  UIColor("#2a5298")
 }

 // Single color with darker/light shade gradient color can be defined as below.
 //`endColor` will be darker or lighter of `startColor`
 struct ShadedGradientColor: GradientColor {
   let startColor = UIColor("#1e3c72")
}

```
This can be used to create `GradientView` instance. `UIColor` also implements `GradientColor` protocol, so it can be used directly to create gradients wherever `GradientColor` definations are passed.

#### Extended color palettes

Since color palettes are based on protocols, you can define as many as unique colors using `ColorPalette` & `LargerColorPalette` protocols same like primary color declared as above.

------

### **Typography**

Typography is one of the core element of design system. Typography is a collection of individual styles used across an app. To create an appropriate visual hierarchy on each screen, we will need to define a number of different font sizes. Also it may change according to users preferred content category.

`Doric` ensures that typographic systems can stand up to change at scale. It supports fixed sized and dynamic sized scalable fonts. Also it provides both built-in text styles and custom text style, however use built-in text styles whenever possible.

iOS includes the following text styles:

- Large Title
- Title 1
- Title 2
- Title 3
- Headline
- Body
- Callout
- Subhead
- Footnote
- Caption 1
- Caption 2

*See [Typography](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/)*

#### System Fonts
`Doric` has default implemented `SystemTypography` which supports all Text Styles with System Font.

>San Francisco (SF) is the system typeface in iOS.

Example usage as below -
```swift
import Doric

// Global Design System
struct DesignSystem {
  // Define Typography
  static let typography: SystemTypography.Type = SystemTypography.self
}
```

Get `body` font as below
```
let bodyLabel : UILabel
.....
.....
// Get preferred body fonts
bodyLabel.font = DesignSystem.typography.preferredFont(forTextStyle: .body)

```

#### Fonts Styles

`Doric` supports all `UIFontTextStyle`, it is preferred to use built-in text styles. Below will give `body` fonts.


```swift
// Get body fonts which is 17.0 by default.
bodyLabel.font = DesignSystem.typography.font(forTextStyle: .body)
```

*See [UIFontTextStyle](https://developer.apple.com/documentation/uikit/uifonttextstyle) for more details*

#### Scalable Dynamic Fonts

When you need scalable fonts as per user's preferred content size category use below method.

```swift
bodyLabel.font = DesignSystem.typography.preferredFont(forTextStyle: .body)
```
*See [UIContentSizeCategory](https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory) for more details*

#### Custom Font Styles

It is best practice to use built-in font style (similar to `UIFontTextStyle`), but you can still define your custom Font Style.

Example Custom Font Style - 4 styles contentHeading, contentBody, contentInstruction, brand
```swift
enum OpenSansStyle: String {
    case contentHeading
    case contentBody
    case contentInstruction
    case brand
}
```

See `Typography+OpenSans.swift` example in demo.

------

### **Layout & Spacing**

Alignment & White spaces are other fundamental parts of interface composition. So spaces between buttons, labels, views and other margins matters most and it is expected to be consistence in most of the cases.

For iOS views are arranged using auto layouts and/or manual frame manipulation.

Doric provides `NSLayoutAnchor` based tiny constraint creation utility to add constraints with consistence space. Because it is statically typed it helps to avoid common mistakes. Instead of adding hardcoded margins and constants, it supports creating constraints via programmatically with predefined value sets.

For example use `Space` enum with set of few predefined space values.

```swift
// Container
let containerView = UIView()

// Child
let childView = UIView()
containerView.addSubview(childView)

// Create constraint to keep child view left aligned to containerView
childView.anchorLeft(containerView)

// OR

// Create constraint to keep child view left aligned to containerView
// with leading Space.p2 margin which is 16.0,
// this ensures spacing is limited to defined sets.
childView.anchorLeft(containerView, constant: .equalTo(Space.p2))

// Keep childView in centre of containerView
childView.anchorCenter(containerView)

// Set predefined button sizes
let button = UIButton()
....
button.anchorButtonHeight(.medium)
```

#### Custom Spacing

`Space` enum provides predefined values, however if needed you can define custom spaces as below, auto layout wrapper takes any type which implements `LayoutValueRepresentable`.

> It would be good practice if space sets are predefined and limited.

```swift
// Example to create custom space
enum CustomSpace: CGFloat, LayoutValueRepresentable {
    case p1 = 3.0
    case p2 = 6.0
    case p3 = 9.0
    case p4 = 12.0
}

childView.anchorLeft(containerView, constant: .equalTo(CustomSpace.p2))
```
------

### **Scale Types**

Framework provides built-in set of various size charts. For example borders, corner radius, button sizes, icon sizes etc.

Use `Scale` or `FullScale` protocols to define custom size charts.

#### Borders & Corner Radius

Use predefined sets of corner radius and borders as below
```swift
static let cornerRadius: CornerRadiusSize = CornerRadius.self

static let border: BorderSize = Border.self

```

### **Iconography**

Currently frameworks supports to create template icons with tinted color, future plan is expand this framework for icon fonts and various image processing utilities.

#### Tinted Icons

Example template image can created with primary color as below :
```swift
let image1 = UIImage.template(named: demoImageName, tintColor: primaryColor)
```

------

### **Tools & Helpers**

Framework provides a small utility tool to help and debug views.

#### Graph

For example show grid/graph on top of current interface as below
```swift
Doric.shared.isHidden = false
```

#### Guideline

To show guide on text label as below.
```swift
let guidelines: UIView.Guideline = .all
textLabel?.showGuide(guideline: guidelines)
```

It just adds views equant to target view's edges, dimensions and base lines.
