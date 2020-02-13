//
//  ViewExtension.swift
//  ActionSheet
//
//  Created by Martin Victory on 13/02/2020.
//

import UIKit

extension UIView {

    func blur(style: UIBlurEffect.Style = .extraLight) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.layer.cornerRadius = 18
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
    }

}
