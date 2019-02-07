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

private extension UIScreen {
    /// One pixel as per scale.
    var pixel: CGFloat {
        return 1.0 / scale
    }
}

/// View to draw graph
class GraphView: UIView {
    var options = Settings.default() {
        didSet {
            setNeedsDisplay()
        }
    }

    private let lineWidth = UIScreen.main.pixel

    override func draw(_: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        let spacing: CGFloat = options.spacing
        let columns: CGFloat = bounds.width / spacing
        let rows: CGFloat = bounds.height / spacing

        context.setLineWidth(lineWidth)
        context.setStrokeColor(options.strockColor)
        context.setShouldAntialias(false)

        for var colIndex in 0 ..< Int(columns) + 1 {
            let startPoint = CGPoint(x: spacing * CGFloat(colIndex), y: 0.0)
            let endPoint = CGPoint(x: startPoint.x, y: frame.size.height)
            context.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
            context.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
            context.strokePath()
            colIndex += 1
        }

        for var rowIndex in 0 ..< Int(rows) + 1 {
            let startPoint = CGPoint(x: 0.0, y: spacing * CGFloat(rowIndex))
            let endPoint = CGPoint(x: frame.size.width, y: startPoint.y)
            context.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
            context.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
            context.strokePath()
            rowIndex += 1
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
}
