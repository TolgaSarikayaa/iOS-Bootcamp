//
//  ViewController.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import UIKit
import Kingfisher

class HomePage: UIViewController {

    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var moviesList = [Movies]()
    
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        _ = viewModel.movieList.subscribe(onNext: { list in
            self.moviesList = list
            self.moviesCollectionView.reloadData()
        })
        
       
       
        let style = UICollectionViewFlowLayout()
        style.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        style.minimumInteritemSpacing = 10
        style.minimumLineSpacing = 10
        
        let viewWidth = UIScreen.main.bounds.width
        let itemWidth = (viewWidth - 30) / 2
        
        style.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        
        moviesCollectionView.collectionViewLayout = style
        
        
    }


}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource, CellProtokol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
       
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(movie.resim!)") {
            DispatchQueue.main.async {
                cell.imageViewMovie.kf.setImage(with: url)
            }
        }
        
        cell.priceLabel.text = "\(movie.fiyat!) $"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.cellProtokol = self
        cell.indexPath = indexPath
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let movie = sender as? Movies {
                let destinationVC = segue.destination as! DetailsVC
                destinationVC.movie = movie
            }
        }
    }
    
    func buttonClicked(indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
    }
    
    
}
