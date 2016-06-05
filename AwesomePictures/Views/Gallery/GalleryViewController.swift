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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let detailsViewController = segue.destinationViewController as? DetailsViewController{
//            detailsViewController.galleryViewModel = sender as? GalleryViewModel
//        }
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
            return cell
        }
    }
    
    // MARK: - Gallery Delegate
    
    func openPhoto() {
        self.performSegueWithIdentifier("detailsSegue", sender: self)
    }

}
