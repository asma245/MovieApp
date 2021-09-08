//
//  Request.swift
//  Movie
//
//  Created by Asma hassan on 8/27/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import Alamofire

class Request {
    
    
    func getService(_ url: URL, _ method: HTTPMethod = .get, _ headers: HTTPHeaders? = [], _ parameters: Parameters?, callback: @escaping ([String: Any])->()) {
       
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                    if let result =  response.value as? [String: Any] {
                        callback(result)
                    }
                }
                print(response.value)
                print(" ")
            case .failure(let error):
                print(error.localizedDescription)

            }
        }
    }
    
    
}
