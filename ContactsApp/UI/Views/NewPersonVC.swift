//
//  NewPersonVC.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 29.09.23.
//

import UIKit

class NewPersonVC: UIViewController {

    @IBOutlet weak var newPersonName: UITextField!
    
    @IBOutlet weak var newPersonTel: UITextField!
    
    var viewModel = NewPersonViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func save(_ sender: Any) {
        if let pn = newPersonName.text, let pt = newPersonTel.text {
            viewModel.savePerson(peron_name: pn, person_tel: pt)
        }
    }
    
    

}
