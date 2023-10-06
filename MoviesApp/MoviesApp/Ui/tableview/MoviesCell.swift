//
//  MoviesCell.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import UIKit

protocol CellProtokol {
    func buttonClicked(indexPath: IndexPath)
    
}

class MoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var cellProtokol: CellProtokol?
    var indexPath: IndexPath?
    
    
    @IBAction func button(_ sender: Any) {
        cellProtokol?.buttonClicked(indexPath: indexPath!)
        
    }
    
    
}
