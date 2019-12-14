//
//  ExploreView.swift
//  Podcast
//
//  Created by Sirak on 12/14/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct ExploreView: View {
    
    let pod = [ PodcastModel(id: "1", name: "Life Adventures", imageUrl: "Pod2", owner: "Briliant Idiots") , PodcastModel(id: "2", name: "Pray For You", imageUrl: "Pod1", owner: "Emily Rose") ,  PodcastModel(id: "3", name: "Joe Rogan EP20", imageUrl: "Pod3", owner: "Joe Rogan")]

    var body: some View {

        ZStack(alignment : .topLeading) {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(#colorLiteral(red: 0.0536696743, green: 0.04404159331, blue: 0.1236245599, alpha: 1)))
            
            ScrollView(.vertical , showsIndicators: false) {
                
                HStack {
                    Text("Explore")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                    Button(action : {}) {
                        
                       
                            Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 20, height: 20)
                        
                    }
                }.padding([.leading , .top , .trailing] , 15)
                    .padding(.bottom , 30)
                
                HStack {
                    Text("New Podcast")
                        .font(.body)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                }.padding(.leading , 15)
                        
                ScrollView(.horizontal, showsIndicators: false) {
                   
                    HStack(spacing : 20) {
                        ForEach(pod) { pod in
                            GeometryReader {_ in
                                ExploreListView(podcastModel: pod)
                            }
                            .frame(width: 190,height: 190)
                            
                            
                            }
                    }
                }
                
            }
            
        }
        
        

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}