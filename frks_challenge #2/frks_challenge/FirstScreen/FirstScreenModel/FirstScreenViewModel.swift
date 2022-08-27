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
        RestClient.sharedInstance.makeDefinitionRequest { response in
            print("Response: \(response)")
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
//            self?.emit(method: .loaderDismiss)
//            self?.emit(method: .responseReceived("Hello!"))
//        }
    }
}

extension FirstScreenViewModel {
    fileprivate func emit(method:FirstScreenViewModelProtocolChangeHandler) {
        self.changeHandler?(method)
    }
}
