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

class ScaleChartPreviewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var preview: UIView!
    @IBOutlet var previewWidthConstraint: NSLayoutConstraint!
}

class ScaleChartsViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!

    var dataSource: DemoTableViewDataSource!
    var demoType: DemoScaleChart = DemoScaleChart.border

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = demoType.dataSource()
        dataSource.prepare()

        tableView.dataSource = dataSource
        title = dataSource.title

        prepareStyle()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
        AppTableViewStyle.regular.performStyle(on: tableView)
    }
}

enum DemoScaleChart {
    case scaleChart
    case border
    case cornerRadius

    func dataSource() -> DemoTableViewDataSource {
        switch self {
        case .border:
            return ScaleChartBordersDemoTableViewDataSource()
        case .cornerRadius:
            return ScaleCornerRadiusDemoTableViewDataSource()
        case .scaleChart:
            return ScaleChartGroupsDemoTableViewDataSource()
        }
    }
}

protocol DemoTableViewDataSource: UITableViewDataSource {
    var items: [NamedBorderSize] { get }
    var title: String { get }
    func prepare()
}

// MARK: - ScaleChartCornerRadiusDemoTableViewDataSource

class ScaleCornerRadiusDemoTableViewDataSource: NSObject, DemoTableViewDataSource {
    var items: [NamedBorderSize] = []
    var title: String = ""

    func prepare() {
        title = "Corner Radius"
        items = DemoDesignSystem.cornerRadius.previewItems()
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }

    // Radius
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScaleChartPreviewCell", for: indexPath) as! ScaleChartPreviewCell
        // swiftlint:enable force_cast

        cell.nameLabel.text = item.0.uppercased()
        cell.valueLabel.text = "Corner Radius \(item.1)"
        cell.preview.layer.borderWidth = DemoDesignSystem.border.medium // item.1
        cell.preview.layer.cornerRadius = item.1

        cell.nameLabel.applyStyle(labelStyle: AppLabelStyle.title)
        cell.valueLabel.applyStyle(labelStyle: AppLabelStyle.subtitle)

        cell.preview.backgroundColor = UIColor.clear

        cell.preview.layer.borderColor = DemoDesignSystem.colorPalette.primary.darken1.cgColor
        return cell
    }
}

// MARK: - SizeChartBordersDemoTableViewDataSource

class ScaleChartBordersDemoTableViewDataSource: NSObject, DemoTableViewDataSource {
    var items: [NamedBorderSize] = []
    var title: String = ""

    func prepare() {
        title = "Borders"
        items = DemoDesignSystem.border.previewItems()
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScaleChartPreviewCell", for: indexPath) as! ScaleChartPreviewCell
        // swiftlint:enable force_cast

        cell.nameLabel.text = item.0.uppercased()
        cell.valueLabel.text = "Border \(item.1)"
        cell.preview.layer.borderWidth = item.1

        cell.nameLabel.applyStyle(labelStyle: AppLabelStyle.title)
        cell.valueLabel.applyStyle(labelStyle: AppLabelStyle.subtitle)

        cell.preview.backgroundColor = UIColor.clear
        cell.preview.layer.borderColor = DemoDesignSystem.colorPalette.primary.darken1.cgColor
        return cell
    }
}

// MARK: - SizeChartGroupsDemoTableViewDataSource

class ScaleChartGroupsDemoTableViewDataSource: NSObject, DemoTableViewDataSource {
    var items: [NamedBorderSize] = []
    var title: String = ""

    func prepare() {
        title = "Scales"
        items = SizeScale.previewItems().sorted(by: { ($0.1 < $1.1) })
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScaleChartPreviewCell", for: indexPath) as! ScaleChartPreviewCell
        // swiftlint:enable force_cast

        cell.nameLabel.text = item.0.uppercased()
        cell.valueLabel.text = "Scale \(item.1)"

        cell.nameLabel.applyStyle(labelStyle: AppLabelStyle.title)
        cell.valueLabel.applyStyle(labelStyle: AppLabelStyle.subtitle)

        // For demo - We don't need preview for this cell, so reducing priority to allow label to expand
        cell.preview.backgroundColor = UIColor.clear
        cell.previewWidthConstraint.priority = .defaultLow
        return cell
    }
}
