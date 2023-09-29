//
//  PersonCell.swift
//  ContactsApp
//
//  Created by Tolga Sarikaya on 29.09.23.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personTel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
