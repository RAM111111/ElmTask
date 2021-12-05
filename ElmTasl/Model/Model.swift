//
//  Model.swift
//  ElmTasl
//
//  Created by R on 29/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//


import Foundation

struct Links1:Decodable {

    let `self`: String
    let photos:String
}

struct Categories: Decodable{
        let id: Int
        let title: String
        let photo_count: Int
        let links:Links1
}

struct Urls : Decodable{
      let raw:String
      let full:String
      let regular:String
      let small:String
      let thumb:String
}

struct CurrentUserCollections: Decodable {
    
}

struct Links: Decodable {
    let `self`:String
      let html: String
      let photos: String
      let likes: String
    }


struct ProfileImage: Decodable {
     let small:String
    let medium:String
      let large:String
}

struct User: Decodable {
      let id: String
     let username: String
      let name: String
    let profile_image:ProfileImage
    let links:Links
}

struct Links2: Decodable {
      let `self`:String
      let html: String
      let download: String
}

struct Api: Decodable {
    let id: String
    let created_at: String
    let width: Int
    let height: Int
    let color: String
    let likes: Int
    let liked_by_user:Bool
    let user:User
    let current_user_collections:[CurrentUserCollections]
    let urls:Urls
    let categories:[Categories]
    let links:Links2
}
