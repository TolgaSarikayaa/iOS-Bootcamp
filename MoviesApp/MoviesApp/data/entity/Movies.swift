//
//  Movies.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 30.09.23.
//

import Foundation


class Movies : Codable {
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init() {
        
    }
    
    init(id: Int? = nil, ad: String? = nil, resim: String? = nil, fiyat: Int? = nil) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
    
}
