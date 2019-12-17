//
//  ExploreView.swift
//  Podcast
//
//  Created by Sirak on 12/14/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct ExploreView: View {
    

    
    
    @ObservedObject var explore = Explore()
    @State var isActive = false


    var body: some View {

        NavigationView {

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
                }.padding([.leading , .trailing] , 15)
                    .padding(.bottom , 30)
                     .padding(.top , -30)
                
                HStack {
                    Text("New Podcast")
                        .font(.body)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                }.padding(.leading , 15)
                        
                ScrollView(.horizontal, showsIndicators: false) {
                   
                    HStack(spacing : 20) {
                        ForEach(explore.exploreListModels) { pod in
                            GeometryReader {geometer in
                                NavigationLink(destination: PlayPodcast(podcast: pod), isActive: self.$isActive) {
                                    ExploreListView(podcastModel: pod)
                                        .rotation3DEffect(.degrees(Double(geometer.frame(in : .global).minX) / -10) , axis : (x : 0 , y : 10.0 , z: 0))
                                }
                            }
                            .frame(width: 190,height: 190)
                            
                            
                            }
                    }
                }
                  HStack {
                          Text("Pocast Videos")
                            .font(.system(size: 20))
                              .fontWeight(.heavy)
                              .foregroundColor(Color.white)
                          Spacer()
                }.padding([.leading] , 15)
                if explore.exploreVideoModels.first != nil {
                    VideoView(podcastModel: explore.exploreVideoModels.first!)
                        .clipped()
                        .shadow(radius: 12)
                   
                        .frame(width: 380, height: 190)
                }
            }
            
        }
        
        }.onAppear(perform: {
            self.explore.getNewPodcast()
            self.explore.getVideoPodcasts()
        })
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    

    static var previews: some View {
        ExploreView()
    }
}
