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

class ToolKitViewController: BaseViewController {
    var containerView: UIView?
    var textLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Toolkit"

        let optionsBarItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = optionsBarItem

        // By Default show basic guide for debuging
        showBasicGuide()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
    }

    override func updateUIOnThemeChange(_: Theme) {
        prepareStyle()
        showBasicGuide()
    }

    func showGraphOrHide() {
        Doric.shared.isHidden = !Doric.shared.isHidden
    }

    func showAllGuide() {
        Doric.shared.isHidden = true
        prepareContainerView()
        let guidelines: UIView.Guideline = .all
        textLabel?.showGuide(guideline: guidelines, color: DemoDesignSystem.colorPalette.white)
    }

    func showBasicGuide() {
        Doric.shared.isHidden = true
        prepareContainerView()
        let guidelines: UIView.Guideline = [.leading, .firstBaseline, .bottom]
        textLabel?.showGuide(guideline: guidelines, color: DemoDesignSystem.colorPalette.white)
    }

    @objc func showOptions() {
        let alert = UIAlertController(title: "Select Options", message: nil, preferredStyle: .actionSheet)
        let action1Title = Doric.shared.isHidden ? "Show graph" : "Hide graph"
        let action1 = UIAlertAction(title: action1Title, style: .default) { _ in
            self.showGraphOrHide()
        }

        let action2 = UIAlertAction(title: "Show all guides", style: .default) { _ in
            self.showAllGuide()
        }

        let action3 = UIAlertAction(title: "Show basic guides", style: .default) { _ in
            self.showBasicGuide()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(cancel)
        presentOptions(alert, barButtonItem: navigationItem.rightBarButtonItem)
    }

    func prepareContainerView() {
        if containerView != nil {
            containerView?.removeFromSuperview()
        }

        containerView = UIView()
        view.addSubview(containerView!)

        containerView!.backgroundColor = DemoDesignSystem.colorPalette.black

        containerView?.anchorTop(view, constant: .equalTo(Space.p2))
        containerView?.anchorLeading(view, constant: .equalTo(Space.p2))
        containerView?.anchorTrailing(view, constant: .equalTo(Space.p2))
        containerView?.anchorHeight(.equalTo(CardSize.logo))

        let textLabel = UILabel()

        textLabel.text = "Text"
        textLabel.textColor = DemoDesignSystem.colorPalette.white

        // Exception - we need largest font size to display text which covers screen.
        textLabel.font = UIFont.systemFont(ofSize: 90.0)
        textLabel.sizeToFit()
        containerView?.addSubview(textLabel)
        textLabel.anchorCenter(containerView)
        self.textLabel = textLabel
    }
}
