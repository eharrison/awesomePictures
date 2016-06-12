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
    
    let itemSpacing: CGFloat = 15
    
    var delegate: GalleryDelegate?
    var images = [FileObject]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //makes sure cells are going to be auto centered
        let collectionViewLayout: CenterCellCollectionViewFlowLayout = CenterCellCollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: itemSpacing, bottom: 0, right: itemSpacing)
        collectionViewLayout.minimumInteritemSpacing = itemSpacing
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView.collectionViewLayout = collectionViewLayout
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)?.contentView.animateTouchDown({
            self.delegate?.openImage(self.images[indexPath.row])
        })
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.startLoading()
        //collectionView.cellForItemAtIndexPath(indexPath)?.contentView.updateProgress(1, animationTime: 5)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if images[indexPath.row].isSquare() {
            return CGSizeMake(collectionView.frame.size.height, collectionView.frame.size.height)
        }else {
            var aspectSize = CGSizeMake((collectionView.frame.size.height*CGFloat(images[indexPath.row].width!))/CGFloat(images[indexPath.row].height!), collectionView.frame.size.height)
            if aspectSize.width > collectionView.frame.size.width - itemSpacing*2 {
                aspectSize.width = collectionView.frame.size.width - itemSpacing*2
            }
            
            return aspectSize
        }
    }
}
