//
//  ContentView.swift
//  Podcast
//
//  Created by Sirak on 12/11/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

//rgb(227,0,152) pink
//rgb(14,11,32) purple


struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.0536696743, green: 0.04404159331, blue: 0.1236245599, alpha: 1)
        
    }


    
    var body: some View {
        
       
        ZStack {
            Rectangle().foregroundColor(Color(#colorLiteral(red: 0.0536696743, green: 0.04404159331, blue: 0.1236245599, alpha: 1))).edgesIgnoringSafeArea(.all)
            TabView {
                 HomeView()
                     .tabItem {
                         Image(systemName: "house.fill")
                             
                         Text("Home")
                     }.tag(0)
             
            

                ExploreView(explore: .init())
                     .tabItem {
                         Image(systemName: "mappin.and.ellipse")
                         Text("Explore")
                     }.tag(1)
                 RecordView()
                     .tabItem {
                         Image(systemName: "music.mic")
                         Text("Record")
                     }.tag(2)
                 RecordView()
                          .tabItem {
                              Image(systemName: "person.fill")
                              Text("Account")
                          }.tag(3)
             }
            .accentColor(Color.init(red: 227, green: 0, blue: 152))
            
        }


      
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
