//
//  PersonsDaoRepository.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import Foundation
import RxSwift
import Alamofire


class PersonsDaoRepository {
    var personLists = BehaviorSubject<[Person]>(value: [Person]())
    
    func savePerson(person_name: String, person_tel: String) {
        let params: Parameters = ["kisi_ad":person_name,"kisi_tel":person_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("success: \(answer.success!)")
                    print("Message: \(answer.message!)")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updatePerson(person_id: Int, person_name: String, person_tel: String) {
        let params: Parameters = ["kisi_id":person_id,"kisi_ad":person_name,"kisi_tel":person_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("success: \(answer.success!)")
                    print("Message: \(answer.message!)")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(person_id: Int) {
        let params: Parameters = ["kisi_id":person_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("success: \(answer.success!)")
                    print("Message: \(answer.message!)")
                        self.uploadPersons()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(searchWord: String) {
        let params: Parameters = ["kisi_ad":searchWord]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(PersonsResponse.self, from: data)
                    if let list = answer.persons {
                        self.personLists.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    func uploadPersons() {
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(PersonsResponse.self, from: data)
                    if let list = answer.persons {
                        self.personLists.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

    }
}
