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

/// DualThemeManager
open class DualThemeManager: NSObject, DualThemeSwitcher {
    /// Main theme.
    public let mainTheme: Theme
    
    /// Secondary theme.
    public let seconadaryTheme: Theme
    
    /// Theme event notifier.
    public let notifier: ThemeListener
    
    /// Current theme.
    open var theme: Theme
    
    public init(mainTheme: Theme, alternateTheme: Theme) {
        self.mainTheme = mainTheme
        seconadaryTheme = alternateTheme
        theme = mainTheme
        notifier = ThemeNotificationCenterNotifier()
    }
}

/// DefaultGrayScalePalette
public struct DefaultGrayScalePalette: LargerColorPalette {
    public static let lighten1 = UIColor("#999999")
    public static let lighten2 = UIColor("#b2b2b2")
    public static let lighten3 = UIColor("#cccccc")
    public static let lighten4 = UIColor("#e5e5e5")
    public static let base = UIColor("#7f7f7f")
    public static let darken1 = UIColor("#666666")
    public static let darken2 = UIColor("#4c4c4c")
    public static let darken3 = UIColor("#323232")
    public static let darken4 = UIColor("#191919")
}

// MARK: - System colors

public extension UIColor {
    /// System colors
    struct System {
        /// system red
        public static let red = UIColor("#FF3B30")
        
        /// system orange
        public static let orange = UIColor("#FF9500")
        
        /// system yellow
        public static let yellow = UIColor("#FFCC00")
        
        /// system green
        public static let green = UIColor("#4CD964")
        
        /// system teal
        public static let teal = UIColor("#5AC8FA")
        
        /// system blue
        public static let blue = UIColor("#007AFF")
        
        /// system purple
        public static let purple = UIColor("#5856D6")
        
        /// system pink
        public static let pink = UIColor("#FF2D55")
        
        /// system white
        public static let whiteColor = UIColor("#FFFFFF")
        
        /// system extra light gray
        public static let extraLightGrayColor = UIColor("#EFEFF4")
        
        /// system light gray
        public static let lightGrayColor = UIColor("#E5E5EA")
        
        /// system light mid gray
        public static let lightMidGrayColor = UIColor("#D1D1D6")
        
        /// system mid gray
        public static let midGrayColor = UIColor("#C7C7CC")
        
        /// system gray
        public static let grayColor = UIColor("#8E8E93")
        
        /// system black
        public static let blackColor = UIColor("#000000")
    }
}

/// DefaultSemanticColorPalette
public struct DefaultSemanticColorPalette: SemanticColorPalette {
    public static let error: ColorPalette.Type = ErrorColor.self
    public static let warning: ColorPalette.Type = WarningColor.self
    public static let success: ColorPalette.Type = SuccessColor.self
    public static let info: ColorPalette.Type = InformationColor.self
    
    private struct ErrorColor: ColorPalette {
        static let base: UIColor = UIColor("#BB0000")
    }
    
    private struct WarningColor: ColorPalette {
        static let base: UIColor = UIColor("#E78C07")
    }
    
    private struct SuccessColor: ColorPalette {
        static let base: UIColor = UIColor("#2B7D2B")
    }
    
    private struct InformationColor: ColorPalette {
        static let base: UIColor = UIColor("#5E696E")
    }
}

/// SystemTypography - System font set
public struct SystemTypography: DynamicTypography {
    public typealias FontStyle = UIFont.TextStyle
    
    private static let fonts: [UIFont.TextStyle: UIFont] =
        [UIFont.TextStyle.caption2: UIFont.systemFont(ofSize: 9.0),
         UIFont.TextStyle.caption1: UIFont.systemFont(ofSize: 12.0),
         UIFont.TextStyle.footnote: UIFont.systemFont(ofSize: 13.0),
         UIFont.TextStyle.subheadline: UIFont.systemFont(ofSize: 15.0),
         UIFont.TextStyle.callout: UIFont.systemFont(ofSize: 16.0),
         UIFont.TextStyle.body: UIFont.systemFont(ofSize: 17.0),
         UIFont.TextStyle.headline: UIFont.boldSystemFont(ofSize: 15.0),
         UIFont.TextStyle.title3: UIFont.systemFont(ofSize: 20.0),
         UIFont.TextStyle.title2: UIFont.systemFont(ofSize: 22.0),
         UIFont.TextStyle.title1: UIFont.systemFont(ofSize: 28.0),
         UIFont.TextStyle.largeTitle: UIFont.systemFont(ofSize: 34.0)]
    
    public static func font(forTextStyle style: UIFont.TextStyle) -> UIFont {
        return fonts[style] ?? UIFont.default
    }
    
    public static func preferredFont(forTextStyle style: FontStyle) -> UIFont {
        return UIFont.preferredFont(forTextStyle: style)
    }
}
