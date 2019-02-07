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

/// Avenir Font Enum
enum AvenirNext: String {
    case nextMedium = "AvenirNext-Medium"
    case demiBold = "AvenirNext-DemiBold"
    case regular = "AvenirNext-Regular"
    case italic = "AvenirNext-Italic"
}

public class AvenirNextFont: DynamicTypeFont {
    public let dynamicSupportEnabled: Bool = true
    public let fonts: [UIFont.TextStyle: FontConvertible] =
        [UIFont.TextStyle.caption2: FontDescription(name: AvenirNext.regular.rawValue, size: 9.0),
         UIFont.TextStyle.caption1: FontDescription(name: AvenirNext.regular.rawValue, size: 12.0),
         UIFont.TextStyle.footnote: FontDescription(name: AvenirNext.italic.rawValue, size: 13.0),
         UIFont.TextStyle.subheadline: FontDescription(name: AvenirNext.regular.rawValue, size: 15.0),
         UIFont.TextStyle.callout: FontDescription(name: AvenirNext.regular.rawValue, size: 16.0),
         UIFont.TextStyle.body: FontDescription(name: AvenirNext.regular.rawValue, size: 17.0),
         UIFont.TextStyle.headline: FontDescription(name: AvenirNext.demiBold.rawValue, size: 17.0),
         UIFont.TextStyle.title3: FontDescription(name: AvenirNext.nextMedium.rawValue, size: 20.0),
         UIFont.TextStyle.title2: FontDescription(name: AvenirNext.nextMedium.rawValue, size: 22.0),
         UIFont.TextStyle.title1: FontDescription(name: AvenirNext.nextMedium.rawValue, size: 28.0),
         UIFont.TextStyle.largeTitle: FontDescription(name: AvenirNext.regular.rawValue, size: 34.0)]
}

class DoricDemoTypography: DynamicTypography {
    private static let internalFont: AvenirNextFont = AvenirNextFont()

    typealias FontStyle = UIFont.TextStyle
    static func font(forTextStyle style: UIFont.TextStyle) -> UIFont {
        return internalFont.font(forTextStyle: style)
    }

    static func preferredFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        return internalFont.preferredFont(forTextStyle: style)
    }
}
