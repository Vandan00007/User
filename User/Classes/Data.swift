//
//  Data.swift
//  User
//
//  Created by Vandan  on 10/12/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class Data: NSObject {
    var id : Int?
    var name : String?
    var email : String?
    var address : String?
    var number : String?
    var age : String?
    var date : String?
    var avatar : String?
    var gender : String?
    
    
    func initWithData(theRow i : Int, theName n : String, theEmail e : String, theAddress a : String, theNumber no : String?, theAge ag : String, theDate d : String, theAvatar av : String, theGender g : String)
    {
        id = i
        name = n
        email = e
        address = a
        number = no
        age = ag
        date = d
        avatar = av
        gender = g
    }

}
