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
