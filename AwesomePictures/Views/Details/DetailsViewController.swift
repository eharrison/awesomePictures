//
//  DetailsViewController.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var photoDoubleTapGesture: UITapGestureRecognizer!
    
    var detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = detailsViewModel.image {
            //photoImageView.startProgressAnimation()
            //photoImageView.updateProgress(0.5, animationTime: 1)
            photoImageView.image = nil
            photoImageView.setImage(image.thumbnailUrl, placeholder: nil, showLoading: true) { (image) in
                //self.photoImageView.updateProgress(1, animationTime: 1)
            }
        }
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    // MARK: - Animations
    
    func animateIn(){
        self.photoImageView.hidden = false
        self.photoImageView.alpha = 0
        
        UIView.animateWithDuration(0.2, animations: {
            self.photoImageView.alpha = 1
        }) { (Bool) in
            
        }
        
        self.photoImageView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        self.photoImageView.transform = CGAffineTransformRotate(self.photoImageView.transform, CGFloat(M_PI_2*0.2))
        UIView.animateWithDuration(0.3, animations: {
            self.photoImageView.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2*0.15))
        }) { (Bool) in
            UIView.animateWithDuration(0.2, animations: {
                self.photoImageView.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2*0))
            }) { (Bool) in
                
            }
        }
    }

    // MARK: - Actions

    @IBAction func didDoubleTapOnPhotoImageView(sender: AnyObject) {
        if self.scrollView.zoomScale > 1 {
            self.scrollView.setZoomScale(1, animated: true)
        }else{
            self.scrollView.setZoomScale(3, animated: true)
        }
    }
    
    // MARK: - ScrollView Delegate
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
}
