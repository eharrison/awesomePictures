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
    func openPhoto()
}

class GalleryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: GalleryDelegate?
    
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
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath) as! GalleryCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)?.contentView.animateTouchDown({
            self.delegate?.openPhoto()
        })
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.startLoading()
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.updateProgress(1, animationTime: 5)
    }
    
}
