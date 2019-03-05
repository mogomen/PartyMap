//
//  ImageViewCell.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 23/01/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placeImage: UIButton!
    
    
    
    
    func setImageRound() {
    
        
        layer.borderWidth = 1
        
        
        
        
        
    }
    
    layer.borderWidth = 1
    image.layer.masksToBounds = false
    image.layer.borderColor = UIColor.black.cgColor
    image.layer.cornerRadius = image.frame.height/2
    image.clipsToBounds = true
    
    
    
    
    
    
    
}
