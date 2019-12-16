//
//  UserModel.swift
//  Podcast
//
//  Created by Sirak on 12/15/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation

struct UserModel : Identifiable , Decodable {
    var id : String
    var fullName : String
    var username : String
    var email : String
    var podcastAmount : Int
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case fullName = "fullName"
        case username = "username"
        case email = "email"
        case podcastAmount = "podcastAmount"
    }
    
    
}
