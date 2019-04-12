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

/// Example of styles created by composing fonts, colors, soon to be part of framework itself.

public protocol ButtonStyle: Style where TargetControl == UIButton {}

public protocol LabelStyle: Style where TargetControl == UILabel {}

public protocol ViewStyle: Style where TargetControl == UIView {}

public protocol TableViewStyle: Style where TargetControl == UITableView {}

public protocol SwitchStyle: Style where TargetControl == UISwitch {}

public protocol SliderStyle: Style where TargetControl == UISlider {}

public protocol PageControlStyle: Style where TargetControl == UIPageControl {}

public protocol ProgressViewStyle: Style where TargetControl == UIProgressView {}

public protocol ActivityIndicatorViewStyle: Style where TargetControl == UIActivityIndicatorView {}

public protocol SegmentedControlStyle: Style where TargetControl == UISegmentedControl {}

public protocol NavigationStyle: Style where TargetControl == UINavigationBar {}

public protocol BarButtonItemStyle: Style where TargetControl == UIBarButtonItem {}

public protocol TextFieldStyle: Style where TargetControl == UITextField {}

public protocol TextViewStyle: Style where TargetControl == UITextView {}

public protocol TableViewCellStyle: Style where TargetControl == UITableViewCell {}

// MARK: - Helper extension

public extension UITableViewCell {
    func applyStyle<T: TableViewCellStyle>(tableViewCellStyle: T) {
        tableViewCellStyle.performStyle(on: self)
    }
}

public extension UIButton {
    convenience init<T: ButtonStyle>(_ style: T) {
        self.init(frame: .zero)
        style.performStyle(on: self)
    }
}

public extension UILabel {
    convenience init<T: LabelStyle>(_ style: T) {
        self.init(frame: .zero)
        style.performStyle(on: self)
    }
}

public extension UIView {
    convenience init<T: ViewStyle>(style: T) {
        self.init(frame: .zero)
        style.performStyle(on: self)
    }
}

public extension UIView {
    func applyStyle<T: ViewStyle>(viewStyle: T) {
        viewStyle.performStyle(on: self)
    }
}

public extension UIButton {
    func applyStyle<T: ButtonStyle>(buttonStyle: T) {
        buttonStyle.performStyle(on: self)
    }
}

public extension UILabel {
    func applyStyle<T: LabelStyle>(labelStyle: T) {
        labelStyle.performStyle(on: self)
    }
}

public extension UISwitch {
    func applyStyle<T: SwitchStyle>(switchStyle: T) {
        switchStyle.performStyle(on: self)
    }
}

public extension UISlider {
    func applyStyle<T: SliderStyle>(sliderStyle: T) {
        sliderStyle.performStyle(on: self)
    }
}

public extension UISegmentedControl {
    func applyStyle<T: SegmentedControlStyle>(segmentControlStyle: T) {
        segmentControlStyle.performStyle(on: self)
    }
}

public extension UIBarButtonItem {
    func applyStyle<T: BarButtonItemStyle>(barButtonItemStyle: T) {
        barButtonItemStyle.performStyle(on: self)
    }
}

public extension UINavigationBar {
    func applyStyle<T: NavigationStyle>(navigationStyle: T) {
        navigationStyle.performStyle(on: self)
    }
}

public extension UIPageControl {
    func applyStyle<T: PageControlStyle>(pageControlStyle: T) {
        pageControlStyle.performStyle(on: self)
    }
}

public extension UIProgressView {
    func applyStyle<T: ProgressViewStyle>(progressViewStyle: T) {
        progressViewStyle.performStyle(on: self)
    }
}

public extension UITextField {
    func applyStyle<T: TextFieldStyle>(textfieldStyle: T) {
        textfieldStyle.performStyle(on: self)
    }
}

// MARK: - App Styles

public enum AppViewStyle {
    case main
}

extension AppViewStyle: ViewStyle {
    public func performStyle(on view: UIView) {
        switch self {
        case .main:
            view.backgroundColor = DemoDesignSystem.colorPalette.grayscale.lighten4
        }
    }
}

