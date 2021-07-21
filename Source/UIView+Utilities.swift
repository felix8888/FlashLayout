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
    var flLeft: NSLayoutXAxisAnchor { leftAnchor }
    var flRight: NSLayoutXAxisAnchor { rightAnchor }

    var flLeading: NSLayoutXAxisAnchor { leadingAnchor }
    var flTrailing: NSLayoutXAxisAnchor { trailingAnchor }

    var flTop: NSLayoutYAxisAnchor { topAnchor }
    var flBottom: NSLayoutYAxisAnchor { bottomAnchor }

    var flWidth: NSLayoutDimension { widthAnchor }
    var flHeight: NSLayoutDimension { heightAnchor }

    var flCenterX: NSLayoutXAxisAnchor { centerXAnchor }
    var flCenterY: NSLayoutYAxisAnchor { centerYAnchor }
}
