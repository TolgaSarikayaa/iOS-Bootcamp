//
//  PersonDetayVC.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 29.09.23.
//

import UIKit

class PersonDetayVC: UIViewController {

    
    @IBOutlet weak var personName: UITextField!
    
    @IBOutlet weak var personTel: UITextField!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = person {
            personName.text = p.person_ad
            personTel.text = p.person_tel
        }

    }
    
    @IBAction func update(_ sender: Any) {
        if let pn = personName.text, let pt = personTel.text, let p = person {
            updatePerson(person_id: p.person_id!, person_name: pn, person_tel: pt)
        }
    }
    
    func updatePerson(person_id: Int, person_name: String, person_tel: String) {
        print("Update Person : \(person_id) - \(person_name) - \(person_tel)")
    }

}
