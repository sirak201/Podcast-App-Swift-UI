//
//  SignIn.swift
//  Podcast
//
//  Created by Sirak on 12/12/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation
import Alamofire


struct JWTToken: Decodable   {

    let authToken: String

    enum CodingKeys: String, CodingKey {
          case authToken = "auth_token"
    }
}



class SignIn {
    
    private var signInModel : SignInModel
    
    
    func signInRequest (completionHandler: @escaping (Result<JWTToken>) -> Void) {
        let url = "http://localhost:3000/api/login"
        let params = ["email": signInModel.email,  "password": signInModel.password]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                        .validate(statusCode: 200...300)
                        .responseData { (dataResponse) in
                            
                
                if (dataResponse.error != nil) {
                    completionHandler(.failure(dataResponse.error!))
                    print(dataResponse.error!)
                    return
                }
            
                do {
                    let userJwt = try JSONDecoder().decode(JWTToken.self, from: dataResponse.data!)
                    completionHandler(.success(userJwt))
                } catch {
                    print(error)
                    completionHandler(.failure(error))
                }

               }
           }
    
    
  init(signInModel : SignInModel) {
        self.signInModel = signInModel
    }
    
    
}
