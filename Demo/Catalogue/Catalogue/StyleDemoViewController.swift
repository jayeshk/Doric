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

class StyleDemoViewController: BaseViewController {
    var containerScrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Style"

        let optionsBarItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = optionsBarItem

        prepareForStyle()
        prepareControls()
    }

    @objc func showOptions() {
        let alert = UIAlertController(title: "Select Options", message: nil, preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "Controls", style: .default) { _ in
            self.prepareControls()
        }

        let action2 = UIAlertAction(title: "Create Views", style: .default) { _ in
            self.prepareArticleView()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        presentOptions(alert, barButtonItem: navigationItem.rightBarButtonItem)
    }
}

extension StyleDemoViewController {
    // Styled controls
    // swiftlint:disable function_body_length
    func prepareControls() {
        if containerScrollView != nil {
            containerScrollView?.removeFromSuperview()
        }

        let margin = Space.p4

        let scrollView = embedInScrollView()
        containerScrollView = scrollView

        let containerView = UIView()
        containerView.backgroundColor = UIColor.clear // UIColor(red: 0.918, green: 0.910, blue: 0.831, alpha: 1.0)
        containerView.layer.cornerRadius = DemoDesignSystem.cornerRadius.medium

        scrollView.addSubview(containerView)
        containerView.anchorEdges(scrollView)
        containerView.anchorWidth(view)

        let controlsStackView = UIStackView()
        controlsStackView.spacing = Space.p2.rawValue
        controlsStackView.axis = .vertical

        let bodyLabel = UILabel()
        bodyLabel.text = "Body label"
        bodyLabel.applyStyle(labelStyle: AppLabelStyle.body)

        controlsStackView.addArrangedSubview(bodyLabel)

        let headerLabel = UILabel()
        headerLabel.text = "Header label"
        headerLabel.applyStyle(labelStyle: AppLabelStyle.header)
        controlsStackView.addArrangedSubview(headerLabel)

        let footnotesLabel = UILabel()
        footnotesLabel.text = "Footnotes label"
        footnotesLabel.applyStyle(labelStyle: AppLabelStyle.footnotes)
        controlsStackView.addArrangedSubview(footnotesLabel)

        let uiSwitch = UISwitch()
        uiSwitch.applyStyle(switchStyle: AppSwitchStyle.regular)
        uiSwitch.isOn = true

        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        AppActivityIndicatorViewStyle.main.performStyle(on: activityIndicator)

        controlsStackView.addArrangedSubview(UIStackView(arrangedSubviews: [uiSwitch, activityIndicator]))

        let segment = UISegmentedControl(items: ["First", "Second"])
        segment.applyStyle(segmentControlStyle: AppSegmentedControlStyle.regular)
        segment.selectedSegmentIndex = 0
        controlsStackView.addArrangedSubview(segment)

        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.applyStyle(pageControlStyle: AppPageControlStyle.regular)
        controlsStackView.addArrangedSubview(pageControl)

        let slider = UISlider()
        slider.applyStyle(sliderStyle: AppSliderStyle.regular)
        slider.value = 0.5
        controlsStackView.addArrangedSubview(slider)

        let progress = UIProgressView()
        progress.applyStyle(progressViewStyle: AppProgressViewStyle.regular)
        progress.progress = 0.5
        controlsStackView.addArrangedSubview(progress)

        let activeButton = UIButton()
        activeButton.applyStyle(buttonStyle: AppButtonStyle.withState(true))
        activeButton.setTitle("Active Button", for: .normal)
        controlsStackView.addArrangedSubview(activeButton)
        activeButton.anchorButtonHeight(.medium)

        let inActiveButton = UIButton()
        inActiveButton.applyStyle(buttonStyle: AppButtonStyle.withState(false))
        inActiveButton.setTitle("Inactive Button", for: .normal)
        controlsStackView.addArrangedSubview(inActiveButton)
        inActiveButton.anchorButtonHeight(.medium)

        let button1 = UIButton()
        button1.applyStyle(buttonStyle: AppButtonStyle.primary)
        button1.setTitle("Primary Button", for: .normal)
        controlsStackView.addArrangedSubview(button1)
        button1.anchorButtonHeight(.medium)

        let button2 = UIButton()
        button2.applyStyle(buttonStyle: AppButtonStyle.secondary)
        button2.setTitle("Secondary Button", for: .normal)
        controlsStackView.addArrangedSubview(button2)
        button2.anchorButtonHeight(.medium)

        let button3 = UIButton()
        button3.applyStyle(buttonStyle: AppButtonStyle.bordered)
        button3.setTitle("Bordered Button", for: .normal)
        controlsStackView.addArrangedSubview(button3)
        button3.anchorButtonHeight(.medium)

        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.applyStyle(textfieldStyle: AppTextFieldStyle.regular)
        textField.text = "Regular Text Field"
        controlsStackView.addArrangedSubview(textField)
        textField.anchorHeight(.equalTo(Space.p4))

        let textFieldWithState = UITextField()
        textFieldWithState.borderStyle = .bezel
        textFieldWithState.applyStyle(textfieldStyle: AppTextFieldStyle.withState(false))
        textFieldWithState.text = "Disabled Text Field"
        controlsStackView.addArrangedSubview(textFieldWithState)
        textFieldWithState.anchorHeight(.equalTo(Space.p4))

        containerView.addSubview(controlsStackView)
        controlsStackView.anchorEdges(containerView, constant: .equalTo(margin))
    }

