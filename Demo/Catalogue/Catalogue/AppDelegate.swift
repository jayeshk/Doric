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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var themeManager: DualThemeManager!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        prepareToolkit()
        prepareThemeManager()
        registerForThemeNotification()

        if let nController = self.window?.rootViewController as? UINavigationController {
            let navigationBar = nController.navigationBar
            navigationBar.applyStyle(navigationStyle: AppNavigationStyle.regular)
        }

        return true
    }

    func prepareToolkit() {
        Doric.shared.settings = Settings(spacing: Space.p1)
        Doric.shared.isHidden = true
    }

    func prepareThemeManager() {
        themeManager = DualThemeManager(mainTheme: DemoPrimaryTheme(), alternateTheme: DemoSecondaryTheme())
    }

    func registerForThemeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onThemeChanged(_:)), name: ThemeNotification.didChange, object: nil)
    }

    @objc func onThemeChanged(_ notification: Notification) {
        guard let theme = notification.theme else {
            return
        }
        DemoDesignSystem.colorPalette = theme.colorPalette
    }
}
