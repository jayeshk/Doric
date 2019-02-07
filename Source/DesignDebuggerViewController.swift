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

/// Settings to configure instance of `Doric`
public struct Settings {
    /// Spacing between graph rows and columns
    public let spacing: CGFloat

    /// Color for graph
    let graphColor = UIColor.black

    public init(spacing: LayoutValueRepresentable) {
        self.spacing = spacing.rawValue
    }

    /// Default settings instance
    ///
    /// - Returns: returns `Settings` instance with 8.0 point space
    static func `default`() -> Settings {
        return Settings(spacing: Space.p1)
    }

    /// Color for graphView strock
    var strockColor: CGColor {
        return graphColor.withAlphaComponent(0.6).cgColor
    }
}

/// Internal class to draw graph on top current interface.
class DesignDebuggerViewController: UIViewController {
    var closeButton: UIButton!
    var graphView: GraphView!
    var settings: Settings?

    convenience init(settings: Settings) {
        self.init(nibName: nil, bundle: nil)
        self.settings = settings
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let graphView = GraphView(frame: .zero)
        self.graphView = graphView
        view.insertSubview(graphView, at: 0)
        graphView.backgroundColor = UIColor.clear
        graphView.anchorEdges(view)
        graphView.options = settings ?? Settings.default()

        closeButton = UIButton()
        view.addSubview(closeButton)
        closeButton.anchorIcon(.medium)
        closeButton.anchorTrailing(view, constant: .equalTo(Space.p2))
        closeButton.anchorBottom(view, constant: .equalTo(Space.p2))
        closeButton.setImage(UIImage.closeImage, for: .normal)
        closeButton.addTarget(self, action: #selector(onClose), for: .touchUpInside)
    }

    @objc func onClose() {
        Doric.shared.isHidden = true
    }
}
