//
//  ExploreListView.swift
//  Podcast
//
//  Created by Sirak on 12/14/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct ExploreListView: View {
    var podcastModel : PodcastModel
    var body: some View {
        GeometryReader {
            geometry in
            
            ZStack {
                
                Image(self.podcastModel.imageUrl)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack(alignment : .leading) {
                                Text(self.podcastModel.title)
                                .lineLimit(1)
                                    .font(.system(size: 15, weight: .heavy, design: .default))
                               
                                    .foregroundColor(Color.white)
                                Text(self.podcastModel.owner.fullName)
                                    .lineLimit(1)
                                    .font(.system(size: 12, weight: .regular, design: .default))
                                    .foregroundColor(Color.white)
                            }
                           
                            Spacer()
                        }
                        .padding([.leading , .trailing , .bottom], 10)

                    }
                    .background(Color.black.opacity(0.5))
                }
            }
        }
        
    }
}

struct ExploreListView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreListView(podcastModel: .init(id: "1", title: "Joe Rogan Ep1", imageUrl: "Pod3", owner: UserModel(id: "", fullName: "Joe Jogan", username: "", email: "" , podcastAmount: 0) , type : "audio"))
            .previewLayout(.fixed(width: 190, height: 190))
    }
}
