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
    var id: String
    var email: String
    var nickName: String
    var avatar: String
    var token: String
}

class ApiClient {

    static let baseURL = "mskko2021.mad.hakta.pro/api/"
    
    func signIn(parameters: SignInRequest, onSuccess: @escaping (SignInResponse) -> Void){
        let headers = HTTPHeaders(["Content-Type" : "application/json"])
        AF.request(ApiClient.baseURL + "user/login", method: .post, parameters: parameters, headers: headers).response {response in
            switch response.result {
            
            case .success(let data):
                guard let safeData = data else {return}
                onSuccess(try! JSONDecoder().decode(SignInResponse.self, from: safeData))
            case .failure(let data):
                print("Error: \(data.errorDescription ?? "Unknown")")
            }
        }
        
    }
    
}
