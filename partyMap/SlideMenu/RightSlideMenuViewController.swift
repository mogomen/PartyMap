//
//  RightSlideMenuViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 09/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class RightSlideMenuViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var imageIcon:[MyIcons] = []
    var navigationMy =  UINavigationController()
    var centerViewController: MapViewController!
    
    func createArray() -> [MyIcons] {
        var iconsLabels: [MyIcons] = []
        
        let icon1 = MyIcons(image: #imageLiteral(resourceName: "one"), myTitle: "Create event")
        let icon2 = MyIcons(image: #imageLiteral(resourceName: "two"), myTitle: "Categories")
        let icon3 = MyIcons(image: #imageLiteral(resourceName: "three"), myTitle: "Favorites")
        let icon4 = MyIcons(image: #imageLiteral(resourceName: "four"), myTitle: "Rate us")
        let icon5 = MyIcons(image: #imageLiteral(resourceName: "five"), myTitle: "Feedback")
        let icon6 = MyIcons(image: #imageLiteral(resourceName: "six"), myTitle: "Settings")
    
        iconsLabels.append(icon1)
        iconsLabels.append(icon2)
        iconsLabels.append(icon3)
        iconsLabels.append(icon4)
        iconsLabels.append(icon5)
        iconsLabels.append(icon6)
        
        return iconsLabels
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerViewController = UIStoryboard.leftViewController()
        imageIcon = createArray()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    extension RightSlideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return imageIcon.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let imageicon = imageIcon[indexPath.row]
            let cell = myTableView.dequeueReusableCell(withIdentifier: "rightTableView") as! TableViewCell
            cell.setImageLabel(icons: imageicon)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
            if indexPath.row == 0 { // create event
                let storyboard = UIStoryboard(name: "CreateEvent", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "CreateEventID") as! CreateEventListViewController
                navigationController?.pushViewController(vc,animated: true)
            }
            if indexPath.row == 1 { // categories
                let storyboard = UIStoryboard(name: "Categories", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "categoriesID") as! CategoriesViewController
                navigationController?.pushViewController(vc,animated: true)
            }
            if indexPath.row == 2{ // favorites
               let storyboard = UIStoryboard(name: "Favorites", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "phonyID") as! PhonyController
                navigationController?.pushViewController(vc,animated: true)
            }
            if indexPath.row == 3{ // rate us
                let storyboard = UIStoryboard(name: "RateUs", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "RateUsID") as! RateUsViewController
                navigationController?.pushViewController(vc,animated: true)
            }
            if indexPath.row == 4{ // feedback
                let storyboard = UIStoryboard(name: "Feedback", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "FeedbackID") as! FeedbackViewController
                navigationController?.pushViewController(vc,animated: true)
            }
            if indexPath.row == 5{ // settings
                let storyboard = UIStoryboard(name: "Settings", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "SettingsID") as! SettingViewController
                navigationController?.pushViewController(vc,animated: true)
            }
        }
}
    
    private extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    static func leftViewController() -> MapViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "map") as? MapViewController
    }
}
