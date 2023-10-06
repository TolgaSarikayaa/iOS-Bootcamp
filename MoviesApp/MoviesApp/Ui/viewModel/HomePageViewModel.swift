//
//  HomePageViewModel.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 01.10.23.
//

import Foundation
import RxSwift


class HomePageViewModel {
    var mrepo = MoviesDaoRepository()
    var movieList = BehaviorSubject<[Movies]>(value: [Movies]())
    
    init() {
        movieList = mrepo.moviesList
        uploadMovie()
    }
   
    func uploadMovie() {
        mrepo.uploadMovie()
    }
    
}
