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
    private var contentViewController: UIViewController
    
    public init(target: UIViewController, contentViewController: UIViewController) {
        self.parentVC = target
        self.contentViewController = contentViewController
    }
    
    public func present() {
        let actionSheetVC = ActionSheetController()
        self.actionSheetController = actionSheetVC
        self.actionSheetController?.contentViewController = self.contentViewController
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
