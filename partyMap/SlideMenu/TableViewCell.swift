//
//  TableViewCell.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 10/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    func setImageLabel(icons: MyIcons) {
        
        iconImage.image = icons.image
        iconLabel.text = icons.myTitle
}
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
