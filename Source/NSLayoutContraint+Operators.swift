//
//  NSLayoutContraint+Operators.swift
//  FlashLayoutDemo
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

public func <= <AnchorType>(left: NSLayoutAnchor<AnchorType>, right: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    return left.constraint(lessThanOrEqualTo: right)
}

public func <= (left: NSLayoutDimension, right: FlashLayoutDimensionDescriber) -> NSLayoutConstraint {
    guard let anchor = right.anchor else {
        return left.constraint(lessThanOrEqualToConstant: right.constant)
    }
    return left.constraint(lessThanOrEqualTo: anchor, multiplier: right.multiplier, constant: right.constant)
}

public func >= <AnchorType>(left: NSLayoutAnchor<AnchorType>, right: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    return left.constraint(greaterThanOrEqualTo: right)
}

public func >= (left: NSLayoutDimension, right: FlashLayoutDimensionDescriber) -> NSLayoutConstraint {
    guard let anchor = right.anchor else {
        return left.constraint(greaterThanOrEqualToConstant: right.constant)
    }
    return left.constraint(greaterThanOrEqualTo: anchor, multiplier: right.multiplier, constant: right.constant)
}

public func == <Describer: FlashLayoutDescriber>(left: NSLayoutAnchor<Describer.AnchorType>, right: Describer) -> NSLayoutConstraint {
    return left.constraint(equalTo: right.anchor, constant: right.constant)
}

public func == (left: NSLayoutDimension, right: FlashLayoutDimensionDescriber) -> NSLayoutConstraint {
    guard let anchor = right.anchor else {
        return left.constraint(equalToConstant: right.constant)
    }
    return left.constraint(equalTo: anchor, multiplier: right.multiplier, constant: right.constant)
}

public func + <AnchorType>(left: NSLayoutAnchor<AnchorType>, constant: CGFloat) -> FlashLayoutDescriptor<AnchorType> {
    return FlashLayoutDescriptor(anchor: left, constant: constant)
}

public func + (left: FlashLayoutDimensionDescriptor, right: NSNumber) -> FlashLayoutDimensionDescriptor {
    var descriptor = left
    descriptor.constant += CGFloat(right.floatValue)

    return descriptor
}

public func * (left: NSLayoutDimension, right: NSNumber) -> FlashLayoutDimensionDescriptor {
    return FlashLayoutDimensionDescriptor(anchor: left, multiplier: right)
}

public func * (left: NSLayoutDimension, right: Int) -> FlashLayoutDimensionDescriptor {
    return FlashLayoutDimensionDescriptor(anchor: left, multiplier: right)
}
