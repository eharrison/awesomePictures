//
//  UIView+Loading.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Progress
    
    func startProgressAnimation(){
        stopProgressAnimation()
        
        let loadingView = ProgressView.newFromNib()
        loadingView.frame = self.bounds
        self.addSubview(loadingView)
        loadingView.show()
    }
    
    func stopProgressAnimation(){
        for subview in subviews{
            if let subview = subview as? ProgressView {
                subview.hide()
                break
            }
        }
    }
    
    func updateProgress(progress: CGFloat, animationTime: Double){
        for subview in subviews{
            if let subview = subview as? ProgressView {
                subview.updateProgressBar(progress, animationTime: animationTime)
                break
            }
        }
    }
    
    // MARK: - Loading    
    
    func startLoadingAnimation(){
        startLoadingAnimation("")
    }
    
    func startLoadingAnimation(message: String){
        stopLoadingAnimation()
        
        let loadingView = LoadingView.newFromNib()
        loadingView.messageLabel.text = message
        loadingView.frame = self.bounds
        self.addSubview(loadingView)
        loadingView.show()
    }
    
    func stopLoadingAnimation(){
        for subview in subviews{
            if let subview = subview as? LoadingView {
                subview.hide()
            }
        }
    }
    
}