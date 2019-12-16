//
//  VideoView.swift
//  Podcast
//
//  Created by Sirak on 12/15/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        GeometryReader {
            geometry in
        
            ZStack {
    
               Image("Pod3")
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(maxWidth : geometry.size.width , maxHeight: geometry.size.height )
                VStack {
                    HStack {
                        Text("Hello")
                             .foregroundColor(Color.white)
                             .font(.headline)
                             .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                      Spacer()
                    }
                }
            }
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
            .previewLayout(.fixed(width: 380, height: 190))
    }
}
