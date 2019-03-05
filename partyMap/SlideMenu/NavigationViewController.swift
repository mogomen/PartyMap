//
//  NavigationViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 09/01/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  let cell1 = imageIcon
        
        
        if indexPath.row == 0{
            
        }
        if indexPath.row == 1{
            
            let storyboard = UIStoryboard(name: "Categories", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "categoriesID") as! CategoriesViewController
            navigationController?.pushViewController(vc,animated: true)
        }
        if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Favorites", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "phonyID") as! PhonyController
            // let vc = FeedbackViewController()
            navigationController?.pushViewController(vc,animated: true)
            print("hello")
        }
        if indexPath.row == 3{
            let vc = RateUsViewController()
            navigationController?.pushViewController(vc,animated: true)
            
        }
        if indexPath.row == 4{
            
            let vc = FeedbackViewController()
            navigationController?.pushViewController(vc,animated: true)
            
        }
        if indexPath.row == 5{
            // let storyboard = UIStoryboard(name: "Settings", bundle: nil)
            // let vc = storyboard.instantiateViewController(withIdentifier: "VCid") as! SettingViewController
            //navigationController?.pushViewController(vc,animated: true)
            
            
            let vc = MollyViewController()
            
            navigationController?.pushViewController(vc, animated: true)
            
            print("okey")
            print("ok")
        }
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
