//
//  NSLayoutConstraint+Utilities.swift
//  FlashLayout
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

@objc
public protocol __LayoutConstraintContainable {}

public extension NSLayoutConstraint {
    class func activate(_ constraints: NSLayoutConstraint...) {
        let constraintsArray: [NSLayoutConstraint] = constraints
        activate(constraintsArray)
    }

    class func deactivate(_ constraints: NSLayoutConstraint...) {
        let constraintsArray: [NSLayoutConstraint] = constraints
        deactivate(constraintsArray)
    }

    typealias Containable = __LayoutConstraintContainable
}

public extension NSLayoutConstraint {
    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UIView: NSLayoutConstraint.Containable {}
extension UILayoutGuide: NSLayoutConstraint.Containable {}

public extension UIView {
    @discardableResult
    func addConstraints(
        _ format: String,
        options: NSLayoutConstraint.FormatOptions = [],
        metrics: [String: CGFloat]? = nil,
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: options,
            metrics: metrics,
            views: views
        )
        addConstraints(constraints)

        return constraints
    }

    @discardableResult
    func addConstraint(
        _ item: NSLayoutConstraint.Containable,
        attribute: NSLayoutConstraint.Attribute,
        relatedBy: NSLayoutConstraint.Relation,
        toItem: NSLayoutConstraint.Containable?,
        toAttribute: NSLayoutConstraint.Attribute,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: item,
            attribute: attribute,
            relatedBy: relatedBy,
            toItem: toItem,
            attribute: toAttribute,
            multiplier: multiplier,
            constant: constant
        )
        addConstraint(constraint)
        return constraint
    }

    func addConstraints(_ constraints: NSLayoutConstraint...) {
        let constraintsArray: [NSLayoutConstraint] = constraints
        addConstraints(constraintsArray)
    }
}

public extension RangeReplaceableCollection where Element == NSLayoutConstraint {
    mutating func addConstraints(
        _ format: String,
        options: NSLayoutConstraint.FormatOptions = [],
        metrics: [String: CGFloat]? = nil,
        views: [String: NSLayoutConstraint.Containable]
    ) {
        let constraints = NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: options,
            metrics: metrics,
            views: views
        )
        append(contentsOf: constraints)
    }
}
