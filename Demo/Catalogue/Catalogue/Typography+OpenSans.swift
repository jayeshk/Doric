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

import Doric
import UIKit

/// Open Sans Style
enum OpenSansStyle: String {
    case contentHeading
    case contentBody
    case contentInstruction
    case brand
}

/// Open sans - External fonts
class OpenSansFont: NSObject, DynamicTypeCustomTextStyleFont {
    typealias CustomFontStyle = OpenSansStyle
    let fonts: [OpenSansStyle: FontConvertible] =
        [OpenSansStyle.contentInstruction: FontDescription(name: "OpenSansLight-Italic", size: 9.0),
         OpenSansStyle.contentBody: FontDescription(name: "OpenSans", size: 17.0),
         OpenSansStyle.contentHeading: FontDescription(name: "OpenSans-Semibold", size: 17.0),
         OpenSansStyle.brand: FontDescription(name: "OpenSans", size: 15.0)]

    func preferredFont(forTextStyle textStyle: CustomFontStyle) -> UIFont {
        return preferredFont(forTextStyle: textStyle, maximumPointSize: 1000.0, compatibleWith: nil)
    }

    func preferredFont(forTextStyle textStyle: CustomFontStyle,
                       maximumPointSize _: CGFloat,
                       compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        if let desc = fonts[textStyle] as? FontDescription {
            let scaledSize = UIFontMetrics.default.scaledValue(for: desc.size, compatibleWith: traitCollection)
            return UIFont(name: desc.name, size: scaledSize) ?? UIFont.default
        }
        return UIFont.default // Fallback fonts
    }
}

// External Font 'OpenSans'
class OpenSansTypography: DynamicTypography {
    private static let internalFont: OpenSansFont = OpenSansFont()
    typealias FontStyle = OpenSansStyle
    static func font(forTextStyle style: OpenSansStyle) -> UIFont {
        return internalFont.font(forTextStyle: style)
    }

    static func preferredFont(forTextStyle style: OpenSansStyle) -> UIFont {
        return internalFont.preferredFont(forTextStyle: style)
    }
}

extension OpenSansTypography {
    static func namedTypography() -> [NameFonts] {
        var fonts: [NameFonts] = []
        fonts.append(("brand", preferredFont(forTextStyle: .brand)))
        fonts.append(("contentBody", preferredFont(forTextStyle: .contentBody)))
        fonts.append(("contentHeading", preferredFont(forTextStyle: .contentHeading)))
        fonts.append(("contentInstruction", preferredFont(forTextStyle: .contentInstruction)))
        return fonts
    }
}
