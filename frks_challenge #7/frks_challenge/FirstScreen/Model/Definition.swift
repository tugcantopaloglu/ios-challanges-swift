//
//  Definition.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 3.08.2022.
//

import Foundation


struct Response: Decodable {
    let mypageDefaults:[Definition]?
    let mypage:[Field]?
}

struct Definition: Decodable {
    let cod:String?
    let gro:String?
    let tke:String?
    let def:String?
}

struct Field: Decodable {
    let name:String?
    let key:String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case key = "key"
    }
}


//Codable
//Encodable
//Decodable


/***
 
 init dictionary:[:]:
    name = dictionary["name"]
    key = dictionary["key"]
 
 */
