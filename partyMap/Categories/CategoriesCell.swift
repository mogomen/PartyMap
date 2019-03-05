//
//  CategoriesCell.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 21/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setCategoriesList(list: Categories) {
        categoryImage.image = list.image
        categoryLabel.text = list.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
