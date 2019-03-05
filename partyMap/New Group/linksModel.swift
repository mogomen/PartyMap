//
//  linksModel.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 28/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import Foundation
import UIKit

struct Links {
    var socialImage: UIImage
    var linkItself: String
  
   static func fetchLinks() -> [Links] {
        let mobilePhoneLink = Links(socialImage: UIImage(named: "one")!, linkItself: "http")
        let vkLink = Links(socialImage: UIImage(named: "one")!, linkItself: "http")
        let instagramLink = Links(socialImage: UIImage(named: "instagram ")!, linkItself: "http")
        let facebookLink = Links(socialImage: UIImage(named: "one")!, linkItself: "http")
        let twitterLink = Links(socialImage: UIImage(named: "one")!, linkItself: "http")
    
        return [mobilePhoneLink, instagramLink ,vkLink, facebookLink, twitterLink]
    }
}
    struct Constants {
        static let leftDistanceToView: CGFloat = 40
        static let rightDistanceToView: CGFloat = 40
        static let galleryMinimumLineSpacing: CGFloat = 10
        static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
    }

    
    
    
    
    



