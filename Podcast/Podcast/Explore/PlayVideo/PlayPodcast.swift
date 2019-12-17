//
//  PlayPodcast.swift
//  Podcast
//
//  Created by Sirak on 12/16/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct PlayPodcast: View {
    var podcast : PodcastModel
    @State var startAnimating = false
    var body: some View {
        GeometryReader {
                geometry in
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color.init(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Image("Pod3")
                        .renderingMode(Image.TemplateRenderingMode?.init(Image  .TemplateRenderingMode.original))
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 250, height: 250)
                            .rotationEffect(.degrees(self.startAnimating ? 0 : 360))
                            .animation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false))
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                    }
                    Text(self.podcast.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Text(self.podcast.owner.fullName)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                    HStack {
                         Spacer()
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 20, height: 25)
                            .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "list.bullet")
                                       .resizable()
                                       .frame(width: 20, height: 20)
                                       .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "heart")
                                      .resizable()
                                      .frame(width: 20, height: 20)
                                      .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "square.and.arrow.down")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.white)
                        Spacer()
                    }.padding(.top , 40)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.white)
                        .frame(height: 2)
                        .padding()
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                           .foregroundColor(Color.pink)
                                           .frame(height: 2)
                                            .padding(.trailing , 100)
                                            .padding(.leading)
                                )
                    HStack {
                        Text("2.40")
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("5.40")
                            .foregroundColor(Color.white)
                    }.padding([.trailing , .leading])
                    
                    HStack {
                        Image(systemName: "shuffle")
                                          .resizable()
                                          .frame(width: 25, height: 25)
                                          .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "arrow.right.to.line.alt")
                                         .resizable()
                                         .frame(width: 20, height: 20)
                                         .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "play.circle.fill")
                                         .resizable()
                                         .frame(width: 80, height: 80)
                                         .foregroundColor(Color.init(red: 227, green: 0, blue: 152))
                                         .shadow(color: Color.pink.opacity(0.8), radius: 10,  y: 5)
                         Spacer()
                        Image(systemName: "arrow.left.to.line.alt")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.white)
                         Spacer()
                        Image(systemName: "repeat.1")
                                       .resizable()
                                       .frame(width: 25, height: 25)
                                       .foregroundColor(Color.white)
                                        
                         
                           
                    }
                    .padding([.leading , .trailing , .top] , 20)
                    .padding(.top , 30)

                }
            }
            .onAppear(perform: {
                self.startAnimating = true
            })
            
        }
    }
}

struct PlayPodcast_Previews: PreviewProvider {
    static var previews: some View {
        PlayPodcast(podcast: .init(id: "1", title: "Joe Rogan Ep1", imageUrl: "Pod3", owner: UserModel(id: "", fullName: "Joe Rogan", username: "", email: "" , podcastAmount: 0) , type : "audio"))
    }
}
