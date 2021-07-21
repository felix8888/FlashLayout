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
        NSLayoutConstraint.activate(views: ["aView": aView]) {
            "V:|[aView(100)]"
            aView.flWidth == 100
            bView.flLeft == aView.flCenterX + 100
            bView.flHeight <= aView.flHeight * 0.5 + 100
            bView.flWidth == bView.flHeight
        }

//      option 2
//      view.addConstraints("|[aView]|", views: ["aView": aView])
    }
}

