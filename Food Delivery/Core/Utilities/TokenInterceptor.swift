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
    static let instance = TokenInterceptor()
    var retryCount: Int = 3 // Counter for retry attempts
    
    private init() {
        
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void)  {
        
        var localUrlRequest = urlRequest
        localUrlRequest.headers.add(.contentType("application/json"))
        localUrlRequest.headers.add(.accept("application/json"))
        if let accessToken = authService.tokenData?.accessToken {
            localUrlRequest.headers.add(.authorization(bearerToken: accessToken))
        }
        completion(.success(localUrlRequest))
    }
    
    func refreshTokenApi(data: [String : String]) async throws -> TokenData {
        do {
            var request = GenericRequest()
            request.method = .post
            request.parameters = data
            request.path = ApiConstants.REFRESH_URL
            request.encoding = JSONEncoding.default
            
            let result: ResponseToken = try await ApiRequest.request(request)
            return result.data
            
        } catch let error {
            throw error
        }
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard retryCount > 0 else {
            // No more retries allowed
            completion(.doNotRetry)
            return
        }
        
        // Decrement the retry count
        retryCount -= 1
        
        Task {
            if let response = request.task?.response as? HTTPURLResponse,
               let refreshToken = authService.tokenData?.refreshToken,
               response.statusCode == 401
            {
                do {
                    print("Error from interceptor: \(error)")
                    let newTokenData =  try await refreshTokenApi(data: ["refresh_token":refreshToken, "mode":"json"])
                    print("new token data: \(newTokenData)")
                    try authService.saveTokenData(tokenData: newTokenData)
                    completion(.retry)
                } catch {
                    completion(.doNotRetry)
                }
                
            } else {
                completion(.doNotRetry)
            }
        }
        
    }
    
    
}
