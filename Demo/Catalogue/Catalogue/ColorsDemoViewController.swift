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

class ColorPreviewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var preview: UIView!
}

class ColorsDemoViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!

    var colors: [NamedColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Primary Colors"

        colors = DemoDesignSystem.colorPalette.primary.namedColors

        let optionsBarItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = optionsBarItem

        prepareStyle()
    }

    override func updateUIOnThemeChange(_: Theme) {
        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
        AppTableViewStyle.regular.performStyle(on: tableView)
        AppBarButtonItemStyle.regular.performStyle(on: navigationItem.rightBarButtonItem!)
    }

    @objc func showOptions() {
        let alert = UIAlertController(title: "Show colors", message: nil, preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "Primary Color", style: .default) { _ in
            self.title = "Primary Colors"
            self.colors = DemoDesignSystem.colorPalette.primary.namedColors
            self.tableView.reloadData()
        }

        let action2 = UIAlertAction(title: "Secondary Color", style: .default) { _ in
            self.title = "Secondary Colors"
            self.colors = DemoDesignSystem.colorPalette.secondary.namedColors
            self.tableView.reloadData()
        }

        let action3 = UIAlertAction(title: "Supplimentory Color", style: .default) { _ in
            self.title = "Supplimentory Colors"
            self.colors = DemoDesignSystem.colorPalette.supplimentory.namedColors
            self.tableView.reloadData()
        }

        let action4 = UIAlertAction(title: "Grayscale Color", style: .default) { _ in
            self.title = "Grayscale Colors"
            self.colors = DemoDesignSystem.colorPalette.grayscale.namedColors
            self.tableView.reloadData()
        }

        let action5 = UIAlertAction(title: "Semantic Color", style: .default) { _ in
            self.title = "Semantic Colors"
            self.colors = DemoDesignSystem.colorPalette.semantic.previewItems()
            self.tableView.reloadData()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
        alert.addAction(action5)

        alert.addAction(cancel)

        presentOptions(alert, barButtonItem: navigationItem.rightBarButtonItem)
    }
}

extension ColorsDemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorPreviewCell", for: indexPath) as! ColorPreviewCell
        // swiftlint:enable force_cast

        cell.nameLabel.text = color.0
        cell.valueLabel.text = color.1.hexString.uppercased()
        cell.preview.backgroundColor = color.1
        cell.nameLabel.applyStyle(labelStyle: AppLabelStyle.title)
        cell.valueLabel.applyStyle(labelStyle: AppLabelStyle.subtitle)
        return cell
    }
}
