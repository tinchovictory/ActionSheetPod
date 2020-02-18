//
//  ActionSheetController.swift
//  ActionSheet
//
//  Created by Martin Victory on 13/02/2020.
//

import UIKit

public class ActionSheetController: UIViewController {
    
    private var backgroundBlurView: UIView!
    private var contentView: UIView!
    public var contentViewController: UIViewController!
    public var actionSheet: ActionSheet!

    override public func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .none
        
        self.backgroundBlurView = UIView()
        self.backgroundBlurView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundBlurView.backgroundColor = .black
        self.view.addSubview(self.backgroundBlurView)
       
        self.contentView = UIView()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.contentView)
        
        // Add contentVC
        addChild(contentViewController)
        self.contentView.addSubview(contentViewController.view)
        self.contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.backgroundBlurView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundBlurView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.backgroundBlurView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.backgroundBlurView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            
            self.contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            
            self.contentViewController.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.contentViewController.view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.contentViewController.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.contentViewController.view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
        ])
    
        contentViewController.didMove(toParent: self)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundBlurView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackgroundBlur)))
        
        self.backgroundBlurView.isHidden = true
        self.contentView.isHidden = true
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate(isPresenting: true)
    }
    
    private func animate(isPresenting: Bool, completition handler: @escaping (() -> Void) = {}) {
        let screenSize = UIScreen.main.bounds.size
        
        if isPresenting {
            self.backgroundBlurView.alpha = 0

            self.backgroundBlurView.isHidden = false
            self.contentView.isHidden = false
        }
        
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            animations: {
                self.backgroundBlurView.alpha = isPresenting ? 0.2 : 0
                self.contentView.frame = isPresenting ? CGRect(origin: .zero, size: screenSize) : CGRect(origin: CGPoint(x: self.contentView.frame.origin.x, y: screenSize.height), size: self.contentView.frame.size)
            }, completion: { (success) in
                if success && !isPresenting {
                    self.backgroundBlurView.isHidden = true
                    self.contentView.isHidden = true
                    self.dismiss(animated: false, completion: handler)
                }
            }
        )
    }
    
    public func dissmis(_ completitionHandler: @escaping () -> Void) {
        animate(isPresenting: false, completition: completitionHandler)
    }
    
    @objc private func tapBackgroundBlur() {
        actionSheet.dismiss()
    }

}
