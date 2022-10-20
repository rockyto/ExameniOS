//
//  RouterTMDB.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 20/10/22.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    var entry: EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class MovieRouter : AnyRouter {
    var entry : EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = MovieRouter()
        
        var view: AnyView = ViewTMDB() as! AnyView
        var presenter : AnyPresenter = MoviePresenter()
        var interactor : AnyInteractor = MovieInteractor()
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
        
        return router
    }
}
