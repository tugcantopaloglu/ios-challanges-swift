//
//  FirstScreenViewModelProtocol.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 2.08.2022.
//

import Foundation

enum FirstScreenViewModelProtocolChangeHandler {
    case loaderShow
    case loaderDismiss
    case responseReceived(String)
    case error(String)
}

protocol FirstScreenViewModelProtocol {
    func sendRequest()
    var changeHandler:((FirstScreenViewModelProtocolChangeHandler)->Void)? { get set }
}
