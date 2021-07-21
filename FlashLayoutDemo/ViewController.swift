//
//  ViewController.swift
//  FlashLayoutDemo
//
//  Created by Felix Niu on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    private let aView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let bView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(aView, bView)
        
//      option 1
        NSLayoutConstraint.activate {
            aView.heightAnchor == aView.widthAnchor * 2 + 30
            aView.widthAnchor == 100
            bView.leftAnchor == aView.centerXAnchor + 100
            bView.heightAnchor <= aView.heightAnchor * 0.5 + 100
            bView.widthAnchor == bView.heightAnchor
        }

//      option 2
//      view.addConstraints("|[aView]|", views: ["aView": aView])
    }
}

