//
//  ContainerRightViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 09/01/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class ContainerRightViewController: UIViewController {

    var centerNavigationController: UINavigationController!
    var  centerViewController: RightSlideMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerViewController = UIStoryboard.centerView()
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

private extension UIStoryboard {
    
    static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    static func centerView() -> RightSlideMenuViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "right") as? RightSlideMenuViewController
    }
}




