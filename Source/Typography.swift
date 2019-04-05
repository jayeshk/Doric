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

public extension UIFont {
    /// Fallback fonts wherever font operations failed to provide requested fonts.
    class var `default`: UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }
}

/// TypographyOptions options to configure typography
public protocol TypographyOptions {
    /// Adjust fonts as per content size category.
    static var shouldScaleFont: Bool { get }
}

public extension TypographyOptions {
    /// Default scales fonts.
    static var shouldScaleFont: Bool {
        return true
    }
}

/// Typography provides static size fonts as per `FontStyle`
public protocol Typography {
    associatedtype FontStyle
    
    /// Returns an instance of the font for the specified `FontStyle` and with font size.
    ///
    /// - Parameter style: FontStyle
    /// - Returns: Created font.
    static func font(forTextStyle style: FontStyle) -> UIFont
}

/// DynamicTypography provides dynamic types fonts along with static size fonts
public protocol DynamicTypography: Typography, TypographyOptions {
    /// Returns an instance of the font for the specified `FontStyle` and scaled appropriately for the user's selected content size category.
    ///
    /// - Parameter style: FontStyle
    /// - Returns: Created font.
    static func preferredFont(forTextStyle style: FontStyle) -> UIFont
}

/// FontDescription which can describe font, useful to create fonts represented by external model.
public struct FontDescription {
    /// Font name.
    public let name: String
    
    /// Font size.
    public let size: CGFloat
    
    public init(name: String, size: CGFloat) {
        self.name = name
        self.size = size
    }
}

/// A type with a customized font representation
public protocol FontConvertible {
    var font: UIFont? { get }
}

extension FontDescription: FontConvertible {
    public var font: UIFont? {
        return UIFont(name: name, size: size)
    }
}

/// Represnts font set.
public protocol Font {
    associatedtype TextStyle: Hashable
    
    /// List of fonts and their text style
    var fonts: [TextStyle: FontConvertible] { get }
    
    /// Creates font for text style
    func font(forTextStyle textStyle: TextStyle) -> UIFont
}

public extension Font {
    /// Creates font for text style
    func font(forTextStyle textStyle: TextStyle) -> UIFont {
        guard let font = fonts[textStyle]?.font else {
            return UIFont.default
        }
        return font
    }
}

/// SystemFont font which represents built in Font Style - `UIFont.TextStyle`.
public protocol SystemFont: Font where TextStyle == UIFont.TextStyle {}

public extension SystemFont {
    func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        return fonts[textStyle]?.font ?? UIFont.default
    }
}

/// Dynamically scalable font which supports built in textstyle - `UIFont.TextStyle`.
public protocol DynamicTypeFont: SystemFont {
    /// Dynamically scalled font for FontStyle.
    func preferredFont(forTextStyle textStyle: UIFont.TextStyle) -> UIFont
    
    /// Dynamically scalled font for FontStyle with maximumPointSize & traitCollection.
    func preferredFont(forTextStyle textStyle: UIFont.TextStyle,
                       maximumPointSize: CGFloat,
                       compatibleWith traitCollection: UITraitCollection?) -> UIFont
}

// MARK: - Creates dynamicFont

public extension DynamicTypeFont {
    /// Dynamically scalled font for FontStyle.
    func preferredFont(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        guard let font = fonts[textStyle]?.font else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    /// Dynamically scalled font for FontStyle with maximumPointSize & traitCollection.
    func preferredFont(forTextStyle textStyle: UIFont.TextStyle, maximumPointSize: CGFloat, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
        guard let font = fonts[textStyle]?.font else {
            return UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection)
        }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font, maximumPointSize: maximumPointSize, compatibleWith: traitCollection)
    }
}

/// DynamicTypeCustomTextStyleFont - Support font with custom font style.
public protocol DynamicTypeCustomTextStyleFont: Font {
    func preferredFont(forTextStyle textStyle: TextStyle) -> UIFont
    func preferredFont(forTextStyle textStyle: TextStyle,
                       maximumPointSize: CGFloat,
                       compatibleWith traitCollection: UITraitCollection?) -> UIFont
}
