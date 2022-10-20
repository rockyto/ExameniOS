//
//  TMDBWireFrame.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//  
//

import Foundation
import UIKit

class TMDBWireFrame: TMDBWireFrameProtocol {

    class func createTMDBModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "TMDBView")
        if let view = navController.children.first as? TMDBView {
            let presenter: TMDBPresenterProtocol & TMDBInteractorOutputProtocol = TMDBPresenter()
            let interactor: TMDBInteractorInputProtocol & TMDBRemoteDataManagerOutputProtocol = TMDBInteractor()
            let localDataManager: TMDBLocalDataManagerInputProtocol = TMDBLocalDataManager()
            let remoteDataManager: TMDBRemoteDataManagerInputProtocol = TMDBRemoteDataManager()
            let wireFrame: TMDBWireFrameProtocol = TMDBWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "TMDBView", bundle: Bundle.main)
    }
    
}
