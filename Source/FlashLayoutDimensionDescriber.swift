//
//  FlashLayoutDimensionDescriber.swift
//  FlashLayout
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

public protocol FlashLayoutDimensionDescriber {
    var anchor: NSLayoutDimension? { get }
    var multiplier: CGFloat { get }
    var constant: CGFloat { get }
}

extension NSNumber: FlashLayoutDimensionDescriber {
    public var constant: CGFloat {
        return CGFloat(floatValue)
    }

    public var anchor: NSLayoutDimension? { nil }
    public var multiplier: CGFloat { 1 }
}

extension Int: FlashLayoutDimensionDescriber {
    public var constant: CGFloat {
        return CGFloat(self)
    }

    public var anchor: NSLayoutDimension? { nil }
    public var multiplier: CGFloat { 1 }
}

extension CGFloat: FlashLayoutDimensionDescriber {
    public var constant: CGFloat {
        return self
    }

    public var anchor: NSLayoutDimension? { nil }
    public var multiplier: CGFloat { 1 }
}

extension Double: FlashLayoutDimensionDescriber {
    public var constant: CGFloat {
        return CGFloat(self)
    }

    public var anchor: NSLayoutDimension? { nil }
    public var multiplier: CGFloat { 1 }
}

extension NSLayoutDimension: FlashLayoutDimensionDescriber {
    public var constant: CGFloat { 0 }
    public var anchor: NSLayoutDimension? { self }
    public var multiplier: CGFloat { 1 }
}

public struct FlashLayoutDimensionDescriptor: FlashLayoutDimensionDescriber {
    public let anchor: NSLayoutDimension?
    public let multiplier: CGFloat
    public var constant: CGFloat

    public init(anchor: NSLayoutDimension?, multiplier: NSNumber = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = CGFloat(multiplier.floatValue)
        self.constant = constant
    }

    public init(anchor: NSLayoutDimension?, multiplier: Int = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = CGFloat(multiplier)
        self.constant = constant
    }

    public init(anchor: NSLayoutDimension?, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}
