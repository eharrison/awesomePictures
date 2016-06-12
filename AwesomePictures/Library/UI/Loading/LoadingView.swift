//
//  LoadingView.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var ball1View: UIView!
    @IBOutlet weak var ball2View: UIView!
    @IBOutlet weak var ball3View: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var animating = false
    var maxScale: CGFloat = 1.0

    static func newFromNib() -> LoadingView{
        return NSBundle(forClass: self).loadNibNamed("LoadingView", owner: self, options: nil)[0] as! LoadingView
    }
    
    override func awakeFromNib() {
        self.hidden = true
        
        ball1View.layer.cornerRadius = ball1View.frame.size.width/2
        ball2View.layer.cornerRadius = ball2View.frame.size.width/2
        ball3View.layer.cornerRadius = ball3View.frame.size.width/2
    }
    
    //MARK: - Animations
    
    func show(){
        animating = true
        
        if self.frame.size.width < self.animationView.frame.size.width*1.2 {
            maxScale = self.frame.size.width/(self.animationView.frame.size.width*1.2)
        }
        
        self.hidden = false
        self.alpha = 0
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1
        }) { (Bool) in
            
        }
        
        self.animationView.alpha = 0
        self.animationView.transform = CGAffineTransformMakeScale(self.maxScale*0.1, self.maxScale*0.1)
        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
            self.animationView.alpha = 1
            self.animationView.transform = CGAffineTransformMakeScale(self.maxScale*1.1, self.maxScale*1.1)
            }) { (Bool) in
            UIView.animateWithDuration(0.1, animations: { 
                self.animationView.transform = CGAffineTransformMakeScale(self.maxScale*1, self.maxScale*1)
            })
        }
        
        makeBouncingAnimation(self.ball1View, duration: 0.8, delay: 0.2, options: .CurveEaseIn)
        makeBouncingAnimation(self.ball2View, duration: 0.7, delay: 0.3, options: .CurveEaseIn)
        makeBouncingAnimation(self.ball3View, duration: 0.6, delay: 0.4, options: .CurveEaseIn)
    }
    
    func hide(){
        animating = false
        
        UIView.animateWithDuration(0.1, animations: {
            self.animationView.transform = CGAffineTransformMakeScale(self.maxScale*0.9, self.maxScale*0.9)
        }) { (Bool) in
            UIView.animateWithDuration(0.2, animations: {
                self.transform = CGAffineTransformMakeScale(self.maxScale*1.2, self.maxScale*1.2)
                self.alpha = 0
            }) { (Bool) in
                self.removeFromSuperview()
            }
        }
    }
    
    func makeBouncingAnimation(view: UIView, duration: Double, delay: Double, options: UIViewAnimationOptions){
        let initialY = view.center.y
        
        UIView.animateWithDuration(duration*0.5, delay: delay, options: options, animations: {
            view.center = CGPointMake(view.center.x, view.frame.size.height/2)
        }) { (Bool) in
            UIView.animateWithDuration(duration*0.5, delay: 0, options: options, animations: {
                view.center = CGPointMake(view.center.x, initialY)
            }) { (Bool) in
                if self.animating {
                    self.makeBouncingAnimation(view, duration: duration, delay: delay, options: .CurveLinear)
                } else {
                    self.makeBouncingAnimation(view, duration: duration, delay: delay, options: .CurveEaseOut)
                }
            }
        }
    }
}
