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

// Typealias
public typealias NamedBorderSize = (String, CGFloat)
public typealias NameFonts = (String, UIFont)

public extension Scale {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [NamedBorderSize] {
        return [("small", Self.small),
                ("medium", Self.medium),
                ("large", Self.large)]
    }
}

public extension FullScale {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [NamedBorderSize] {
        return [("small", Self.small),
                ("medium", Self.medium),
                ("large", Self.large),
                ("extraSmall", Self.extraSmall),
                ("extraLarge", Self.extraLarge),
                ("extraExtraLarge", Self.extraExtraLarge),
                ("extraExtraExtraLarge", Self.extraExtraExtraLarge)]
    }
}

public extension Space {
    static func previewItems() -> [Space] {
        return [.p0, .p1, .p2, .p3, .p4, .p5, .p6, .p7, .p8]
    }
}

// For debug

public extension Typography {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [NameFonts] {
        return []
    }
}

public extension SystemTypography {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [NameFonts] {
        var fonts: [NameFonts] = []
        fonts.append(("body", preferredFont(forTextStyle: .body)))
        fonts.append(("title1", preferredFont(forTextStyle: .title1)))
        fonts.append(("title2", preferredFont(forTextStyle: .title2)))
        fonts.append(("title3", preferredFont(forTextStyle: .title3)))
        fonts.append(("headline", preferredFont(forTextStyle: .headline)))
        fonts.append(("subheadline", preferredFont(forTextStyle: .subheadline)))
        fonts.append(("callout", preferredFont(forTextStyle: .callout)))
        fonts.append(("footnote", preferredFont(forTextStyle: .footnote)))
        fonts.append(("caption1", preferredFont(forTextStyle: .caption1)))
        fonts.append(("caption2", preferredFont(forTextStyle: .caption2)))
        if #available(iOS 11.0, *) {
            fonts.append(("largeTitle", preferredFont(forTextStyle: .largeTitle)))
        }
        return fonts
    }
}

public extension DynamicTypography where FontStyle == UIFont.TextStyle {
    static func namedTypography() -> [NameFonts] {
        var fonts: [NameFonts] = []
        fonts.append(("body", preferredFont(forTextStyle: .body)))
        fonts.append(("title1", preferredFont(forTextStyle: .title1)))
        fonts.append(("title2", preferredFont(forTextStyle: .title2)))
        fonts.append(("title3", preferredFont(forTextStyle: .title3)))
        fonts.append(("headline", preferredFont(forTextStyle: .headline)))
        fonts.append(("subheadline", preferredFont(forTextStyle: .subheadline)))
        fonts.append(("callout", preferredFont(forTextStyle: .callout)))
        fonts.append(("footnote", preferredFont(forTextStyle: .footnote)))
        fonts.append(("caption1", preferredFont(forTextStyle: .caption1)))
        fonts.append(("caption2", preferredFont(forTextStyle: .caption2)))
        if #available(iOS 11.0, *) {
            fonts.append(("largeTitle", preferredFont(forTextStyle: .largeTitle)))
        }
        return fonts
    }
}

// Debug only

public typealias NamedColor = (String, UIColor)

public extension LightenColorSet {
    static var namedLightColors: [NamedColor] {
        return [("lighten2", lighten2), ("lighten1", lighten1)]
    }
}

public extension DarkenColorSet {
    static var namedDarkColors: [NamedColor] {
        return [("darken1", darken1), ("darken2", darken2)]
    }
}

// lighter
public extension ExtendedLightenColorSet {
    static var namedExdenedLightColors: [NamedColor] {
        return [("lighten4", lighten4), ("lighten3", lighten3)]
    }
}

public extension ExtendedDarkenColorSet {
    static var namedExdenedDarkColors: [NamedColor] {
        return [("darken3", darken3), ("darken4", darken4)]
    }
}

public extension ColorPalette {
    static var namedColors: [NamedColor] {
        var list: [NamedColor] = []
        list.append(contentsOf: namedLightColors)
        list.append(("base", base))
        list.append(contentsOf: namedDarkColors)
        return list
    }
}

public extension LargerColorPalette {
    static var namedColors: [NamedColor] {
        var list: [NamedColor] = []
        list.append(contentsOf: namedExdenedLightColors)
        list.append(contentsOf: namedLightColors)
        list.append(("base", base))
        list.append(contentsOf: namedDarkColors)
        list.append(contentsOf: namedExdenedDarkColors)
        return list
    }
}

public extension IconSize {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [(String, IconSize)] {
        return [
            ("small", .small),
            ("medium", .medium),
            ("large", .large),
        ]
    }
}

public extension SemanticColorPalette {
    /// Debug helper methods, to preview items for this collection
    ///
    /// Only for debuging.
    /// - Returns: all items
    static func previewItems() -> [NamedColor] {
        var namedColors: [NamedColor] = []
        
        let successColors = success.namedColors.map({ (nameColor) -> NamedColor in
            ("Success - \(nameColor.0)", nameColor.1)
        })
        
        let warningColors = warning.namedColors.map({ (nameColor) -> NamedColor in
            ("Warning - \(nameColor.0)", nameColor.1)
        })
        
        let infoColors = info.namedColors.map({ (nameColor) -> NamedColor in
            ("Info - \(nameColor.0)", nameColor.1)
        })
        
        let errorColors = error.namedColors.map({ (nameColor) -> NamedColor in
            ("Error - \(nameColor.0)", nameColor.1)
        })
        
        namedColors.append(contentsOf: successColors)
        namedColors.append(contentsOf: warningColors)
        namedColors.append(contentsOf: infoColors)
        namedColors.append(contentsOf: errorColors)
        
        return namedColors
    }
}
