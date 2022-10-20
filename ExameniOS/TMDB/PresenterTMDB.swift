//
//  PresenterTMDB.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 20/10/22.
//

import Foundation

enum NetworkError : Error {
    
    case networkFailed
    case parsingFailed
    
}

protocol AnyPresenter {
    
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadMovie(result: Result<[Movie], Error>)
    
}

class MoviePresenter : AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor : AnyInteractor? {
        didSet{
            interactor?.downloadMovies()
        }
    }
    var view: AnyView?
    
    func interactorDidDownloadMovie(result: Result<[Movie], Error>){
        switch result{
        case .success(let movies):
            view?.update(with: movies)
        case.failure(_):
            view?.update(with: "Intenta más tarde")
        }
    }
}
