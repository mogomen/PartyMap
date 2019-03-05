//
//  NavigationViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 05/03/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    let navigation = UINavigationController()
    
    func makeBarHidden() {
        navigation.isNavigationBarHidden = true
    }
        override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
