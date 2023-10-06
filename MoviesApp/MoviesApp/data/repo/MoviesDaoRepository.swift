//
//  MoviesDaoRepository.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 01.10.23.
//

import Foundation
import RxSwift
import Alamofire

class MoviesDaoRepository {
    var moviesList = BehaviorSubject<[Movies]>(value: [Movies]())
    
    func uploadMovie() {
      
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FilmlerResponse.self, from: data)
                    if let liste = cevap.filmler {
                        self.moviesList.onNext(liste)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
