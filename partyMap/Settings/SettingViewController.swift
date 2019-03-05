//
//  SettingViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 18/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyArray.count
    }

     var MyArray = ["City","Language","Privacy","About PartyMap"]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = MyArray[indexPath.row]
        cell.textLabel?.textColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 51.0/255, alpha: 1)
        cell.textLabel?.font = UIFont(name: "helvetica", size: 13)
        return cell
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var settings = MyArray
        if settings[indexPath.row] == "City"{
            print("hello")
        }
    }
}
