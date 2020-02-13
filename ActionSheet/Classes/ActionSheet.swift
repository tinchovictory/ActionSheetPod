//
//  ActionSheet.swift
//  ActionSheet
//
//  Created by Martin Victory on 13/02/2020.
//

import Foundation

public class ActionSheet {
    
    private let parentVC: UIViewController
    private weak var actionSheetController: ActionSheetController?
    private var contentView: UIView
    
    public init(target: UIViewController, contentView: UIView) {
        self.parentVC = target
        self.contentView = contentView
    }
    
    public func present() {
        let actionSheetVC = ActionSheetController()
        self.actionSheetController = actionSheetVC
        self.actionSheetController?.contentView = self.contentView
        self.actionSheetController?.actionSheet = self
        self.actionSheetController?.modalPresentationStyle = .overFullScreen
        parentVC.present(actionSheetVC, animated: false, completion: nil)
    }
    
    public func dismiss(_ completitionHandler: @escaping (() -> Void) = {}) {
        actionSheetController?.dissmis {
            completitionHandler()
        }
    }
}
