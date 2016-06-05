//
//  UIView+Loading.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit

extension UIView {
    
    func startLoading(){
        stopLoading()
        
        let loadingView = LoadingView.loadingView()
        loadingView.frame = self.bounds
        self.addSubview(loadingView)
        loadingView.show()
    }
    
    func stopLoading(){
        for subview in subviews{
            if let subview = subview as? LoadingView {
                subview.hide()
                break
            }
        }
    }
    
    func updateProgress(progress: CGFloat, animationTime: Double){
        for subview in subviews{
            if let subview = subview as? LoadingView {
                subview.updateProgressBar(progress, animationTime: animationTime)
                break
            }
        }
    }
    
}