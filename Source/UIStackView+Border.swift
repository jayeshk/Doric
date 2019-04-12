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

public extension UIStackView {
    /// Extension of `UIStackView` to create border.
    ///
    /// It just adds one view with border, This method is part of UI debug helper tools.
    /// - Parameters:
    ///   - color: Color for border, by default 'black' color.
    ///   - width: width of border, by default 1.0.
    func enableBorder(_ color: UIColor = UIColor.black, width: CGFloat = 1.0) {
        let borderView = UIView(frame: CGRect.zero)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.layer.borderColor = color.cgColor
        borderView.layer.borderWidth = width
        addSubview(borderView)
        borderView.anchorEdges(self)
    }
}

public extension UIView {
    /// Add recursive border to view and all its subviews
    ///
    /// This method is part of UI debug helper tools.
    /// - Parameters:
    ///   - view: target view in which borders will be enabled.
    ///   - color: Color for border, by default 'black' color.
    ///   - width: width of border, by default 1.0.
    static func recursiveEnableBorder(_ view: UIView, color: UIColor = UIColor.black, width: CGFloat = 1.0) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        
        if let stackView = view as? UIStackView {
            stackView.enableBorder(color, width: width)
            stackView.arrangedSubviews.forEach { arrangedView in
                UIView.recursiveEnableBorder(arrangedView, color: color, width: width)
            }
        } else {
            view.subviews.forEach { subview in
                UIView.recursiveEnableBorder(subview)
            }
        }
    }
}
