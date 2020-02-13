//
//  ViewController.swift
//  ActionSheet
//
//  Created by tinchovictory on 02/12/2020.
//  Copyright (c) 2020 tinchovictory. All rights reserved.
//

import UIKit
import ActionSheet

class ViewController: UIViewController {
    
    private let actionSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "label"
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapShowActionSheet(_ sender: UIButton) {
        let actionSheet = ActionSheet(target: self, contentView: actionSheetView)
        actionSheet.present()
    }

}

