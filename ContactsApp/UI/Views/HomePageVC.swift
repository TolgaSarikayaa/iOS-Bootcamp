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
        
        let person1 = Person(person_id: 1, person_ad: "Tom", person_tel: "1111")
        let person2 = Person(person_id: 2, person_ad: "Henry", person_tel: "2222")
        let person3 = Person(person_id: 3, person_ad: "Clara", person_tel: "3333")
        personList.append(person1)
        personList.append(person2)
        personList.append(person3)

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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {contextualAction, view, bool in
            let person = self.personList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(person.person_ad!) should it be deleted? ", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
            alert.addAction(cancelAction)
            let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { action in
                print("Delete Person : \(person.person_id!)")
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
