//
//  ContainerViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 06/01/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit
import QuartzCore

class ContainerViewController: UIViewController {

    var nc = NavigationViewController()
    var nav = UINavigationController()
    
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
        case rightPanelExpanded
    }
    
    var currentState: SlideOutState = .bothCollapsed
    var centerNavigationController: UINavigationController!
    var centerViewController: MapViewController!
    var leftViewController: RightSlideMenuViewController!
    let centerPanelExpandedOffset: CGFloat = 47
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        centerViewController = UIStoryboard.leftViewController()
        centerViewController.delegate = self
       
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        centerNavigationController.isNavigationBarHidden = true
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

private extension UIStoryboard {
    
    static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    static func leftViewController() -> MapViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "map") as? MapViewController
    }
    
    static func second() -> RightSlideMenuViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "RightViewController") as? RightSlideMenuViewController
    }
}

extension ContainerViewController: DelegateMapViewController {
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        guard leftViewController == nil else { return }
        if let vc = UIStoryboard.second() {
            addChildSidePanelController(vc)
            leftViewController = vc
        }
    }
    
    func addChildSidePanelController(_ sidePanelController: RightSlideMenuViewController) {
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: -centerNavigationController.view.frame.width + centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.currentState = .bothCollapsed
                self.leftViewController?.view.removeFromSuperview()
                self.leftViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
}



