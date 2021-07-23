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

public extension UIView {
    var flSafeLeft: NSLayoutXAxisAnchor { safeAreaLayoutGuide.leftAnchor }
    var flSafeRight: NSLayoutXAxisAnchor { safeAreaLayoutGuide.rightAnchor }

    var flSafeLeading: NSLayoutXAxisAnchor { safeAreaLayoutGuide.leadingAnchor }
    var flSafeTrailing: NSLayoutXAxisAnchor { safeAreaLayoutGuide.trailingAnchor }

    var flSafeTop: NSLayoutYAxisAnchor { safeAreaLayoutGuide.topAnchor }
    var flSafeBottom: NSLayoutYAxisAnchor { safeAreaLayoutGuide.bottomAnchor }

    var flSafeWidth: NSLayoutDimension { safeAreaLayoutGuide.widthAnchor }
    var flSafeHeight: NSLayoutDimension { safeAreaLayoutGuide.heightAnchor }

    var flSafeCenterX: NSLayoutXAxisAnchor { safeAreaLayoutGuide.centerXAnchor }
    var flSafeCenterY: NSLayoutYAxisAnchor { safeAreaLayoutGuide.centerYAnchor }
}

public extension UIView {
    var flMarginsLeft: NSLayoutXAxisAnchor { layoutMarginsGuide.leftAnchor }
    var flMarginsRight: NSLayoutXAxisAnchor { layoutMarginsGuide.rightAnchor }

    var flMarginsLeading: NSLayoutXAxisAnchor { layoutMarginsGuide.leadingAnchor }
    var flMarginsTrailing: NSLayoutXAxisAnchor { layoutMarginsGuide.trailingAnchor }

    var flMarginsTop: NSLayoutYAxisAnchor { layoutMarginsGuide.topAnchor }
    var flLayoutMarginsBottom: NSLayoutYAxisAnchor { layoutMarginsGuide.bottomAnchor }

    var flMarginsWidth: NSLayoutDimension { layoutMarginsGuide.widthAnchor }
    var flMarginsHeight: NSLayoutDimension { layoutMarginsGuide.heightAnchor }

    var flMarginsCenterX: NSLayoutXAxisAnchor { layoutMarginsGuide.centerXAnchor }
    var flMarginsCenterY: NSLayoutYAxisAnchor { layoutMarginsGuide.centerYAnchor }
}

public extension UIView {
    var flReadableLeft: NSLayoutXAxisAnchor { readableContentGuide.leftAnchor }
    var flReadableRight: NSLayoutXAxisAnchor { readableContentGuide.rightAnchor }

    var flReadableLeading: NSLayoutXAxisAnchor { readableContentGuide.leadingAnchor }
    var flReadableTrailing: NSLayoutXAxisAnchor { readableContentGuide.trailingAnchor }

    var flReadableTop: NSLayoutYAxisAnchor { readableContentGuide.topAnchor }
    var flReadableBottom: NSLayoutYAxisAnchor { readableContentGuide.bottomAnchor }

    var flReadableWidth: NSLayoutDimension { readableContentGuide.widthAnchor }
    var flReadableHeight: NSLayoutDimension { readableContentGuide.heightAnchor }

    var flReadableCenterX: NSLayoutXAxisAnchor { readableContentGuide.centerXAnchor }
    var flReadableCenterY: NSLayoutYAxisAnchor { readableContentGuide.centerYAnchor }
}

