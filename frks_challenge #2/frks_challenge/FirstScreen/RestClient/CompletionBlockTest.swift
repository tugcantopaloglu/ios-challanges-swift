//
//  CompletionBlockTest.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 3.08.2022.
//

import Foundation

class CompletionBlockTest {
    
    let name:String?
    let block:(()->())?
    func sayHi() -> String {
        return "Hi!!"
    }
    
    func sayHiWithBlock(sayHiBlock:((String)->())) {
        sayHiBlock("Hi from Block!")
    }
    
    func sayHiWithAsyncBlock(sayHiBlock:@escaping ()->()) {
        2dk
    }
    
}


let blockTest = CompletionBlockTest.init()


print(blockTest.sayHi())

blockTest.sayHiWithBlock { message in
    print(message)
}

