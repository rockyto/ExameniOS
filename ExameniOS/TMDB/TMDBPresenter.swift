//
//  TMDBPresenter.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//  
//

import Foundation

class TMDBPresenter  {
    
    // MARK: Properties
    weak var view: TMDBViewProtocol?
    var interactor: TMDBInteractorInputProtocol?
    var wireFrame: TMDBWireFrameProtocol?
    
}

extension TMDBPresenter: TMDBPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("Hablando a la vista")
    }
}

extension TMDBPresenter: TMDBInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
