//
//  EntityTMDB.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 20/10/22.
//

import Foundation


struct Discover: Decodable {
 
    let results: [Movie]
  
}

struct Movie: Identifiable, Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

}
