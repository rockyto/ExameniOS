//
//  TMDBInteractor.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//  
//

import Foundation

class TMDBInteractor: TMDBInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: TMDBInteractorOutputProtocol?
    var localDatamanager: TMDBLocalDataManagerInputProtocol?
    var remoteDatamanager: TMDBRemoteDataManagerInputProtocol?

}

extension TMDBInteractor: TMDBRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
