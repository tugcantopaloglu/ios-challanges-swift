//
//  SymbolLastRequest.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 4.08.2022.
//

import Foundation

struct SymbolLastRequest: Request {
    var requestURL: String {
        return AppConstants.symbolLastUrl
    }
    
    //https://sui7963dq6.execute-api.eu-central-1.amazonaws.com/default/ForeksMobileInterview?
//    fields = pdd
//    ,
//    las
//    &
//    stcs = GARAN.E.BIST
//    ~
//    XU100.I.BIST
    
    var requestParams: [String : String]? {
        var fieldString = ""
        var symbolString = ""
        
        fieldList?.forEach({ field in
            if fieldString.count == 0 {
                fieldString += field
            } else {
                fieldString += ",\(field)"
            }
        })
        
        symbolList?.forEach({ symbol in
            if symbolString.count == 0 {
                symbolString += symbol
            } else {
                symbolString += "~\(symbol)"
            }
        })
        return ["fields": fieldString,
                "stcs": symbolString]
    }
    
    let symbolList:[String]?
    let fieldList:[String]?
    
    
    init(symbolList:[String], fieldList:[String]) {
        self.symbolList = symbolList
        self.fieldList = fieldList
    }
    
}
