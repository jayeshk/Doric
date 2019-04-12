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

// MARK: -

/// Type which can reprent value, Mostly used with autolayouts, but not limited to it. Contains some utility methods to create margins, insets etc.
public protocol LayoutValueRepresentable {
    /// Raw value
    var rawValue: CGFloat { get }
}

public extension LayoutValueRepresentable {
    /// One pixel value based on device scale
    static var pixel: CGFloat {
        return 1.0 / UIScreen.main.scale
    }
}

public extension LayoutValueRepresentable {
    /// multiply value with rawValue.
    func by(_ multiplier: CGFloat) -> CGFloat {
        return rawValue * multiplier
    }
    
    /// edgeInsets with values.
    func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: rawValue, left: rawValue, bottom: rawValue, right: rawValue)
    }
    
    /// create horizontal rect with rawValue.
    func hRect(_ value: Self) -> UIEdgeInsets {
        return UIEdgeInsets(top: rawValue, left: value.rawValue, bottom: rawValue, right: value.rawValue)
    }
    
    /// create vertical rect with rawValue.
    func vRect(_ value: Self) -> UIEdgeInsets {
        return UIEdgeInsets(top: value.rawValue, left: rawValue, bottom: value.rawValue, right: rawValue)
    }
}

// swiftlint:disable all

/// Space - represents default set of space sizes.
///
/// - p0: Space value 0.0
/// - p1: Space value 8.0
/// - p2: Space value 16.0
/// - p3: Space value 24.0
/// - p4: Space value 32.0
/// - p5: Space value 40.0
/// - p6: Space value 48.0
/// - p7: Space value 56.0
/// - p8: Space value 64.0
public enum Space: CGFloat, LayoutValueRepresentable {
    /// p0
    case p0 = 0.0
    
    /// p1
    case p1 = 8.0
    
    /// p2
    case p2 = 16.0
    
    /// p3
    case p3 = 24.0
    
    /// p4
    case p4 = 32.0
    
    /// p5
    case p5 = 40.0
    
    /// p6
    case p6 = 48.0
    
    /// p7
    case p7 = 56.0
    
    /// p8
    case p8 = 64.0
}

// swiftlint:enable all
