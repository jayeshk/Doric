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

import Foundation
import UIKit

/// LayoutRelation represents autolayout constraint relationship with other attribute.
///
/// - equalTo: first attribute to be exactly equal to the modified second attribute.
/// - greaterThanOrEqualTo: first attribute to be greater than or equal to the modified second attribute.
/// - lessThanOrEqualTo: first attribute to be less than or equal to the modified second attribute.
public enum LayoutRelation {
    /// Equal relation
    case equalTo(LayoutValueRepresentable)
    
    /// GreaterThanOrEqualTo relation
    case greaterThanOrEqualTo(LayoutValueRepresentable)
    
    /// LessThanOrEqualTo relation
    case lessThanOrEqualTo(LayoutValueRepresentable)
}

// MARK: - LayoutRelation

public extension LayoutRelation {
    /// Default relation `equalTo` with 0.0 value.
    static let `default` = LayoutRelation.equalTo(Space.p0)
}

// MARK: -

public extension UIView {
    @discardableResult
    fileprivate func createAchorX(to anchor: NSLayoutXAxisAnchor?, otherAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        guard let anchor = anchor, let otherAnchor = otherAnchor else { return nil }
        
        prepareForAutolayout()
        let constraint: NSLayoutConstraint
        switch constant {
        case let .equalTo(span):
            constraint = anchor.constraint(equalTo: otherAnchor, constant: span.rawValue)
        case let .lessThanOrEqualTo(span):
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: span.rawValue)
        case let .greaterThanOrEqualTo(span):
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: span.rawValue)
        }
        constraint.isActive = activated
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult
    fileprivate func createAchorY(to anchor: NSLayoutYAxisAnchor?, otherAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        guard let anchor = anchor, let otherAnchor = otherAnchor else { return nil }
        
        prepareForAutolayout()
        let constraint: NSLayoutConstraint
        
        switch constant {
        case let .equalTo(span):
            constraint = anchor.constraint(equalTo: otherAnchor, constant: span.rawValue)
        case let .lessThanOrEqualTo(span):
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: span.rawValue)
        case let .greaterThanOrEqualTo(span):
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: span.rawValue)
        }
        constraint.isActive = activated
        constraint.priority = priority
        return constraint
    }
}

public extension UIView {
    // MARK: - Left
    
