//
//  myData.swift
//  User
//
//  Created by Vandan  on 9/20/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class myData: NSObject {
    
    var savedName : String?
    var savedEmail : String?
    
    
    override init() {
        savedName = "Jim Kirk"
        savedEmail = "jim@kirk.com"
    }
    
    func initWithStuff(theName : String , theEmail : String){
        savedName = theName
        savedEmail = theEmail
        
    }

}
