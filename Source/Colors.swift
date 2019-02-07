// Doric
//
// Copyright (c) 2019 Jay K.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

/// LightenColorSet, represents lighter colors of base color.
public protocol LightenColorSet {
    /// Ligher color of base color.
    static var lighten1: UIColor { get }

    /// Ligher color of base color.
    static var lighten2: UIColor { get }
}

/// DarkenColorSet, represents darker colors of base color.
public protocol DarkenColorSet {
    /// Darker color of base color.
    static var darken1: UIColor { get }

    /// Darker color of base color.
    static var darken2: UIColor { get }
}

/// LightenColorSet, represents lighter colors of base color.
public protocol ExtendedLightenColorSet {
    /// Ligher color of base color.
    static var lighten3: UIColor { get }

    /// Ligher color of base color.
    static var lighten4: UIColor { get }
}

/// ExtendedDarkenColorSet, represents extedend darker colors of base color.
public protocol ExtendedDarkenColorSet {
    /// Darker color of base color.
    static var darken3: UIColor { get }

    /// Darker color of base color.
    static var darken4: UIColor { get }
}

/// Color which represents base color, other palettes creates lighter and darker colors of base color.
public protocol Color {
    /// represents base color
    static var base: UIColor { get }
}

/// `ColorPalette` represents base color with set of lighter and darker colors of base, total 5 colors (shades and tints) are represented by `ColorPalette`.
public protocol ColorPalette: Color, LightenColorSet, DarkenColorSet {}

/// LargerColorPalette represents base color with set of lighter and darker colors of base, total 9 colors (shades and tints)  are represented by `ColorPalette`.
///
/// Use it when larger set of lighter and darker colors are required.
public protocol LargerColorPalette: ColorPalette, ExtendedLightenColorSet, ExtendedDarkenColorSet {}

// MARK: - ColorPalette

public extension ColorPalette {
    /// Default darker by 0.25 of base color.
    static var darken1: UIColor {
        return base.darker(by: 0.25)
    }

    /// Default darker by 0.50 of base color.
    static var darken2: UIColor {
        return base.darker(by: 0.50)
    }

    /// Default lighter by 0.25 of base color.
    static var lighten1: UIColor {
        return base.lighter(by: 0.25)
    }

    /// Default ligher by 0.50 of base color.
    static var lighten2: UIColor {
        return base.lighter(by: 0.50)
    }
}

// MARK: - LargerColorPalette

public extension LargerColorPalette {
    /// Default darker by 0.75 of base color.
    static var darken3: UIColor {
        return base.darker(by: 0.75)
    }

    /// Default darker by 0.90 of base color.
    static var darken4: UIColor {
        return base.darker(by: 0.90)
    }

    /// Default lighter by 0.75 of base color.
    static var lighten3: UIColor {
        return base.lighter(by: 0.75)
    }

    /// Default lighter by 0.90 of base color.
    static var lighten4: UIColor {
        return base.lighter(by: 0.90)
    }
}

// MARK: -

/// Semantic color palette, used for messaging. Used to deliver information about success, error, warning.
///
/// Generally red for errors, green for success, yellow or organge for warning, blue or gray for informational messages.
public protocol SemanticColorPalette {
    /// Error colors.
    static var error: ColorPalette.Type { get }

    /// Warning colors.
    static var warning: ColorPalette.Type { get }

    /// Success colors.
    static var success: ColorPalette.Type { get }

    /// Info/Nuetral colors.
    static var info: ColorPalette.Type { get }
}

// MARK: -

/// A color palette which contains primary, secondary and supplimentory colors with their darker and lighter color sets.
/// Also contains default semantic and grayscale palette.
public protocol MainColorPalette {
    /// primary color palette.
    static var primary: ColorPalette.Type { get }

    /// secondary color palette.
    static var secondary: ColorPalette.Type { get }

    /// supplimentory color palette.
    static var supplimentory: ColorPalette.Type { get }

    /// semantic color palette.
    static var semantic: SemanticColorPalette.Type { get }

    /// grayscale color paletter.
    static var grayscale: LargerColorPalette.Type { get }
}

// MARK: - MainColorPalette

public extension MainColorPalette {
    /// Default white color.
    static var white: UIColor { return UIColor.white }

    /// Default back color.
    static var black: UIColor { return UIColor.black }

    /// Default clear color.
    static var clear: UIColor { return UIColor.clear }
}
