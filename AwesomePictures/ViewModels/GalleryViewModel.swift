//
//  GalleryViewModel.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit
import AwesomeLibrary

class GalleryViewModel: NSObject {
    
    var instagramPictures = [FileObject]()
    var unsplashPictures = [FileObject]()
    
    func fetchUnsplashPictures(completion:(success: Bool) -> Void){
        AAPIFetcher.fetchData(unsplashListPicturesUrl, timeOut: timeOut) { (success, data) in
            if success {
                if let data = data {
                    self.unsplashPictures = AAPIParser.unsplashToFileObjects(AAPIParser.unsplashPictures(data))
                }
            }
            
            completion(success: success)
        }
    }
        
}
