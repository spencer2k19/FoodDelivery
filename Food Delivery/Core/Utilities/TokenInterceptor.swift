//
//  MyInterceptor.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 18/10/2023.
//

import Foundation
import Alamofire

class TokenInterceptor: RequestInterceptor {
    let authService = AuthService.instance
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void)  {
        
        var localUrlRequest = urlRequest
        localUrlRequest.headers.add(.contentType("application/json"))
        localUrlRequest.headers.add(.accept("application/json"))
        if let accessToken = authService.tokenData?.accessToken {
            localUrlRequest.headers.add(.authorization(bearerToken: accessToken))
        }
        completion(.success(localUrlRequest))
    }
    
   
}
