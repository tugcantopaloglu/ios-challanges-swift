//
//  SymbolLast.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 4.08.2022.
//

import Foundation

//{
//  "l": [
//    {
//      "tke": "GARAN.E.BIST",
//      "clo": "11:56:15",
//      "pdd": "1,48",
//      "las": "15,060"
//    },
//    {
//      "tke": "XU100.I.BIST",
//      "clo": "11:56:18",
//      "pdd": "1,53",
//      "las": "2.725,62"
//    }
//  ],
//  "z": "0"
//}

struct SymbolLastResponse: Decodable {
    let l:[Symbol]?
    let z:String?
}

struct Symbol: Decodable {
    let tke:String?
    let clo:String?
    let pdd:String?
    let las:String?
}

