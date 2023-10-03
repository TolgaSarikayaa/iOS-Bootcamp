//
//  HomePageViewModel.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var prepo = PersonsDaoRepository()
    var personLists = BehaviorSubject<[Person]>(value: [Person]())
    
    init(){
        personLists = prepo.personLists
        uploadPersons()
    }
    
    func delete(person_id: Int) {
        prepo.delete(person_id: person_id)
    }
    
    func search(searchWord: String) {
        prepo.search(searchWord: searchWord)
    }
    
    func uploadPersons() {
        prepo.uploadPersons()

    }
}
