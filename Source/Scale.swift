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

/// Scale represents small set of scale sizes.
public protocol Scale {
    /// small.
    static var small: CGFloat { get }

    /// medium.
    static var medium: CGFloat { get }

    /// large.
    static var large: CGFloat { get }
}

/// FullScale represents small set of scale sizes.
public protocol FullScale: Scale {
    /// extraSmall.
    static var extraSmall: CGFloat { get }

    /// extraLarge.
    static var extraLarge: CGFloat { get }

    /// extraExtraLarge.
    static var extraExtraLarge: CGFloat { get }

    /// extraExtraExtraLarge.
    static var extraExtraExtraLarge: CGFloat { get }
}

/// ValueLevel represents set of level for a value.
public protocol ValueLevel {
    /// high
    static var high: CGFloat { get }

    /// medium
    static var medium: CGFloat { get }

    /// low
    static var low: CGFloat { get }
}

/// TwoStateValueLevel represents two state for a value.
public protocol TwoStateValueLevel {
    /// full
    static var full: CGFloat { get }

    /// none
    static var none: CGFloat { get }
}

/// Default Scale values.
public extension Scale {
    static var small: CGFloat { return 12.0 }
    static var medium: CGFloat { return 14.0 }
    static var large: CGFloat { return 18.0 }
}

/// Default FullScale values.
public extension FullScale {
    static var extraSmall: CGFloat { return 8.0 }
    static var extraLarge: CGFloat { return 36.0 }
    static var extraExtraLarge: CGFloat { return 48.0 }
    static var extraExtraExtraLarge: CGFloat { return 60.0 }
}

/// Default Fullscale availble with default values.
public struct SizeScale: FullScale {}

/// TransparencyLevel represents level of transparency.
public protocol TransparencyLevel: ValueLevel, TwoStateValueLevel {}

public struct Transparency: TransparencyLevel {
    /// high value, default 0.25
    public static let high: CGFloat = 0.25

    /// medium value, default 0.50
    public static let medium: CGFloat = 0.50

    /// low value, default 0.75
    public static let low: CGFloat = 0.75

    /// full value, default 0.0
    public static let full: CGFloat = 0.0

    /// none value, default 1.0
    public static let none: CGFloat = 1.0
}

/// CornerRadius represents corder radius scales.
public struct CornerRadius: Scale {
    /// small, default 2.0.
    public static let small: CGFloat = 2.0

    /// medium, default 4.0.
    public static let medium: CGFloat = 4.0

    /// large, default 8.0.
    public static let large: CGFloat = 8.0
}

/// Border represents border scales.
public struct Border: FullScale {
    /// small, default 0.5.
    public static let extraSmall: CGFloat = 0.5

    /// small, default 1.0.
    public static let small: CGFloat = 1.0

    /// small, default 2.0.
    public static let medium: CGFloat = 2.0

    /// small, default 3.0.
    public static let large: CGFloat = 3.0

    /// small, default 4.0.
    public static let extraLarge: CGFloat = 4.0

    /// small, default 6.0.
    public static let extraExtraLarge: CGFloat = 6.0

    /// small, default 8.0.
    public static let extraExtraExtraLarge: CGFloat = 8.0
}

/// IconSize
///
/// - small: small size icon
/// - medium: medium size icon
/// - large: large size icon
public enum IconSize: CGFloat, LayoutValueRepresentable {
    /// Small icon size, default 24.0
    case small = 24.0

    /// Medium icon size, default 36.0
    case medium = 36.0

    /// Large icon size, default 48.0
    case large = 48.0
}

public extension IconSize {
    /// As CGSize representation
    var cgSize: CGSize {
        return CGSize(width: rawValue, height: rawValue)
    }
}

/// ButtonHeight
///
/// - small: small size
/// - medium: medium size
/// - large: large size
public enum ButtonHeight: CGFloat, LayoutValueRepresentable {
    /// Small button size
    case small = 24.0

    /// Medium button size
    case medium = 40.0

    /// Large button size
    case large = 48.0
}

/// Shadow
///
/// - tiny: tiny shadow
/// - small: small shadow
/// - medium: medium shadow
/// - large: large shadow
public enum Shadow {
    /// Tiny
    case tiny

    /// Small
    case small

    /// Medium
    case medium

    /// Large
    case large
}

/// Type alias for VoiceToneLevel
public typealias VoiceToneLevel = ValueLevel

/// Type alias for BorderSize
public typealias BorderSize = Scale.Type

/// Type alias for VoiceToneLevel
public typealias CornerRadiusSize = Scale.Type
