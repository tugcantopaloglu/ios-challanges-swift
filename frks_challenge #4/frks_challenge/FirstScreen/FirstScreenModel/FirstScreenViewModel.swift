//
//  FirstScreenViewModel.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 2.08.2022.
//

import Foundation

class FirstScreenViewModel: FirstScreenViewModelProtocol {
    
    var changeHandler: ((FirstScreenViewModelProtocolChangeHandler) -> Void)?
    
    func sendRequest() {
        emit(method: .loaderShow)
        
        RestClient.sharedInstance.makeRequest(request: SymbolLastRequest(symbolList: ["GARAN.E.BIST", "XU100.I.BIST"], fieldList: ["pdd", "las"])) { (response:SymbolLastResponse?) in
            print("Hey!")
            print(response)
        }
    }
}

extension FirstScreenViewModel {
    fileprivate func emit(method:FirstScreenViewModelProtocolChangeHandler) {
        self.changeHandler?(method)
    }
}
