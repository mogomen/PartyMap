//
//  LinksCollectionView.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 28/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class LinksCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
 var cells = [Links]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0.9589126706, green: 0.9690223336, blue: 0.9815708995, alpha: 1)
        delegate = self
        dataSource = self
        
        register(LinksCollectionViewCell.self, forCellWithReuseIdentifier: LinksCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
 
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [Links]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: LinksCollectionViewCell.reuseId, for: indexPath) as! LinksCollectionViewCell
    
        cell.socialImage.image = cells[indexPath.row].socialImage
        cell.linkItself.text = cells[indexPath.row].linkItself
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
}
