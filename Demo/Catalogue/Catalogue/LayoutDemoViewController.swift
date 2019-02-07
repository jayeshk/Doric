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

class LayoutDemoViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Layouts & Spacing"
        prepareViews()
        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
    }

    func prepareViews() {
        let cardView = UIView()
        view.addSubview(cardView)

        cardView.backgroundColor = UIColor.white

        cardView.anchorTop(view, constant: .equalTo(Space.p2))
        cardView.anchorLeading(view, constant: .equalTo(Space.p2))
        cardView.anchorTrailing(view, constant: .equalTo(Space.p2))

        let spaces: [Space] = Space.previewItems()

        // view to keep last labels reference for top constraint
        var lastViewReference: UIView?

        for space in spaces {
            let textLabel = UILabel()
            view.addSubview(textLabel)
            textLabel.text = "Leading space \(space.rawValue)"
            if lastViewReference == nil {
                textLabel.anchorTop(cardView, constant: .equalTo(Space.p1))
            } else {
                textLabel.anchorTop(lastViewReference!.bottomAnchor, constant: .equalTo(Space.p1))
            }

            textLabel.anchorTrailing(cardView, constant: .equalTo(Space.p1))
            textLabel.anchorLeading(cardView, constant: .equalTo(space))
            textLabel.applyStyle(labelStyle: AppLabelStyle.title)
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping

            lastViewReference = textLabel

            textLabel.showGuide(guideline: .leading, color: UIColor.red)
        }

        lastViewReference?.anchorBottom(cardView, constant: .equalTo(Space.p1))

        let button = UIButton()
        button.setTitle("Show Borders", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(showBorders), for: .touchUpInside)
        button.anchorWidth(cardView)
        button.anchorCenterX(cardView)
        button.anchorTop(cardView.bottomAnchor, constant: .equalTo(Space.p2))
        button.applyStyle(buttonStyle: AppButtonStyle.bordered)
        button.anchorButtonHeight(.medium)
    }

    @objc func showBorders() {
        UIView.recursiveEnableBorder(view)
    }
}
