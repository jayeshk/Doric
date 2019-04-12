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

public extension UIView {
    /**
     Shows guide for an instance of view, Guideline adds single line view with constraints equivalents to edges, dimentions, baselines.
     
     Guideline is part of UI debug helper tools.
     Example usage can be as below, as it adds lines using autolayouts it is expected target view should be added to its superview.
     
     ```
     let label = UILabel()
     ...
     ...
     // Creates guidelines set to be displayed
     let guidelines: UIView.Guideline = [.leading, .firstBaseline, .bottom]
     
     // Shows guideline on label
     label.showGuide(guideline: guidelines)
     
     */
    struct Guideline: OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /// Guide for top edge.
        public static let top = Guideline(rawValue: 1 << 0)
        
        /// Guide for bottom edge.
        public static let bottom = Guideline(rawValue: 1 << 1)
        
        /// Guide for leading edge.
        public static let leading = Guideline(rawValue: 1 << 2)
        
        /// Guide for trailing edge.
        public static let trailing = Guideline(rawValue: 1 << 3)
        
        /// Guide for firstBaseline.
        public static let firstBaseline = Guideline(rawValue: 1 << 4)
        
        /// Guide for lastBaseline.
        public static let lastBaseline = Guideline(rawValue: 1 << 5)
        
        /// Guide for height dimention.
        public static let height = Guideline(rawValue: 1 << 6)
        
        /// Guide for width dimention.
        public static let width = Guideline(rawValue: 1 << 7)
        
        /// Guide for top, bottom, leading edges.
        public static let basic: Guideline = [.top, .bottom, .leading]
        
        /// Guide for all edges, dimentions, baselines.
        public static let all: Guideline = [.top, .bottom, .leading, .trailing, .firstBaseline, .lastBaseline, .height, .width]
    }
    
    /// One pixel, represents height for guide.
    private struct Pixel: LayoutValueRepresentable {
        public let rawValue: CGFloat = Space.pixel
    }
    
    // swiftlint:disable function_body_length
    
    /// Show guide  for view with guideline options
    ///
    /// - Parameters:
    ///   - guideline: Guidelines to be displayed. By default options ```[.top, .bottom, .leading]```
    ///   - color: Color for guideline
    
    func showGuide(guideline: Guideline = Guideline.basic, color: UIColor = UIColor.black) {
        func createGuideView() -> UIView {
            let guide = UIView(frame: CGRect.zero)
            guide.backgroundColor = color
            return guide
        }
        
        let multiplier: CGFloat = 1.2
        let guideSize = LayoutRelation.equalTo(Pixel())
        
        if guideline.contains(.height) {
            let heightGuide = createGuideView()
            addSubview(heightGuide)
            heightGuide.anchorCenter(self)
            heightGuide.anchorWidth(guideSize)
            heightGuide.anchorHeight(self, multiplier: multiplier)
        }
        
        if guideline.contains(.width) {
            let widthGuide = createGuideView()
            addSubview(widthGuide)
            widthGuide.anchorCenter(self)
            widthGuide.anchorHeight(guideSize)
            widthGuide.anchorWidth(self, multiplier: multiplier)
        }
        
        if guideline.contains(.leading) {
            let leftGuide = createGuideView()
            addSubview(leftGuide)
            leftGuide.anchorLeading(self)
            leftGuide.anchorCenterY(self)
            leftGuide.anchorWidth(guideSize)
            leftGuide.anchorHeight(self, multiplier: multiplier)
        }
        
        if guideline.contains(.trailing) {
            let rightGuide = createGuideView()
            addSubview(rightGuide)
            rightGuide.anchorTrailing(self)
            rightGuide.anchorCenterY(self)
            rightGuide.anchorWidth(guideSize)
            rightGuide.anchorHeight(self, multiplier: multiplier)
        }
        
        if guideline.contains(.top) {
            let topGuide = createGuideView()
            addSubview(topGuide)
            topGuide.anchorTop(self)
            topGuide.anchorCenterX(self)
            topGuide.anchorHeight(guideSize)
            topGuide.anchorWidth(self, multiplier: multiplier)
        }
        
        if guideline.contains(.bottom) {
            let bottomGuide = createGuideView()
            addSubview(bottomGuide)
            bottomGuide.anchorBottom(self)
            bottomGuide.anchorCenterX(self)
            bottomGuide.anchorHeight(guideSize)
            bottomGuide.anchorWidth(self, multiplier: multiplier)
        }
        
        if guideline.contains(.firstBaseline) {
            let firstBaselineGuide = createGuideView()
            addSubview(firstBaselineGuide)
            firstBaselineGuide.anchorFirstBaseline(self)
            firstBaselineGuide.anchorCenterX(self)
            firstBaselineGuide.anchorHeight(guideSize)
            firstBaselineGuide.anchorWidth(self, multiplier: multiplier)
        }
        
        if guideline.contains(.lastBaseline) {
            let lastBaselineGuide = createGuideView()
            addSubview(lastBaselineGuide)
            lastBaselineGuide.anchorLastBaseline(self)
            lastBaselineGuide.anchorCenterX(self)
            lastBaselineGuide.anchorHeight(guideSize)
            lastBaselineGuide.anchorWidth(self, multiplier: multiplier)
        }
    }
    
    // swiftlint:enable function_body_length
}
