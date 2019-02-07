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
import Foundation
import UIKit

class ThemeDemoViewController: BaseViewController {
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var primaryColorPreview: UIView!
    @IBOutlet var secondaryColorPreview: UIView!
    @IBOutlet var primaryButton: UIButton!
    @IBOutlet var storyboardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Theme Demo"

        prepareStyle()
    }

    override func updateUIOnThemeChange(_: Theme) {
        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)

        // Alternate way to apply brand eaither using extention or enum's method
        AppLabelStyle.body.performStyle(on: bodyLabel)
        AppLabelStyle.header.performStyle(on: headerLabel)
        AppButtonStyle.bordered.performStyle(on: primaryButton)
        AppNavigationStyle.regular.performStyle(on: navigationController!.navigationBar)
        AppButtonStyle.primary.performStyle(on: storyboardButton)

        primaryColorPreview.backgroundColor = DemoDesignSystem.colorPalette.primary.base
        secondaryColorPreview.backgroundColor = DemoDesignSystem.colorPalette.secondary.base
    }

    @IBAction func toggleTheme(_: UIButton) {
        guard var themeManager = (UIApplication.shared.delegate as? AppDelegate)?.themeManager else {
            return
        }
        themeManager.toggleTheme()
    }
}
