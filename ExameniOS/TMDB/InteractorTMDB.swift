//
//  InteractorTMDB.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 20/10/22.
//

import Foundation


protocol AnyInteractor{
    
    var presenter : AnyPresenter? {get set}
    
    func downloadMovies()
    
}

class MovieInteractor : AnyInteractor {
    var presenter : AnyPresenter?
    
    func downloadMovies(){
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=115962553d2044ca5dd8433fb4bc3e29")
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidDownloadMovie(result:
                        .failure(NetworkError.networkFailed))
                return
            }
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                self.presenter?.interactorDidDownloadMovie(result: .success(movies))
            }catch{
                self.presenter?.interactorDidDownloadMovie(result: .failure(NetworkError.parsingFailed))
            }
        }
        task.resume()
    }
    
}
