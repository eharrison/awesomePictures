//
//  LoadingView.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit
import AwesomeLibrary

class ProgressView: UIView {

    @IBOutlet weak var progressBackgroundView: DesignableView!
    @IBOutlet weak var progressView: DesignableView!

    static func newFromNib() -> ProgressView{
        return NSBundle(forClass: self).loadNibNamed("ProgressView", owner: self, options: nil)[0] as! ProgressView
    }
    
    override func awakeFromNib() {
        updateProgressBar(0, animationTime: 0)
        self.hidden = true
    }
    
    //MARK: - Progress
    
    var currentProgress: CGFloat = 0
    var progressAnimationTime: Double = 0
    var previewsProgress: CGFloat = 0
    
    func updateProgressBar(progress: CGFloat, animationTime: Double){
        if progress == 0 {
            currentProgress = progress
            progressView.hidden = true
            return
        }
        
        //process the progress in the timer, so we have time to layout the view (otherwise it won't work when resizing)
        progressAnimationTime = animationTime
        currentProgress = progress
        progressView.hidden = false
        NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: #selector(ProgressView.updateProgressBar as (ProgressView) -> () -> ()), userInfo: nil, repeats: false)
    }
    
    func updateProgressBar(){
        progressView.hidden = false
        //progressView.translatesAutoresizingMaskIntoConstraints = true
        progressView.frame = CGRectMake(0, progressView.frame.origin.y, progressBackgroundView.frame.size.width*previewsProgress, progressView.frame.size.height)
        previewsProgress = currentProgress
        
        UIView.animateWithDuration(progressAnimationTime, delay: 0, options: .CurveEaseIn, animations: { 
            self.progressView.frame = CGRectMake(0, self.progressView.frame.origin.y, self.progressBackgroundView.frame.size.width*self.currentProgress, self.progressView.frame.size.height)
            }) { (Bool) in
                if(self.currentProgress == 1){
                    self.hide()
                }
        }
    }
    
    //MARK: - Animations
    
    func show(){
        self.hidden = false
        self.alpha = 0
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1
            }) { (Bool) in
            
        }
        
        self.progressBackgroundView.alpha = 0
        self.progressBackgroundView.transform = CGAffineTransformMakeScale(1, 0.1)
        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
            self.progressBackgroundView.alpha = 1
            self.progressBackgroundView.transform = CGAffineTransformMakeScale(1.1, 1.1)
            }) { (Bool) in
            UIView.animateWithDuration(0.1, animations: { 
                self.progressBackgroundView.transform = CGAffineTransformMakeScale(1, 1)
            })
        }
    }
    
    func hide(){
        UIView.animateWithDuration(0.2, animations: {
            self.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.alpha = 0
            }) { (Bool) in
            self.removeFromSuperview()
        }
    }
}