public enum AppActivityIndicatorViewStyle {
    case main
}

extension AppActivityIndicatorViewStyle: ActivityIndicatorViewStyle {
    public func performStyle(on activityIndicator: UIActivityIndicatorView) {
        switch self {
        case .main:
            activityIndicator.color = DemoDesignSystem.colorPalette.primary.base
        }
    }
}

/// Label Styles
public enum AppLabelStyle {
    case body
    case header
    case footnotes
    case title
    case subtitle
    case captions
}

extension AppLabelStyle: LabelStyle {
    public func performStyle(on label: UILabel) {
        let textColor = DemoDesignSystem.colorPalette.grayscale.darken4
        
        switch self {
        case .captions:
            label.font = DemoDesignSystem.typography.font(forTextStyle: .caption1)
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textColor = textColor
        case .body:
            label.font = DemoDesignSystem.typography.font(forTextStyle: .body)
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textColor = textColor
        case .header:
            label.font = DemoDesignSystem.typography.font(forTextStyle: .headline)
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 2
            label.textColor = textColor
        case .footnotes:
            label.font = DemoDesignSystem.typography.font(forTextStyle: .footnote)
            label.textColor = DemoDesignSystem.colorPalette.grayscale.darken2
            label.lineBreakMode = .byWordWrapping
            label.textColor = textColor
        case .title:
            label.textColor = textColor
            label.font = DemoDesignSystem.typography.font(forTextStyle: .body)
        case .subtitle:
            label.font = DemoDesignSystem.typography.font(forTextStyle: .subheadline)
            label.textColor = textColor
        }
    }
}

// MARK: - Switch Style

public enum AppSwitchStyle {
    case regular
}

extension AppSwitchStyle: SwitchStyle {
    public func performStyle(on uiSwitch: UISwitch) {
        switch self {
        case .regular:
            uiSwitch.onTintColor = DemoDesignSystem.colorPalette.primary.base
            uiSwitch.tintColor = DemoDesignSystem.colorPalette.primary.base
        }
    }
}

// MARK: - Switch Style

public enum AppSliderStyle {
    case regular
}

extension AppSliderStyle: SliderStyle {
    public func performStyle(on slider: UISlider) {
        switch self {
        case .regular:
            slider.minimumTrackTintColor = DemoDesignSystem.colorPalette.primary.base
            slider.thumbTintColor = DemoDesignSystem.colorPalette.primary.base
        }
    }
}

// MARK: - Switch Style

public enum AppSegmentedControlStyle {
    case regular
}

// By extension generated for style
extension AppSegmentedControlStyle: SegmentedControlStyle {
    public func performStyle(on segment: UISegmentedControl) {
        switch self {
        case .regular:
            segment.tintColor = DemoDesignSystem.colorPalette.primary.base
        }
    }
}

// MARK: - Switch Style

public enum AppPageControlStyle {
    case regular
}

extension AppPageControlStyle: PageControlStyle {
    public func performStyle(on pageControl: UIPageControl) {
        switch self {
        case .regular:
            pageControl.currentPage = 3
            pageControl.currentPageIndicatorTintColor = DemoDesignSystem.colorPalette.primary.base
            pageControl.pageIndicatorTintColor = DemoDesignSystem.colorPalette.secondary.lighten2
        }
    }
}

// MARK: - Switch Style

public enum AppProgressViewStyle {
    case regular
}

extension AppProgressViewStyle: ProgressViewStyle {
    public func performStyle(on progressView: UIProgressView) {
        switch self {
        case .regular:
            progressView.progressTintColor = DemoDesignSystem.colorPalette.primary.base
        }
    }
}

// MARK: - Button Style

public enum AppButtonStyle {
    case primary
    case secondary
    case bordered
    case withState(Bool)
}

