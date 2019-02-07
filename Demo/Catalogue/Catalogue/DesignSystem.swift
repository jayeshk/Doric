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

// MARK: - Colors

// Example Color System Implemented by client

public struct DoricDemoPrimaryColor: ColorPalette {
    public static let base = UIColor.System.purple
}

public struct DoricDemoSecondaryColor: ColorPalette {
    public static let base = UIColor.System.pink
}

public struct DoricDemoSupplimantoryColor: ColorPalette {
    public static let base = UIColor("#013e62")
}

struct DemoColorPalette: MainColorPalette {
    static let primary: ColorPalette.Type = DoricDemoPrimaryColor.self
    static let secondary: ColorPalette.Type = DoricDemoSecondaryColor.self
    static let supplimentory: ColorPalette.Type = DoricDemoSupplimantoryColor.self
    static var semantic: SemanticColorPalette.Type = DefaultSemanticColorPalette.self
    static let grayscale: LargerColorPalette.Type = DefaultGrayScalePalette.self
}

// MARK: - Design System

class DemoDesignSystem {
    private init() {}

    static var colorPalette: MainColorPalette.Type = DemoColorPalette.self
    static let border: Scale.Type = Border.self
    static let cornerRadius: CornerRadiusSize = CornerRadius.self
    static let transparency: TransparencyLevel.Type = Transparency.self
    // static let typography: SystemTypography.Type = SystemTypography.self
    // static let typography: OpenSansTypography.Type = OpenSansTypography.self
    static let typography: DoricDemoTypography.Type = DoricDemoTypography.self
}

// MARK: - Size Charts

struct DoricDemoBorderSize: Scale {
    static var small: CGFloat = 0.5
    static var medium: CGFloat = 1.0
    static var large: CGFloat = 2.0
}
