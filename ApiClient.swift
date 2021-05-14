//
//  ApiClient.swift
//  task5MADtry2
//
//  Created by KriDan on 13.05.2021.
//

import Foundation
import Alamofire

//"id": "",
//"email": "",
//"nickName": “”,
//"avatar": “",
//"token": ""

struct SignInRequest: Encodable {
    var email: String
    var password: String
}

struct SignInResponse: Decodable {
    var id: String? = nil
    var email: String? = nil
    var nickName: String? = nil
    var avatar: String? = nil
    var token: String? = nil
}

struct Data: Decodable {
    var id: Int? = nil
    var title: String? = nil
    var image: String? = nil
    var position: Int? = nil
}
//saasa
struct FeelingsResponse: Decodable {
    var success: Bool? = nil
    var data: [Data]? = nil
}

struct anime: Decodable {}

class ApiClient {

    static let baseURL = "http://mskko2021.mad.hakta.pro/api/"
    
    func signIn(parameters: SignInRequest, onSuccess: @escaping (SignInResponse) -> Void){
        let headers = HTTPHeaders(["Content-Type" : "application/json"])
        AF.request(ApiClient.baseURL + "user/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response {response in
            switch response.result {
            
            case .success(let data):
                guard let safeData = data else {return}
                onSuccess(try! JSONDecoder().decode(SignInResponse.self, from: safeData))
            case .failure(let data):
                print("Error: \(data.errorDescription ?? "Unknown")")
            }
        }
        
    }
    
    func getFeelings(onSuccess: @escaping (FeelingsResponse) -> Void){
        AF.request(ApiClient.baseURL + "/feelings", method: .get).response {response in
            switch response.result {
            
            case .success(let data):
                guard let safeData = data else {return}
                onSuccess(try! JSONDecoder().decode(FeelingsResponse.self, from: safeData))
            case .failure(let data):
                print("Error: \(data.errorDescription ?? "Unknown")")
            }
        }
        
    }
    
}
