//
//  UIView+Utilities.swift
//  FlashLayout
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        let views: [UIView] = subviews
        addSubviews(views)
    }

    func addSubviews<S: Sequence>(_ subviews: S) where S.Iterator.Element: UIView {
        for view in subviews {
            addSubview(view)
        }
    }
}

public extension UIView {
    var left: NSLayoutXAxisAnchor { leftAnchor }
    var right: NSLayoutXAxisAnchor { rightAnchor }

    var leading: NSLayoutXAxisAnchor { leadingAnchor }
    var trailing: NSLayoutXAxisAnchor { trailingAnchor }

    var top: NSLayoutYAxisAnchor { topAnchor }
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }

    var width: NSLayoutDimension { widthAnchor }
    var height: NSLayoutDimension { heightAnchor }

    var centerX: NSLayoutXAxisAnchor { centerXAnchor }
    var centerY: NSLayoutYAxisAnchor { centerYAnchor }
}
