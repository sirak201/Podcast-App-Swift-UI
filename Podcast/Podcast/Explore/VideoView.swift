//
//  VideoView.swift
//  Podcast
//
//  Created by Sirak on 12/15/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    
   var podcastModel : PodcastModel

    var body: some View {
        
        GeometryReader {
            geometry in
        
            ZStack {
                
    
                Image(self.podcastModel.imageUrl)
                   .resizable()
                    .cornerRadius(12)
                   .aspectRatio(contentMode: .fill)
                   .frame(maxWidth : geometry.size.width , maxHeight: geometry.size.height )
                VStack {
                    HStack {
                        Text(self.podcastModel.title)
                             .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .bold))
                            
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.leading, .trailing])
                    .padding(.top , 5)
                    .background(Color.black.opacity(0.5))
                  
                    HStack {
                        Text(self.podcastModel.owner.fullName)
                            .foregroundColor(Color.white)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            Spacer()
                               }
                           .padding([.leading, .trailing])
                           .padding(.top , 5)
                           .background(Color.black.opacity(0.5))
                             Spacer()
                    }
                
                    Image(systemName: "play.circle")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 50, height: 50)
             
                
            }
            }
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(podcastModel: PodcastModel(id: "1", title: "Joe Rogan EP3", imageUrl: "Pod3", owner: UserModel(id: "", fullName: "Joe Jogan", username: "", email: "" , podcastAmount: 0), type: "video"))
            .previewLayout(.fixed(width: 380, height: 190))
    }
}
