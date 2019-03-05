//
//  FeedbackViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 22/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
