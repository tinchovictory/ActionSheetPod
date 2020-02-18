//
//  NewViewController.swift
//  ActionSheet_Example
//
//  Created by Martin Victory on 18/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.7, green: 0.12, blue: 0.4, alpha: 1.0)
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
