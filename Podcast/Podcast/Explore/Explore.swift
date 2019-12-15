//
//  Explore.swift
//  Podcast
//
//  Created by Sirak on 12/14/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation
import Alamofire
import Combine



class Explore  : ObservableObject {
    
     @Published var exploreListModels = [PodcastModel(id: "1", title: "", imageUrl: "Pod1", owner: "")]
    
    
    public func getNewPodcast() {
            let url = "http://localhost:3000/api/podcast"
        
            Alamofire.request(url, method: .get)
                            .validate(statusCode: 200...300)
                            .responseData { (dataResponse) in
                    do {
                        self.exploreListModels = try JSONDecoder().decode([PodcastModel].self, from: dataResponse.data!)
                        } catch {
                        print(error)
                    }
            
            }
        
    }
    
    
    init() {
        
    }
 
    
    
    
    
}
