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

extension UIColor {
    /// Get white component of current color
    var whiteComponent: CGFloat {
        var white: CGFloat = 0.0
        getWhite(&white, alpha: nil)
        return white
    }
}

public extension UIColor {
    /// Creates color from hexadecimal string
    ///
    /// Example input string cab be with # prefix i.e. #FF00FF or FF00FF
    /// - Parameters:
    ///   - hexString: Valid hexadecimal string
    ///   - alpha: Alpha value of color, default is 1.0
    
    convenience init(_ hexString: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hexString)
        scanner.scanLocation = hexString.hasPrefix("#") ? 1 : 0
        var intRGB: UInt64 = 0
        scanner.scanHexInt64(&intRGB)
        let red = (intRGB & 0xFF0000) >> 16
        let green = (intRGB & 0xFF00) >> 8
        let blue = intRGB & 0xFF
        self.init(red: CGFloat(red) / 0xFF, green: CGFloat(green) / 0xFF, blue: CGFloat(blue) / 0xFF, alpha: alpha)
    }
    
    ///  hexadecimal (a hex triplet) representation of current color.
    var hexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return String(format: "#%02X%02X%02X", Int(red * 0xFF), Int(red * 0xFF), Int(green * 0xFF))
    }
}

/// Color adjustment create shades and tints
extension UIColor {
    /// Creates darker color by factor, adjusts brightness or saturation of color by factor
    ///
    /// Darker of black will be always black
    /// - Parameter factor: `factor` value should between 0.0 - 1.0
    /// - Returns: newly created color after adjustment
    func darker(by factor: CGFloat) -> UIColor {
        return adjustBrightnessOrSaturation(by: -factor)
    }
    
    /// Creates ligher color by factor, Adjusts brightness or saturation of color by factor
    ///
    /// Lighter of white will be always white
    /// - Parameter factor: `factor` value should between 0.0 - 1.0
    /// - Returns: newly created color after adjustment
    func lighter(by factor: CGFloat) -> UIColor {
        return adjustBrightnessOrSaturation(by: factor)
    }
    
    /// Adjusts brightness or saturation of color by factor
    ///
    /// - Parameter factor: factor should between 0.0 - 1.0
    /// - Returns: newly created color after adjustment
    fileprivate func adjustBrightnessOrSaturation(by factor: CGFloat) -> UIColor {
        var currentHue: CGFloat = 0,
        currentSaturation: CGFloat = 0,
        currentBrigthness: CGFloat = 0,
        currentAlpha: CGFloat = 0
        
        // Default return current color
        guard getHue(&currentHue,
                     saturation: &currentSaturation,
                     brightness: &currentBrigthness,
                     alpha: &currentAlpha) else {
                        return self
        }
        
        // Adjust color by increasing brightness or reducing saturation and derived values are between 0.0 - 1.0
        if currentBrigthness < 1.0 {
            return UIColor(hue: currentHue,
                           saturation: currentSaturation,
                           brightness: max(min(currentBrigthness + factor * currentBrigthness, 1.0), 0.0),
                           alpha: currentAlpha)
        } else {
            return UIColor(hue: currentHue,
                           saturation: min(max(currentSaturation - factor * currentSaturation, 0.0), 1.0),
                           brightness: currentBrigthness,
                           alpha: currentAlpha)
        }
    }
}
