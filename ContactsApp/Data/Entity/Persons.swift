//
//  Persons.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 29.09.23.
//

import Foundation

class Person {
    var person_id:Int?
    var person_ad:String?
    var person_tel:String?
    
    init(){
        
    }
    
    init(person_id: Int, person_ad: String, person_tel: String) {
        self.person_id = person_id
        self.person_ad = person_ad
        self.person_tel = person_tel
    }
}
