//
//  TMDBProtocols.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//  
//

import Foundation
import UIKit

protocol TMDBViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: TMDBPresenterProtocol? { get set }
}

protocol TMDBWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createTMDBModule() -> UIViewController
}

protocol TMDBPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: TMDBViewProtocol? { get set }
    var interactor: TMDBInteractorInputProtocol? { get set }
    var wireFrame: TMDBWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol TMDBInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol TMDBInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: TMDBInteractorOutputProtocol? { get set }
    var localDatamanager: TMDBLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: TMDBRemoteDataManagerInputProtocol? { get set }
}

protocol TMDBDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol TMDBRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: TMDBRemoteDataManagerOutputProtocol? { get set }
}

protocol TMDBRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol TMDBLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
