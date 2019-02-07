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

class DemoMenuViewController: BaseViewController {
    let menuItems = MenuItem.allCases

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareStyle()
    }

    override func updateUIOnThemeChange(_: Theme) {
        prepareStyle()
        tableView.reloadData()
    }

    func prepareStyle() {
        view.applyStyle(viewStyle: AppViewStyle.main)
        AppTableViewStyle.regular.performStyle(on: tableView)
        navigationController!.navigationBar.applyStyle(navigationStyle: AppNavigationStyle.regular)
    }
}

extension DemoMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].display
        cell.textLabel?.applyStyle(labelStyle: AppLabelStyle.title)

        AppTableViewCellStyle.regular.performStyle(on: cell)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath, let viewController = segue.destination as? ScaleChartsViewController {
            let menuItem = menuItems[indexPath.row]

            if menuItem == .borders {
                viewController.demoType = .border
            } else if menuItem == .cornerRadius {
                viewController.demoType = .cornerRadius
            } else if menuItem == .scaleChart {
                viewController.demoType = .scaleChart
            }
        }
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        performSegue(withIdentifier: menuItem.segueIdentifier, sender: indexPath)
    }
}
