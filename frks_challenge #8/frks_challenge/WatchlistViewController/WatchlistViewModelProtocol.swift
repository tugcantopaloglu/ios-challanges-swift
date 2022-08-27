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
    case dataFetched([Symbol])
}

protocol WatchlistViewModelProtocol {
    var changeHandler:((WatchlistViewModelProtocolChange)->Void)? { get set }
    
    
    
    func startSync()
    func stopSync()
    
    var stopSyncFlag:Bool? { get set }
    
    func numberOfRows() -> Int
    func itemAtIndex(index:Int) -> Symbol?
}
