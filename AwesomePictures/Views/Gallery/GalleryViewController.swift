//
//  GalleryViewController.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit
import AwesomeLibrary

class GalleryViewController: UITableViewController, GalleryDelegate {

    var galleryViewModel = GalleryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AAPIParser.propertyNames(galleryViewModel))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        view.startLoadingAnimation()
        galleryViewModel.fetchUnsplashPictures { (success) in
            self.view.stopLoadingAnimation()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsViewController = segue.destinationViewController as? DetailsViewController {
            detailsViewController.detailsViewModel.image = sender as? FileObject
        }
    }
    
    // MARK: - TableView Data Source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("instagram", forIndexPath: indexPath) as! GalleryTableViewCell
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("unsplash", forIndexPath: indexPath) as! GalleryTableViewCell
            cell.delegate = self
            cell.images = galleryViewModel.unsplashPictures
            return cell
        }
    }
    
    // MARK: - Gallery Delegate
    
    func openImage(image: FileObject) {
        self.performSegueWithIdentifier("detailsSegue", sender: image)
    }

}
