//
//  PersonDetailViewModel.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import Foundation

class PersonDetailViewModel {
    var prepo = PersonsDaoRepository()
    
    func updatePerson(person_id: Int, person_name: String, person_tel: String) {
        prepo.updatePerson(person_id: person_id, person_name: person_name, person_tel: person_tel)
    }
    
}
