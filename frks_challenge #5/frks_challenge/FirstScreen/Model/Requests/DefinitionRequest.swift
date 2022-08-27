//
//  DefinitionRequest.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 4.08.2022.
//

import Foundation

struct DefinitionRequest: Request {
    
    var requestURL: String {
        return AppConstants.definitionUrl
    }
    
    var requestParams: [String : String]? {
        return nil
    }
}