    func prepareArticleView() {
        if containerScrollView != nil {
            containerScrollView?.removeFromSuperview()
        }

        let scrollView = embedInScrollView()
        containerScrollView = scrollView

        let articleTitleLabel = UILabel()
        articleTitleLabel.text = "iPhone Xs and iPhone Xs Max bring the best and biggest displays to iPhone"

        let articleMetaLabel = UILabel()
        articleMetaLabel.text = "Last updated \(Date.displayDateString) | John Smith | Technology"

        let articleBodyLabel = UILabel()
        articleBodyLabel.text = "As the year comes to a close there are so many unanswered questions: Who is Kiki, and does she love me? Should I start a podcast? Where is Donut County? Why didn’t Offred escape Gilead (again!)? Today, Apple reveals the Best of 2018, a global collection of top charts and selects from our editors across every category highlighting all of the amazing things to watch, read, listen to and play across apps, music, podcasts, books, TV and movies. It’s an invariable list of the who’s who and what’s what from the past year that is certain to help answer at least some of the most burning questions and make for fun conversation around any holiday dinner table."

        let containerView = UIView()
        containerView.addSubview(articleTitleLabel)
        containerView.addSubview(articleMetaLabel)
        containerView.addSubview(articleBodyLabel)
        scrollView.addSubview(containerView)
        containerView.backgroundColor = UIColor.clear

        scrollView.indicatorStyle = .white

        // Style starts
        articleTitleLabel.applyStyle(labelStyle: AppLabelStyle.header)
        articleMetaLabel.applyStyle(labelStyle: AppLabelStyle.captions)
        articleBodyLabel.applyStyle(labelStyle: AppLabelStyle.body)

        // Style finish
        let margin = Space.p1

        articleTitleLabel.anchorTop(containerView, constant: .equalTo(margin))
        articleTitleLabel.anchorLeading(containerView, constant: .equalTo(margin))
        articleTitleLabel.anchorTrailing(containerView, constant: .equalTo(margin))

        articleMetaLabel.anchorTop(articleTitleLabel.bottomAnchor, constant: .equalTo(margin))
        articleMetaLabel.anchorLeading(containerView, constant: .equalTo(margin))
        articleMetaLabel.anchorTrailing(containerView, constant: .equalTo(margin))

        containerView.anchorEdges(scrollView)
        containerView.anchorWidth(view)

        let articleHeader = UIImageView(image: UIImage(named: "grand-canyon"))
        containerView.addSubview(articleHeader)
        articleHeader.contentMode = .scaleAspectFill
        articleHeader.clipsToBounds = true

        articleHeader.anchorLeading(containerView, constant: .equalTo(margin))
        articleHeader.anchorTrailing(containerView, constant: .equalTo(margin))
        articleHeader.anchorTop(articleMetaLabel.bottomAnchor, constant: .equalTo(margin))

        articleBodyLabel.anchorTop(articleHeader.bottomAnchor, constant: .equalTo(margin))
        articleBodyLabel.anchorLeading(containerView, constant: .equalTo(margin))
        articleBodyLabel.anchorTrailing(containerView, constant: .equalTo(margin))
        articleBodyLabel.anchorBottom(containerView, constant: .greaterThanOrEqualTo(margin))

        articleHeader.anchorHeight(.equalTo(CardSize.regular))
    }

    // swiftlint:enable function_body_length
}
