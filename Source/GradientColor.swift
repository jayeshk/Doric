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

/**

 `GradientColor` protocol provides gradient defination with start & end colors and start & end points. Helper to create gradient using `CAGradientLayer`.

 ```
 // Left-to-Right gradient color can be defined as below
 struct CardGradientColor: GradientColor {
 let startColor = UIColor("#1e3c72")
 let endColor =  UIColor("#2a5298")
 }

 // Single color with darker/light shade gradient color can be defined as below.
 //`endColor` will be darker or ligher of `startColor`
 struct ShadedGradientColor: GradientColor {
 let startColor = UIColor("#1e3c72")
 }
 ```

 `UIColor` also implements `GradientColor` protocol, so instance of UIColor can be used directly wherever `GradientColor` used.

 - SeeAlso:- `GradientView`
 - SeeAlso:- `public convenience init(gradient: GradientColor)

 */

public protocol GradientColor {
    /// Start color of gradient
    var startColor: UIColor { get }

    /// End color of gradient, by default 0.5 ligher or darker of `startColor`
    var endColor: UIColor { get }

    /// Start point for gradient
    var startPoint: CGPoint { get }

    /// End point for gradient
    var endPoint: CGPoint { get }
}

/// Default implementions for `GradientColor`
public extension GradientColor {
    /// Provides list of `CGColor` to create gradient using `CAGradientLayer`
    var colors: [CGColor] {
        return [startColor.cgColor, endColor.cgColor]
    }

    /// Default start point for gradient is (0.0, 0.5)
    var startPoint: CGPoint {
        return CGPoint(x: 0.0, y: 0.5)
    }

    /// Default end point for gradient is (1.0, 0.5)
    var endPoint: CGPoint {
        return CGPoint(x: 1.0, y: 0.5)
    }

    /// End color of gradient, by default 0.5 ligher or darker of `startColor`
    var endColor: UIColor {
        if startColor.whiteComponent > 0.5 {
            return startColor.darker(by: 0.50)
        } else {
            return startColor.lighter(by: 0.50)
        }
    }
}

// MARK: - UIColor implements GradientColor

extension UIColor: GradientColor {
    /// Implements `GradientColor` protocol, by default current color is startColor for gradient defination
    public var startColor: UIColor {
        return self
    }
}
