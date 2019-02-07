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

class IconographyViewController: BaseViewController {
    let demoImageName = "template-icon"

    var colorStackView: UIStackView!
    var sizeStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Iconography"

        createColorStack()
        createSizeStackView()

        prepareStyle()
    }

    override func updateUIOnThemeChange(_: Theme) {
        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
    }

    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }

    func createColorStack() {
        let primaryColor = DemoDesignSystem.colorPalette.primary.base
        let secondaryColor = DemoDesignSystem.colorPalette.secondary.base
        let supplimentory = DemoDesignSystem.colorPalette.supplimentory.base

        let image1 = UIImage.template(named: demoImageName, tintColor: primaryColor)
        let image2 = UIImage.template(named: demoImageName, tintColor: secondaryColor)
        let image3 = UIImage.template(named: demoImageName, tintColor: supplimentory)
        let image4 = UIImage.template(named: demoImageName)

        let stack1 = createStackView("Primary Color", image: image1)
        let stack2 = createStackView("Secondary Color", image: image2)
        let stack3 = createStackView("Supplimentory Color", image: image3)
        let stack4 = createStackView("Default Color", image: image4)

        colorStackView = UIStackView(arrangedSubviews: [stack1, stack2, stack3, stack4])
        colorStackView.axis = .vertical
        colorStackView.spacing = Space.p1.rawValue
        view.addSubview(colorStackView)

        colorStackView.anchorLeft(view, constant: .equalTo(Space.p2))
        colorStackView.anchorTop(view, constant: .equalTo(Space.p2))
    }

    func createSizeStackView() {
        let headingLabel = UILabel()
        headingLabel.text = "*Icon sizes"

        headingLabel.applyStyle(labelStyle: AppLabelStyle.header)

        view.addSubview(headingLabel)

        sizeStackView = UIStackView(arrangedSubviews: [])
        sizeStackView.axis = .vertical
        sizeStackView.spacing = Space.p1.rawValue

        view.addSubview(sizeStackView)

        headingLabel.anchorWidth(sizeStackView)
        headingLabel.anchorLeading(sizeStackView)
        headingLabel.anchorTop(colorStackView.bottomAnchor, constant: .equalTo(Space.p2))

        sizeStackView.anchorLeft(view, constant: .equalTo(Space.p2))
        sizeStackView.anchorTop(headingLabel.bottomAnchor, constant: .equalTo(Space.p2))

        sizeStackView.alignment = .fill
        sizeStackView.distribution = .fill

        let primaryColor = DemoDesignSystem.colorPalette.primary.base

        for size in IconSize.previewItems() {
            let image = UIImage.template(named: demoImageName, tintColor: primaryColor)
            let stack = createStackView(size.0.capitalized, image: image, iconSize: size.1)
            sizeStackView.addArrangedSubview(stack)
        }
    }

    func createStackView(_ text: String, image: UIImage?, iconSize: IconSize = IconSize.medium) -> UIStackView {
        let imageView = UIImageView(image: image)
        let label = UILabel()
        label.applyStyle(labelStyle: AppLabelStyle.subtitle)
        label.text = "\(text) Icon"
        let iconColorStackView = UIStackView(arrangedSubviews: [label, imageView])
        imageView.anchorIcon(iconSize)
        iconColorStackView.axis = .horizontal
        iconColorStackView.spacing = Space.p1.rawValue
        iconColorStackView.distribution = .fill
        iconColorStackView.alignment = .center
        view.addSubview(iconColorStackView)
        return iconColorStackView
    }
}