    /// Creates contraint to left anchor.
    @discardableResult
    func anchorLeft(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: leftAnchor, otherAnchor: viewOrAnchor?.leftAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to left anchor.
    @discardableResult
    func anchorLeft(_ viewOrAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: leftAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Right
    
    /// Creates contraint to right anchor.
    @discardableResult
    func anchorRight(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: rightAnchor, otherAnchor: viewOrAnchor?.rightAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to right anchor.
    @discardableResult
    func anchorRight(_ viewOrAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: rightAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Leading
    
    /// Creates contraint to leading anchor.
    @discardableResult
    func anchorLeading(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: leadingAnchor, otherAnchor: viewOrAnchor?.leadingAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to leading anchor.
    @discardableResult
    func anchorLeading(_ viewOrAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: leadingAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Trailing
    
    /// Creates contraint to trailing anchor.
    @discardableResult
    func anchorTrailing(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: viewOrAnchor?.trailingAnchor, otherAnchor: trailingAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to trailing anchor.
    @discardableResult
    func anchorTrailing(_ viewOrAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: viewOrAnchor, otherAnchor: trailingAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Top
    
    /// Creates contraint to top anchor.
    @discardableResult
    func anchorTop(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: topAnchor, otherAnchor: viewOrAnchor?.topAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to top anchor.
    @discardableResult
    func anchorTop(_ viewOrAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: topAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Bottom
    
    /// Creates contraint to bottom anchor.
    @discardableResult
    func anchorBottom(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor?.bottomAnchor, otherAnchor: bottomAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to bottom anchor.
    @discardableResult
    func anchorBottom(_ viewOrAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor, otherAnchor: bottomAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - FirstBaseline
    
    /// Creates contraint to first baseline anchor.
    @discardableResult
    func anchorFirstBaseline(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor?.firstBaselineAnchor, otherAnchor: firstBaselineAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to first baseline anchor.
    @discardableResult
    func anchorFirstBaseline(_ viewOrAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor, otherAnchor: firstBaselineAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - LastBaseline
    
    /// Creates contraint to last baseline anchor.
    @discardableResult
    func anchorLastBaseline(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor?.lastBaselineAnchor, otherAnchor: lastBaselineAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to last baseline anchor.
    @discardableResult
    func anchorLastBaseline(_ viewOrAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: viewOrAnchor, otherAnchor: lastBaselineAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Center Y
    
    /// Creates contraint to center Y anchor.
    @discardableResult
    func anchorCenterY(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: centerYAnchor, otherAnchor: viewOrAnchor?.centerYAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to center Y anchor.
    @discardableResult
    func anchorCenterY(_ viewOrAnchor: NSLayoutYAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorY(to: centerYAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Center X
    
    /// Creates contraint to center X anchor.
    @discardableResult
    func anchorCenterX(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: centerXAnchor, otherAnchor: viewOrAnchor?.centerXAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    /// Creates contraint to center X anchor.
    @discardableResult
    func anchorCenterX(_ viewOrAnchor: NSLayoutXAxisAnchor?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createAchorX(to: centerXAnchor, otherAnchor: viewOrAnchor, constant: constant, activated: activated, priority: priority)
    }
    
    // MARK: - Center
    
    /// Creates contraint to center anchor.
    @discardableResult
    func anchorCenter(_ viewOrAnchor: UIView?) -> [NSLayoutConstraint]? {
        guard let centerX = anchorCenterX(viewOrAnchor), let centerY = anchorCenterY(viewOrAnchor) else {
            return nil
        }
        return [centerX, centerY]
    }
    
    // MARK: - Edges
    
    /// Creates contraint to leading, trailing, top, bottom edges anchor.
    @discardableResult
    func anchorEdges(_ viewOrAnchor: UIView?, constant: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint]? {
        guard let leading = anchorLeading(viewOrAnchor, constant: constant, activated: activated, priority: priority),
            let trailing = anchorTrailing(viewOrAnchor, constant: constant, activated: activated, priority: priority),
            let top = anchorTop(viewOrAnchor, constant: constant, activated: activated, priority: priority),
            let bottom = anchorBottom(viewOrAnchor, constant: constant, activated: activated, priority: priority) else {
                return nil
        }
        
        return [leading, trailing, top, bottom]
    }
}

// MARK: - Dimenstions

public extension UIView {
    // MARK: - Height
    
    /// Creates contraint to height anchor.
    @discardableResult
    func anchorHeight(_ relation: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createDimentionAnchorEqualTo(heightAnchor, relatedBy: relation, activated: activated, priority: priority)
    }
    
    /// Creates contraint to height anchor.
    @discardableResult
    func anchorHeight(_ viewOrAnchor: UIView?, multiplier: CGFloat = 1.0, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createDimentionAnchorWithOther(heightAnchor, otherDimension: viewOrAnchor?.heightAnchor, multiplier: multiplier, activated: activated, priority: priority)
    }
    
    /// Creates contraint to height anchor.
    @discardableResult
    func anchorHeight(_ viewOrAnchor: NSLayoutDimension?, multiplier: CGFloat = 1.0, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createDimentionAnchorWithOther(heightAnchor, otherDimension: viewOrAnchor, multiplier: multiplier, activated: activated, priority: priority)
    }
    
    // MARK: - Width
    
    /// Creates contraint to width anchor.
    @discardableResult
    func anchorWidth(_ relation: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint {
        return createDimentionAnchorEqualTo(widthAnchor, relatedBy: relation, activated: activated, priority: priority)
    }
    
    /// Creates contraint to width anchor.
    @discardableResult
    func anchorWidth(_ viewOrAnchor: UIView?, multiplier: CGFloat = 1.0, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createDimentionAnchorWithOther(widthAnchor, otherDimension: viewOrAnchor?.widthAnchor, multiplier: multiplier, activated: activated, priority: priority)
    }
    
    /// Creates contraint to width anchor.
    @discardableResult
    func anchorWidth(_ viewOrAnchor: NSLayoutDimension?, multiplier: CGFloat = 1.0, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
        return createDimentionAnchorWithOther(widthAnchor, otherDimension: viewOrAnchor, multiplier: multiplier, activated: activated, priority: priority)
    }
    
    // MARK: - Size
    
    /// Creates contraint to height, width anchor.
    @discardableResult
    func anchorSize(_ relation: LayoutRelation = LayoutRelation.default, activated: Bool = true, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint] {
        let heightConstraint = createDimentionAnchorEqualTo(widthAnchor, relatedBy: relation, activated: activated, priority: priority)
        let widthConstraint = createDimentionAnchorEqualTo(heightAnchor, relatedBy: relation, activated: activated, priority: priority)
        return [heightConstraint, widthConstraint]
    }
    
    // MARK: - Support methods for dimention
    
    @discardableResult
    fileprivate func createDimentionAnchorEqualTo(_ anchor: NSLayoutDimension, relatedBy relation: LayoutRelation = LayoutRelation.default, activated: Bool, priority: UILayoutPriority) -> NSLayoutConstraint {
        prepareForAutolayout()
        
        let constraint: NSLayoutConstraint
        switch relation {
        case let .equalTo(span):
            constraint = anchor.constraint(equalToConstant: span.rawValue)
        case let .lessThanOrEqualTo(span):
            constraint = anchor.constraint(lessThanOrEqualToConstant: span.rawValue)
        case let .greaterThanOrEqualTo(span):
            constraint = anchor.constraint(greaterThanOrEqualToConstant: span.rawValue)
        }
        
        constraint.isActive = activated
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult
    fileprivate func createDimentionAnchorWithOther(_ dimension: NSLayoutDimension?, otherDimension: NSLayoutDimension?, relatedBy relation: LayoutRelation = LayoutRelation.default, multiplier: CGFloat, activated: Bool, priority: UILayoutPriority) -> NSLayoutConstraint? {
        guard let dimension = dimension, let otherDimension = otherDimension else { return nil }
        
        prepareForAutolayout()
        
        let constraint: NSLayoutConstraint
        switch relation {
        case let .equalTo(span):
            constraint = dimension.constraint(equalTo: otherDimension, multiplier: multiplier, constant: span.rawValue)
        case let .lessThanOrEqualTo(span):
            constraint = dimension.constraint(lessThanOrEqualTo: otherDimension, multiplier: multiplier, constant: span.rawValue)
        case let .greaterThanOrEqualTo(span):
            constraint = dimension.constraint(greaterThanOrEqualTo: otherDimension, multiplier: multiplier, constant: span.rawValue)
        }
        
        constraint.isActive = activated
        constraint.priority = priority
        return constraint
    }
}

// MARK: - Button Size

public extension UIButton {
    /// Creates contraint to button height.
    @discardableResult
    func anchorButtonHeight(_ buttonHeight: ButtonHeight, activated: Bool = true) -> NSLayoutConstraint? {
        return anchorHeight(.equalTo(buttonHeight), activated: activated, priority: .required)
    }
}

public extension UIView {
    /// Creates contraint to icon size.
    @discardableResult
    func anchorIcon(_ iconSize: IconSize, activated: Bool = true) -> [NSLayoutConstraint]? {
        return anchorSize(.equalTo(iconSize), activated: activated, priority: .required)
    }
}

// MARK: - Support for autolayout

fileprivate extension UIView {
    /// Support method for autolayouts
    private func prepareForAutolayout() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
