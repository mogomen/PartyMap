//
//  FavoritesTableViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 22/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    @IBOutlet weak var tableViewFav: UITableView!
    var categoriesList:[Favorites] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesList = createArray()
        tableViewFav.dataSource = self
        tableViewFav.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func createArray() -> [Favorites] {
        var favoritesMy:[Favorites] = []
        var line1 = Favorites(image: #imageLiteral(resourceName: "flame"), title: "checking")
        favoritesMy.append(line1)
        return favoritesMy
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categoriesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var favorites = categoriesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        self.navigationItem.title = "Categories"
        self.navigationItem.leftBarButtonItem?.title = "back"
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
}
