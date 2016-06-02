//
//  GalleryCollectionViewCell.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit
import AwesomeLibrary

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: DesignableImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        photoImageView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        photoImageView.layer.shadowOffset = CGSizeMake(2, 2)
        photoImageView.layer.shadowOpacity = 1
        photoImageView.layer.shadowRadius = 3.0
    }
    
}
