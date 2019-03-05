//
//  CategoriesViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 21/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    var categoriesList:[Categories] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var categoryArray = CategoriesDataViewController()
        categoriesList = categoryArray.createArray()
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var list = categoriesList[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "categories") as! CategoriesCell
        cell.setCategoriesList(list: list)
        return cell
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
