//
//  WatchlistViewModel.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import Foundation

struct WatchlistViewModel: WatchlistViewModelProtocol {
    var changeHandler: ((WatchlistViewModelProtocolChange) -> Void)?
    
    func fetch() {
        // Send fetch request
        
    }
    
    func numberOfRows() -> Int {
        return 0
    }
    
    
    func itemAtIndex(index: Int) -> Symbol? {
        return nil
    }
}
