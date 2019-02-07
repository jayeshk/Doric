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

// MARK: - List of menu options for Demo, Keeping it as programatically to control order & show/hide items certain items for future demos.

enum MenuItem: CaseIterable {
    case colors
    case typography
    case scaleChart
    case cornerRadius
    case borders
    case layoutAndSpacing
    case iconography
    case theme
    case style
    case toolkit
}

extension MenuItem {
    var display: String {
        switch self {
        case .colors:
            return "Colors"
        case .typography:
            return "Typography"
        case .theme:
            return "Theme"
        case .scaleChart:
            return "Scale Charts"
        case .cornerRadius:
            return "Corner Radius"
        case .borders:
            return "Border & Separator"
        case .layoutAndSpacing:
            return "Layout & Spacing"
        case .iconography:
            return "Iconography"
        case .style:
            return "Style"
        case .toolkit:
            return "Toolkit (Grid, Guideline)"
        }
    }
}

extension MenuItem {
    var segueIdentifier: String {
        switch self {
        case .colors:
            return "ShowColors"
        case .borders, .scaleChart, .cornerRadius:
            return "ShowScaleChart"
        case .iconography:
            return "ShowIconography"
        case .typography:
            return "ShowTypography"
        case .layoutAndSpacing:
            return "ShowLayout"
        case .toolkit:
            return "ShowToolKit"
        case .theme:
            return "ShowTheme"
        case .style:
            return "ShowStyle"
        }
    }
}
