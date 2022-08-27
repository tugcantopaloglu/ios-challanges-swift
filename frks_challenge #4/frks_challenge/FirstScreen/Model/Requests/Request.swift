//
//  Request.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 4.08.2022.
//

import Foundation

protocol Request {
    var requestURL:String { get }
    var requestParams:[String:String]? { get }
}
