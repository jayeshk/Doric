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

/// Helpers for demo

extension Date {
    static var displayDateString: String {
        return DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .short)
    }
}

// Example How to create custom space

enum CustomSpace: CGFloat, LayoutValueRepresentable {
    case space1 = 4.0
    case space2 = 8.0
    case space3 = 12.0
    case space4 = 16.0

    static func previewItems() -> [CustomSpace] {
        return [CustomSpace.space1, CustomSpace.space2, CustomSpace.space3, CustomSpace.space4]
    }
}

// Example how to create style in storyboard

@IBDesignable public class CustomStyledButton: UIButton {
    @IBInspectable var doricStyle: String? {
        get {
            return nil
        } set(newValue) {
            if let value = newValue, let storyboardStyle = StoryboardButtonStyle(rawValue: value) {
                storyboardStyle.performStyle(on: self)
            }
        }
    }
}

/// StoryboardButtonStyle
///
/// - actionButton: style for action button
enum StoryboardButtonStyle: String {
    case actionButton
}

// MARK: - StoryboardButtonStyle

extension StoryboardButtonStyle: ButtonStyle {
    public func performStyle(on button: UIButton) {
        switch self {
        case .actionButton:
            let textColor = DemoDesignSystem.colorPalette.grayscale.lighten2
            button.backgroundColor = DemoDesignSystem.colorPalette.primary.base
            button.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = DemoDesignSystem.typography.font(forTextStyle: .body)
        }
    }
}

extension UITableView {
    func addEmptyFooter() {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    }
}
