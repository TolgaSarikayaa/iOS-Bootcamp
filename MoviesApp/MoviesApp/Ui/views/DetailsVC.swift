//
//  DetailsVC.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

   
    @IBOutlet weak var labelMovie: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var LabelPrice: UILabel!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = movie {
            labelMovie.text = m.ad
            
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(m.resim!)") {
                DispatchQueue.main.async {
                    self.imageView.kf.setImage(with: url)
                }
            }
            
            LabelPrice.text = "\(m.fiyat!) $"
            
        }
      
    }
    

    

}
