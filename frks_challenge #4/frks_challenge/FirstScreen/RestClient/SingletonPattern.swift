//
//  SingletonPattern.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 3.08.2022.
//

import Foundation
import UIKit

// Uygulama geneli memory'de tutulacak değişkenler için singleton patternini kullanıyoruz.

class SingletonPattern {
    
    //shared, sharedInstance, current, default
    
    static let shared = SingletonPattern()
    
    private init(){}
    
//    //Class Function
//    func buildUserProfile(profile:[:]) {
//        self.name = profile["name"]
//        self.userprofileUrl = profile["userprofileUrl"]
//        self.hesapNumrasi = profile["accountNumber"]
//    }
}


//Hesap Numaraları
//banka kart numaraları
//profil resmi
