//
//  FlashLayoutDescriber.swift
//  FlashLayout
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

public protocol FlashLayoutDescriber {
    associatedtype AnchorType: AnyObject
    var anchor: NSLayoutAnchor<AnchorType> { get }
    var constant: CGFloat { get }
}

extension NSLayoutYAxisAnchor: FlashLayoutDescriber {
    public var anchor: NSLayoutAnchor<NSLayoutYAxisAnchor> { self }
    public var constant: CGFloat { 0 }
}

extension NSLayoutXAxisAnchor: FlashLayoutDescriber {
    public var anchor: NSLayoutAnchor<NSLayoutXAxisAnchor> { self }
    public var constant: CGFloat { 0 }
}

public struct FlashLayoutDescriptor<AnchorType: AnyObject>: FlashLayoutDescriber {
    public let anchor: NSLayoutAnchor<AnchorType>
    public let constant: CGFloat
}
