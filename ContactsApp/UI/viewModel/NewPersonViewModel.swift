//
//  NewPersonViewModel.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import Foundation

class NewPersonViewModel {
    var prepo = PersonsDaoRepository()
    
    func savePerson(peron_name: String, person_tel: String) {
        prepo.savePerson(person_name: peron_name, person_tel: person_tel)
    }
    
}
