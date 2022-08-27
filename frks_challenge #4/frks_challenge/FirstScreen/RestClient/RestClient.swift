//
//  RestClient.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 3.08.2022.
//

import Foundation

class RestClient {
    static let sharedInstance = RestClient()
    func makeRequest<U:Decodable>(request:Request, completion: @escaping ((U?)->Void)) {
        var baseRequestURL = request.requestURL
        if let requestParams = request.requestParams {
            baseRequestURL += "?"
            for key in requestParams.keys {
                if baseRequestURL.last != "&" && baseRequestURL.last != "?" {
                    baseRequestURL += "&"
                }
                baseRequestURL += "\(key)=\(requestParams[key] ?? "-")"
            }
        }
        
        guard let definitonUrl = URL.init(string: baseRequestURL) else { return }
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
            let responseModel = try? JSONDecoder().decode(U.self, from: _data)
            completion(responseModel)
        }
        dataTask.resume()
    }
}
