//
//  BaseRequest.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    
    case badRequest(message: String)
    case decodingError
    case unauthorized(message: String)
    case tokenExpired(message: String)
    case errorConnection
    
    
    var localizedDescription: String {
        switch self {
        case .badRequest(let message),
                .unauthorized(let message), .tokenExpired(let message):
            return message
        case .decodingError:
            return "Decoding error"
        case .errorConnection:
            return "Connection error"
        }
    }
    
}


struct GenericRequest {
    var method: Alamofire.HTTPMethod
    var path: URLConvertible
    var parameters: [String: Any]?
    var encoding: ParameterEncoding
    var headers: HTTPHeaders?
    
    init() {
        method = .get
        path = ""
        parameters = nil
        encoding = JSONEncoding() as ParameterEncoding
        headers = ["Content-Type": "application/json",
                   "Accept": "application/json"
        ]
    }
}



class ApiRequest {
    
    private static func mapDataToGeneralError(data: Data?) -> String {
        guard let serverData = data else {
            return ""
        }
        guard let generalError = try? JSONDecoder().decode(GeneralError.self, from: serverData), !generalError.errors.isEmpty else {
            return ""
        }
        print("General Error: \(generalError)")
        return generalError.errors[0].message
        
    }
    
    
    static func download(path: URLConvertible) async throws -> Data {
        do {
            return try await AF.download(path).serializingData().value
            
        } catch let error  {
            throw error
        }
    }
    
    
    static func request<T : Decodable>(_ genericRequest: GenericRequest) async throws -> T {
        do {
            let dataTask = AF.request(genericRequest.path,method: genericRequest.method, parameters: genericRequest.parameters,
                                      encoding: genericRequest.encoding,
                                      interceptor: TokenInterceptor.instance
            ).validate()
                .serializingDecodable(T.self)
            
            let response = await dataTask.response
            
            let statusCode = response.response?.statusCode
            switch response.result {
            case .success(let data):
                return data
            case .failure(let error):
                print("Failure occured: \(error)")
                if statusCode == 400 {
                    throw APIError.badRequest(message: ApiRequest.mapDataToGeneralError(data: response.data))
                } else if statusCode == 401 && AuthService.instance.tokenData != nil {
                    throw APIError.tokenExpired(message: ApiRequest.mapDataToGeneralError(data: response.data))
                }  else if statusCode == 401 {
                    throw APIError.unauthorized(message: ApiRequest.mapDataToGeneralError(data: response.data))
                } else if statusCode == 403 {
                    throw APIError.badRequest(message: ApiRequest.mapDataToGeneralError(data: response.data))
                }  else {
                    throw APIError.errorConnection
                }
                
            }
            
            
            
        } catch let error {
            throw error
        }
    }
}
