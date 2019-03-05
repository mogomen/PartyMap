//
//  EventMenuViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 28/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class EventMenuViewController: UIViewController {

    private var LinksGalleryCollectionView = LinksCollectionView()
    // Outlets
    @IBOutlet weak var upperLineImage: UIImageView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var namePlace: UILabel!
    @IBOutlet weak var adressPlace: UILabel!
    @IBOutlet weak var timeEvent: UILabel!
    @IBOutlet weak var categoryEvent: UILabel!
    @IBOutlet weak var photoAlbum: UIButton!
    @IBOutlet weak var aboutEvent: UILabel!
    @IBOutlet weak var willGoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(LinksGalleryCollectionView)
        
        // constrains for galleryCollectionView
        LinksGalleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        LinksGalleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        LinksGalleryCollectionView.topAnchor.constraint(equalTo:photoAlbum.bottomAnchor, constant: 10).isActive = true
        LinksGalleryCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        LinksGalleryCollectionView.set(cells: Links.fetchLinks())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
