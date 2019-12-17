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
    
    @Published var exploreListModels = [PodcastModel(id: "1", title: "Joe Rogan EP3", imageUrl: "Pod3", owner: UserModel(id: "2", fullName: "Joe Rogan", username: "joerogan", email: "joerogan123", podcastAmount: 0), type : "audio")]
    
    @Published var exploreVideoModels = [PodcastModel(id: "1", title: "Joe Rogan EP3", imageUrl: "Pod3", owner: UserModel(id: "2", fullName: "Joe Rogan", username: "joerogan", email: "joerogan123", podcastAmount: 0), type : "video")]
    
    
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
    
    public func getVideoPodcasts() {
            let url = "http://localhost:3000/api/podcast/video"
                Alamofire.request(url, method: .get)
                            .validate(statusCode: 200...300)
                            .responseData { (dataResponse) in
                    do {
                        self.exploreVideoModels = try JSONDecoder().decode([PodcastModel].self, from: dataResponse.data!)
                        
                        } catch {
                        print(error)
                    }
            
            }
        
    }
    
    
    init() {
        
    }
 
    
    
    
    
}