extension AppButtonStyle: ButtonStyle {
    public func performStyle(on button: UIButton) {
        switch self {
        case .primary:
            let textColor = DemoDesignSystem.colorPalette.white
            button.backgroundColor = DemoDesignSystem.colorPalette.primary.base
            button.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = DemoDesignSystem.typography.font(forTextStyle: .body)
        case .secondary:
            let textColor = DemoDesignSystem.colorPalette.white
            button.backgroundColor = DemoDesignSystem.colorPalette.secondary.base
            button.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = DemoDesignSystem.typography.font(forTextStyle: .body)
        case .bordered:
            let textColor = DemoDesignSystem.colorPalette.primary.base
            button.backgroundColor = UIColor.clear
            button.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium
            button.layer.borderWidth = DemoDesignSystem.border.medium
            button.layer.borderColor = textColor.cgColor
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = DemoDesignSystem.typography.font(forTextStyle: .body)
        case let .withState(active):
            let textColor = active ? DemoDesignSystem.colorPalette.grayscale.lighten2 : DemoDesignSystem.colorPalette.grayscale.lighten1
            button.backgroundColor = active ? DemoDesignSystem.colorPalette.primary.base : DemoDesignSystem.colorPalette.primary.base
            button.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = DemoDesignSystem.typography.font(forTextStyle: .body)
            button.alpha = active ? DemoDesignSystem.transparency.none : DemoDesignSystem.transparency.low
        }
    }
}

// MARK: - TableView Style

public enum AppTableViewStyle {
    case regular
}

extension AppTableViewStyle: TableViewStyle {
    public func performStyle(on tableView: UITableView) {
        switch self {
        case .regular:
            tableView.separatorStyle = .singleLine
            tableView.indicatorStyle = .white
            tableView.addEmptyFooter()
        }
    }
}

public enum AppNavigationStyle {
    case regular
}

extension AppNavigationStyle: NavigationStyle {
    public func performStyle(on navigationBar: UINavigationBar) {
        switch self {
        case .regular:
            let navFont = DemoDesignSystem.typography.font(forTextStyle: .headline)
            navigationBar.barTintColor = DemoDesignSystem.colorPalette.primary.base
            navigationBar.tintColor = DemoDesignSystem.colorPalette.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: DemoDesignSystem.colorPalette.white,
                                                 NSAttributedString.Key.font: navFont]
            navigationBar.isTranslucent = false
            navigationBar.barStyle = .black
        }
    }
}

public enum AppBarButtonItemStyle {
    case regular
}

extension AppBarButtonItemStyle: BarButtonItemStyle {
    public func performStyle(on barItem: UIBarButtonItem) {
        let barItemFont = DemoDesignSystem.typography.font(forTextStyle: .body)
        
        switch self {
        case .regular:
            barItem.setTitleTextAttributes([
                NSAttributedString.Key.font: barItemFont,
                NSAttributedString.Key.foregroundColor: UIColor.white
                ], for: .normal)
            
            barItem.setTitleTextAttributes([
                NSAttributedString.Key.font: barItemFont,
                NSAttributedString.Key.foregroundColor: UIColor.white
                ], for: .highlighted)
            barItem.tintColor = UIColor.white
        }
    }
}

public enum AppTableViewCellStyle {
    case regular
}

extension AppTableViewCellStyle: TableViewCellStyle {
    public func performStyle(on cell: UITableViewCell) {
        switch self {
        case .regular:
            cell.backgroundColor = UIColor.white
        }
    }
}

public enum AppTextFieldStyle {
    case regular
    case withState(Bool)
}

extension AppTextFieldStyle: TextFieldStyle {
    public func performStyle(on textfield: UITextField) {
        let font = DemoDesignSystem.typography.font(forTextStyle: .body)
        switch self {
        case .regular:
            textfield.textColor = DemoDesignSystem.colorPalette.grayscale.darken4
            textfield.font = font
        case let .withState(enable):
            textfield.textColor = enable ? DemoDesignSystem.colorPalette.grayscale.darken4 : DemoDesignSystem.colorPalette.grayscale.darken1
            textfield.font = font
            textfield.isUserInteractionEnabled = enable
        }
    }
}

// Example Available heights for cards, example sets of Various view heights - can be used with autolayout

enum CardSize: CGFloat, LayoutValueRepresentable {
    case compact = 80.0
    case contentBanner = 160.0
    case regular = 240.0
    case logo = 180.0
}
