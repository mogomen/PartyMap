//
//  LinksCollectionViewCell.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 28/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class LinksCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LinksCollectionViewCell"
    
    let socialImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()

    let linkItself: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(socialImage)
        addSubview(linkItself)
    
        // mainImageView constraints
        socialImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        socialImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        socialImage.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        socialImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
        // nameLabel constraints
        linkItself.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        linkItself.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        linkItself.topAnchor.constraint(equalTo: socialImage.bottomAnchor, constant: 12).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
