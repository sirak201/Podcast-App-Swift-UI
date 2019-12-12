//
//  SignIn.swift
//  Podcast
//
//  Created by Sirak on 12/11/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI
import Alamofire

struct SignIn: View {
    @State var email : String = ""
    @State var password : String = ""

    var body: some View {
        
        GeometryReader { geomtry in
            
            ZStack(alignment : .topLeading){
                Image("podcast_SigniUp")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black.opacity(0.55))
                
                
                VStack(alignment: .leading , spacing: 0) {
                    Text("SIGN IN")
                           .foregroundColor(Color.white)
                           .font(.largeTitle)
                           .fontWeight(.heavy)
                           .padding(.bottom , 30)
                    
                    SignInForm(email: self.$email , password: self.$password)
                    
                    Button(action: {}) {
                        Spacer()
                        Text("Forgot Password")
                            .foregroundColor(Color.gray)
                            .padding([.trailing , .leading] , 30)
                            .padding(.top , 10 )
                        
                    }
                    
                    Button(action: self.signin) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                    .frame(height: 50)
                                .foregroundColor(Color(red: 227, green: 0, blue: 152))
                                
                            Text("Sign In")
                               .foregroundColor(Color.white)
                        }
                    }
                    .padding(.top , 50 )

                    
                  
                    
            }
                .padding([.leading] , geomtry.size.width * 0.24)
                .padding([.top] , geomtry.size.height * 0.09)
                .padding(.trailing , geomtry.size.height * 0.09)
            
        }

    }
    }
    
    
    func signin () {
        
        
    }
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}


struct SignInForm  : View{
     @Binding var email : String
     @Binding var password : String
    var body: some View {
        
        VStack {
            ZStack {
                  Rectangle()
                      .foregroundColor(Color.clear)
                      .frame(height: 60)
                  HStack(spacing : 15) {
                     Image(systemName: "envelope.fill")
                          .foregroundColor(Color.gray)
                      
                      CustomTextField(placeholder:
                            Text("Email")           .foregroundColor(Color.gray),
                                text: self.$email
                             )
                           .foregroundColor(Color.white)
                      
                  }
              }
              Rectangle()
                  .frame(height: 1)
                  .foregroundColor(Color.white)
                  .padding([.trailing , .leading] , 10)
              
              ZStack {
                     Rectangle()
                         .foregroundColor(Color.clear)
                         .frame(height: 60)
                     HStack(spacing : 15) {
                        Image(systemName: "lock.fill")
                             .foregroundColor(Color.gray)
                         
                         CustomTextField(placeholder:
                               Text("Password")           .foregroundColor(Color.gray),
                                   text: self.$password
                                )
                              .foregroundColor(Color.white)
                         
                     }
              }
              .padding(.top , 10)
                 Rectangle()
                     .frame(height: 1)
                     .foregroundColor(Color.white)
                     .padding([.trailing , .leading] , 10)
          
                 
          }
    }
        
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
