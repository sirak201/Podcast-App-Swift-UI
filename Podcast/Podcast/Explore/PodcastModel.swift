//
//  PodcastModel.swift
//  Podcast
//
//  Created by Sirak on 12/14/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation

struct PodcastModel : Identifiable , Decodable  {
    var id : String
    var title : String
    var imageUrl : String
    var owner : String
    
    enum CodingKeys: String, CodingKey {
             case id = "_id"
             case title = "podcastName"
             case imageUrl = "imageUrl"
             case owner = "owner"
       }
}
