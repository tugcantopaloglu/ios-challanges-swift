//
//  WatchlistViewModelProtocol.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import Foundation

enum WatchlistViewModelProtocolChange {
    case networkOperationStart
    case networkOperationEnd
    case showError(String)
    case dataFetched
}

protocol WatchlistViewModelProtocol {
    var changeHandler:((WatchlistViewModelProtocolChange)->Void)? { get set }
    
    
    func fetch()
    func numberOfRows() -> Int
    func itemAtIndex(index:Int) -> Symbol?
}
