//
//  WatchlistViewModel.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import Foundation

class WatchlistViewModel: WatchlistViewModelProtocol {
    
    
    var changeHandler: ((WatchlistViewModelProtocolChange) -> Void)?
    
    var stopSyncFlag:Bool?
    
    
    func startSync() {
        self.stopSyncFlag = false
        sendRequest()
    }
    
    func stopSync() {
        self.stopSyncFlag = true
    }
    
    private func sendRequest(){
        guard stopSyncFlag == false else { return }
        RestClient.sharedInstance.makeRequest(request: SymbolLastRequest(symbolList: ["GARAN.E.BIST", "XU100.I.BIST"], fieldList: ["pdd", "las"])) { (response:SymbolLastResponse?) in
            
            guard let symbolList = response?.l else {
                self.changeHandler?(.showError("Bir hata oluştu."))
                return
            }
            
            self.changeHandler?(.dataFetched(symbolList))
            // Calculations
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.sendRequest()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return 0
    }
    
    
    func itemAtIndex(index: Int) -> Symbol? {
        return nil
    }
}
