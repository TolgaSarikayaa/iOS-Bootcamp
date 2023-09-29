//
//  HomePageVC.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 29.09.23.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var personsTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        personsTableView.delegate = self
        personsTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Returned to home page")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let person = sender as? Person {
                let destinationVC = segue.destination as! PersonDetayVC
                destinationVC.person = person
            }
        }
    }
    

   

}

extension HomePageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Person Search: \(searchText)")
    }
}

extension HomePageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! PersonCell
        cell.personName.text = person.person_ad
        cell.personTel.text = person.person_tel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
