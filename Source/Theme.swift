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

/// Represents them with color palette. Currenly supports only color palettes.
public protocol Theme {
    /// identifier for theme.
    var identifier: String { get }

    /// colorPalette represented by theme instance.
    var colorPalette: MainColorPalette.Type { get }
}

/// ThemeManager
public protocol ThemeManager {
    /// `Theme` instance.
    var theme: Theme { get }
}

/// ThemeSwitcher hods replaceable theme
public protocol ThemeSwitcher: ThemeManager {
    /// `Theme` instance.
    var theme: Theme { get set }

    /// `ThemeListener` notifies theme evnts/
    var notifier: ThemeListener { get }
}

/// DualThemeSwitcher holds two instance for theme, helper to create dual themes i.e light/dark mode or day/night mode.
public protocol DualThemeSwitcher: ThemeSwitcher {
    /// Main `Theme` instance.
    var mainTheme: Theme { get }

    /// Alternate `Theme` instance.
    var seconadaryTheme: Theme { get }
}

// MARK: - ThemeSwitcher

extension ThemeSwitcher {
    /// Set new theme.
    ///
    /// - Parameter newTheme: newTheme `Theme` instance.
    public mutating func setTheme(_ newTheme: Theme) {
        guard theme.identifier != newTheme.identifier else {
            return
        }
        theme = newTheme
        notifier.notifyChange(theme)
    }
}

// MARK: - DualThemeSwitcher

extension DualThemeSwitcher {
    /// toggle current theme, replace current theme with alternate theme.
    public mutating func toggleTheme() {
        if theme.identifier == mainTheme.identifier {
            setTheme(seconadaryTheme)
        } else {
            setTheme(mainTheme)
        }
    }
}
