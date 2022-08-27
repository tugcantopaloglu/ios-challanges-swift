//
//  RestClient.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 3.08.2022.
//

import Foundation

class RestClient {
    static let sharedInstance = RestClient()
    
    func makeDefinitionRequest(completion:@escaping ((Response?)->Void)){
        guard let definitonUrl = URL.init(string: AppConstants.definitionUrl) else { return }
        let urlRequest = URLRequest.init(url: definitonUrl)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let _data = data else {
                completion(nil)
                return
            }
            let responseModel = try? JSONDecoder().decode(Response.self, from: _data)
            completion(responseModel)
        }
        dataTask.resume()
    }
}
