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

public extension UIImageView {
    /// set image with tint color.
    func tintedImageWith(color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}

public extension UIImage {
    /// Create template image.
    ///
    /// - Parameters:
    ///   - named: name of image.
    ///   - bundle: bundle which contains image.
    /// - Returns: a template image.
    static func template(named: String, bundle: Bundle = Bundle.main) -> UIImage? {
        return UIImage(named: named, in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
    }
    
    /// Create template image with color.
    ///
    /// - Parameters:
    ///   - named: name of image.
    ///   - bundle: bundle which contains image.
    ///   - tintColor: tintColor
    /// - Returns: a template image.
    static func template(named: String, bundle: Bundle = Bundle.main, tintColor: UIColor) -> UIImage? {
        return template(named: named, bundle: bundle)?.tint(with: tintColor)
    }
    
    private func tint(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        draw(in: CGRect(origin: .zero, size: size))
        guard let tintedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return tintedImage
    }
}

extension UIImage {
    static var closeImage: UIImage? {
        guard let bundle = Bundle.moduleBundle else {
            return nil
        }
        return UIImage.template(named: "internal-icon-close", bundle: bundle)?.tint(with: UIColor.black)
    }
}
