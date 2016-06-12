//
//  Constants.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 6/11/16.
//  Copyright © 2016 MindValley. All rights reserved.
//

import Foundation

let timeOut: Double = 10

//Instagram
let instagram_client_key = "e9c54bf39b2c495e801c25fa6b4bf947"
let instagram_client_secret = "6876e40230b4402c89da510a92b4a454"
let instagram_callback_url = NSURL(string:"http://itsdayoff.com")
let instagram_permissions_scope = ["basic", "comments", "relationships", "likes", "public_content"]

let instagramAccessTokenUrl = "https://api.instagram.com/oauth/authorize/?client_id=\(instagram_client_key)&redirect_uri=\(instagram_callback_url)&response_type=code"
let instagramMainUrl = "https://api.instagram.com/v1/"
let instagramSelfInfoUrl = "users/self/"
let instagramSelfPicturesUrl = "users/self/media/recent/"
let instagramUserPicturesUrl = "users/%@/media/recent/"

//Unsplash
let unsplashListPicturesUrl = "https://unsplash.it/list"