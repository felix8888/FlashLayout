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
            aView.height == aView.width * 2 + 30
            aView.width == 100
            bView.left == aView.centerX + 100
            bView.height <= aView.height * 0.5 + 100
            bView.width == bView.height
        }

//      option 2
//      view.addConstraints("|[aView]|", views: ["aView": aView])
    }
}

