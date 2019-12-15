//
//  SignIn.swift
//  Podcast
//
//  Created by Sirak on 12/11/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var animate = false
    @State private var errorIsShowing = false
    @State private var errorMessage = ""
    @State var pushActive = false
    @ObservedObject var startAnimation = AnimationListen()


    var body: some View {
        
        GeometryReader { geomtry in
            
            ZStack(alignment : .topLeading){
                Image("podcast_SigniUp")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geomtry.size.width,
                           maxHeight: geomtry.size.height)
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black.opacity(0.55))
                   
                Text(self.errorMessage)
                            .foregroundColor(Color.white)
                            .frame(width: geomtry.size.width)
                            .background(self.errorIsShowing ? Color.red : Color.clear)
                            .padding(.top , -4)
        
                 
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
                                HStack(){
                                    if self.animate {
                                        ProgressCircle(startAnimation: self.startAnimation)
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(Color.white)
                                            .padding(.leading , 10)
                                    }
                                            
                                    Spacer()
                                    Text("Sign In")
                                        .foregroundColor(Color.white)
                                    
                                     if self.animate {
                                         Spacer()
                                    }
                                    Spacer()
                                }
                              
                            }
                        }
                        .sheet(isPresented: self.$pushActive) {
                            ContentView()
                        }
                            .padding(.top , 50 )
                            
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {}) {
                                    Text("Don't have an account")
                                    .foregroundColor(Color.gray)
                                    Text("Sign Up")
                                   .foregroundColor(Color(red: 227, green: 0, blue: 152))
                     
                                }
                                Spacer()
                            }
                    }
                        .padding([.leading] , geomtry.size.width * 0.1)
                        .padding([.top] , geomtry.size.height * 0.09)
                        .padding(.trailing , 20)
            }
        }
    }
    
    
    
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension SignInView {
    // MARK: - Functions
    
    func signin () {
        
        animate.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.startAnimation.startAnimation.toggle()

        }
        let signInModel = SignInModel(email: email, password: password)
        let signIn = SignIn(signInModel: signInModel)
        signIn.signInRequest { (res) in
            switch res {
                case .success(_):
                    self.animate.toggle()
                    self.errorIsShowing = false
                    self.errorMessage = ""
                    self.pushActive.toggle()

                       

                case .failure(let err ):
                    self.animate.toggle()
                    self.errorMessage = err.localizedDescription
                    self.errorIsShowing = true
                
            }
        }
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
                            Text("Email")
                                .foregroundColor(Color.gray),
                                text: self.$email
                             )
                           .foregroundColor(Color.white)
                      
                  }
              }
              Rectangle()
                  .frame(height: 1)
                  .foregroundColor(Color.white)
                  .padding([.trailing ] , 10)
              
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
                     .padding([.trailing] , 10)
          
                 
          }
    }
        
}






 
    
    

