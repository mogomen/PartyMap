//
//  FavoritesTableViewCell.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 22/12/2018.
//  Copyright © 2018 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var labelFav: UILabel!
    @IBOutlet weak var imageFav: UIImageView!
    
    func setFavorites(icons: Favorites) {
        imageFav.image = icons.image
        labelFav.text = icons.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 
    }
}
