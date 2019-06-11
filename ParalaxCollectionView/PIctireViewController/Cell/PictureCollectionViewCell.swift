//
//  PictureCollectionViewCell.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 5/29/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: TappableCollectionViewCell {

    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func  configure(model: Picture) {
        userProfileImageView.image = model.user.image
        pictureImageView.image = model.image
    }
}
