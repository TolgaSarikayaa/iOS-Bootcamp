//
//  FilmlerResponse.swift
//  MoviesApp
//
//  Created by Tolga Sarikaya on 04.10.23.
//

import Foundation

class FilmlerResponse: Codable {
    var filmler: [Movies]?
    var success:Int?
}
