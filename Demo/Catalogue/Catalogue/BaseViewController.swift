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

class BaseViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return UIStatusBarStyle.lightContent }

    func embedInScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.bounces = true
        scrollView.anchorEdges(view)
        scrollView.backgroundColor = UIColor.clear
        return scrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForThemeNotification()
        prepareForStyle()
    }

    func prepareForStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
    }

    func presentOptions(_ alert: UIAlertController, barButtonItem: UIBarButtonItem? = nil) {
        alert.view.tintColor = DemoDesignSystem.colorPalette.black
        if traitCollection.userInterfaceIdiom == .pad {
            alert.popoverPresentationController?.barButtonItem = barButtonItem
        }
        present(alert, animated: true, completion: nil)
    }

    func registerForThemeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onThemeChanged(_:)), name: ThemeNotification.didChange, object: nil)
    }
    @objc func onThemeChanged(_ notification: Notification) {
        guard let theme = notification.theme else {
            return
        }
        updateUIOnThemeChange(theme)
    }

    func updateUIOnThemeChange(_: Theme) {
        prepareForStyle()
    }
}
