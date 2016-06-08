//
//  CustomNavigationController.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/7/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
