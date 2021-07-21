//
//  NSLayoutConstraint+Builder.swift
//  FlashLayoutåå
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

public extension NSLayoutConstraint {
    /// Activate layout constraints
    ///
    /// # Example #
    ///
    /// ```
    /// NSLayoutConstraint.activate(views: ["c": c, "d": d]) {
    ///     a.leftAnchor.constraint(equalTo: b.leftAnchor)
    ///     "H:|[c][d]|".options(.alignAllTop)
    ///     "V:|[c]|"
    ///     existingConstraintsArray
    /// }
    /// ```
    ///
    /// - Parameter metrics: The metrics to use for visual format constraints
    /// - Parameter view: The views to use for visual format constraints
    static func activate(
        metrics: [String: CGFloat] = [:],
        views: [String: NSLayoutConstraint.Containable] = [:],
        @FlashLayoutConstraintBuilder contents: () -> FlashLayoutConstraintHolder
    ) {
        activate(contents().constraints(metrics: metrics, views: views))
    }

    /// Create layout constraints
    ///
    /// # Example #
    ///
    /// ```
    /// let constraints = NSLayoutConstraint.constraints(views: ["c": c, "d": d]) {
    ///     a.leftAnchor.constraint(equalTo: b.leftAnchor)
    ///     "H:|[c][d]|".options(.alignAllTop)
    ///     "V:|[c]|"
    ///     existingConstraintsArray
    /// }
    /// ```
    ///
    /// - Parameter metrics: The metrics to use for visual format constraints
    /// - Parameter view: The views to use for visual format constraints
    /// - Returns: An array of constraints
    static func constraints(
        metrics: [String: CGFloat] = [:],
        views: [String: NSLayoutConstraint.Containable] = [:],
        @FlashLayoutConstraintBuilder contents: () -> FlashLayoutConstraintHolder
    ) -> [NSLayoutConstraint] {
        return contents().constraints(metrics: metrics, views: views)
    }
}

public protocol FlashLayoutConstraintHolder {
    func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint]
}

extension NSLayoutConstraint: FlashLayoutConstraintHolder {
    public func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        return [self]
    }
}

extension Array: FlashLayoutConstraintHolder where Iterator.Element == NSLayoutConstraint {
    public func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        return self
    }
}

private struct CWLayoutFormat: FlashLayoutConstraintHolder, ExpressibleByStringLiteral {
    let format: String
    let options: NSLayoutConstraint.FormatOptions

    init(_ format: String, options: NSLayoutConstraint.FormatOptions = []) {
        self.format = format
        self.options = options
    }

    init(stringLiteral value: String) {
        self.init(value)
    }

    func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: options,
            metrics: metrics,
            views: views
        )
    }
}

extension String: FlashLayoutConstraintHolder {
    public func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        return CWLayoutFormat(self).constraints(metrics: metrics, views: views)
    }

    public func options( _ options: NSLayoutConstraint.FormatOptions) -> FlashLayoutConstraintHolder {
        return CWLayoutFormat(self, options: options)
    }
}

private struct CompositeLayoutConstraintBuilder: FlashLayoutConstraintHolder {
    let holders: [FlashLayoutConstraintHolder]

    init(holders: [FlashLayoutConstraintHolder] = []) {
        self.holders = holders
    }

    func constraints(
        metrics: [String: CGFloat],
        views: [String: NSLayoutConstraint.Containable]
    ) -> [NSLayoutConstraint] {
        return holders.flatMap { $0.constraints(metrics: metrics, views: views) }
    }
}

@resultBuilder
public struct FlashLayoutConstraintBuilder {
    public static func buildBlock() -> FlashLayoutConstraintHolder {
        CompositeLayoutConstraintBuilder()
    }

    public static func buildBlock(
        _ content: FlashLayoutConstraintHolder
    ) -> FlashLayoutConstraintHolder {
        content
    }

    public static func buildBlock(
        _ contents: FlashLayoutConstraintHolder...
    ) -> FlashLayoutConstraintHolder {
        CompositeLayoutConstraintBuilder(holders: contents)
    }

    public static func buildBlock<Content: FlashLayoutConstraintHolder>(
        _ contents: Content...
    ) -> FlashLayoutConstraintHolder {
        CompositeLayoutConstraintBuilder(holders: contents)
    }

    public static func buildExpression(
        _ expression: FlashLayoutConstraintHolder
    ) -> FlashLayoutConstraintHolder {
      return expression
    }

    public static func buildOptional(
        _ content: FlashLayoutConstraintHolder?
    ) -> FlashLayoutConstraintHolder {
        content ?? CompositeLayoutConstraintBuilder()
    }

    public static func buildEither(
        first: FlashLayoutConstraintHolder
    ) -> FlashLayoutConstraintHolder {
        first
    }

    public static func buildEither(
        second: FlashLayoutConstraintHolder
    ) -> FlashLayoutConstraintHolder {
        second
    }

    public static func buildLimitedAvailability<Content: FlashLayoutConstraintHolder>(
        _ content: Content
    ) -> FlashLayoutConstraintHolder {
        content
    }

    public static func buildArray(
        _ contents: [FlashLayoutConstraintHolder]
    ) -> FlashLayoutConstraintHolder {
        CompositeLayoutConstraintBuilder(holders: contents)
    }

    public static func buildArray<Content: FlashLayoutConstraintHolder>(
        _ contents: [Content]
    ) -> FlashLayoutConstraintHolder {
        CompositeLayoutConstraintBuilder(holders: contents)
    }
}
