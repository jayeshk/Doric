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

class TypographyPreviewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
}

class TypographyDemoViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!

    var fonts: [NameFonts] = DemoDesignSystem.typography.namedTypography().sorted { (font1, font2) -> Bool in
        return font1.1.pointSize < font2.1.pointSize
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Typography"

        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
        AppTableViewStyle.regular.performStyle(on: tableView)
    }
}

extension TypographyDemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return fonts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let font = fonts[indexPath.row]
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypographyPreviewCell", for: indexPath) as! TypographyPreviewCell
        // swiftlint:enable force_cast

        cell.nameLabel.text = font.0 + " - [\(font.1.pointSize) pointSize]"
        cell.nameLabel.applyStyle(labelStyle: AppLabelStyle.title)
        cell.valueLabel.text = "\(font.1.familyName) \(font.1.fontName)"
        cell.valueLabel.font = font.1
        cell.valueLabel.textColor = DemoDesignSystem.colorPalette.grayscale.darken2
        return cell
    }
}
