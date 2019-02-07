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

// Example 2 themes

/// DemoPrimaryTheme
struct DemoPrimaryTheme: Theme {
    let identifier: String = "theme-1"
    let colorPalette: MainColorPalette.Type = DemoColorPalette.self

    struct DemoColorPalette: MainColorPalette {
        static var semantic: SemanticColorPalette.Type = DefaultSemanticColorPalette.self
        static var grayscale: LargerColorPalette.Type = DefaultGrayScalePalette.self
        static let primary: ColorPalette.Type = DoricDemoPrimaryColor.self
        static let secondary: ColorPalette.Type = DoricDemoSecondaryColor.self
        static let supplimentory: ColorPalette.Type = DoricDemoSupplimantoryColor.self
    }
}

/// DemoSecondaryTheme
struct DemoSecondaryTheme: Theme {
    let identifier: String = "theme-2"
    let colorPalette: MainColorPalette.Type = DemoColorPalette.self

    struct DemoColorPalette: MainColorPalette {
        static let primary: ColorPalette.Type = DoricDemoSecondaryColor.self
        static let secondary: ColorPalette.Type = DoricDemoPrimaryColor.self
        static let supplimentory: ColorPalette.Type = DoricDemoSupplimantoryColor.self
        static var semantic: SemanticColorPalette.Type = DefaultSemanticColorPalette.self
        static var grayscale: LargerColorPalette.Type = DefaultGrayScalePalette.self
    }
}
