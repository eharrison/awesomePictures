//
//  GalleryTableViewCell.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit
import AwesomeLibrary

protocol GalleryDelegate {
    func openImage(image: FileObject)
}

class GalleryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: GalleryDelegate?
    var images = [FileObject]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - CollectionView Data Source

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        //cell.photoImageView.startProgressAnimation()
        //cell.photoImageView.updateProgress(0.5, animationTime: 1)
        cell.photoImageView.startLoadingAnimation()
        cell.photoImageView?.image = nil
        cell.setImage(images[indexPath.row].thumbnailUrl, placeholder: nil, imageViewName: "photoImageView", collectionView: collectionView, indexPath: indexPath, showLoading: true) { (image) in
            //cell.photoImageView.updateProgress(1, animationTime: 1)
            cell.photoImageView.stopLoadingAnimation()
        }
        
        cell.titleLabel.text = images[indexPath.row].title
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)?.contentView.animateTouchDown({
            self.delegate?.openImage(self.images[indexPath.row])
        })
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.startLoading()
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.updateProgress(1, animationTime: 5)
    }
    
}
