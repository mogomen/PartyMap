//
//  CategoriesDataViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 11/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class CategoriesDataViewController: UIViewController {
    
    var categoriesList:[Categories] = []
    
    func fetchArray () {
        categoriesList = createArray()
    }
    
    func createArray() -> [Categories] {
        var myCategories:[Categories] = []
        
        let icon1 = Categories(image: #imageLiteral(resourceName: "museum1"), title: "Museum")
        let icon2 = Categories(image: #imageLiteral(resourceName: "concert"), title: "Concert")
        let icon3 = Categories(image: #imageLiteral(resourceName: "disco-ball"), title: "Club")
        let icon4 = Categories(image: #imageLiteral(resourceName: "cocktail"), title: "Bar")
        let icon5 = Categories(image: #imageLiteral(resourceName: "cinema"), title: "Cinema")
        let icon6 = Categories(image: #imageLiteral(resourceName: "flame"), title: "Others")
        
        myCategories.append(icon1)
        myCategories.append(icon2)
        myCategories.append(icon3)
        myCategories.append(icon4)
        myCategories.append(icon5)
        myCategories.append(icon6)
        
        return myCategories
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
