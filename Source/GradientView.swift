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

/// Creates gradient view
open class GradientView: UIView {
    var gradientLayer: CAGradientLayer!
    
    /// Start point of gradient, by default (0.0, 0.5).
    open var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5) {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// End point of gradient, by default (0.0, 0.5).
    open var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5) {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// Start color of gradient.
    open var startColor: UIColor = .black {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// End color of gradient.
    open var endColor: UIColor = .white {
        didSet {
            setNeedsLayout()
        }
    }
    
    open override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    open override func layoutSubviews() {
        gradientLayer = layer as? CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
}

// MARK: - Extention to create gradient with colors

public extension GradientView {
    /// Convenience initializer to create an instance of `GradientView` using `GradientColor`
    ///
    /// - Parameter gradient: GradientColor defination, see `GradientColor`
    /// - SeeAlso:- `GradientColor`
    convenience init(gradient: GradientColor) {
        self.init(frame: .zero)
        startColor = gradient.startColor
        endColor = gradient.endColor
        startPoint = gradient.startPoint
        endPoint = gradient.endPoint
    }
}
