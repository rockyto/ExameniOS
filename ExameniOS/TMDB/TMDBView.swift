//
//  TMDBView.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//  
//

import Foundation
import UIKit

class TMDBView: UIViewController {

    // MARK: Properties
    var presenter: TMDBPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension TMDBView: TMDBViewProtocol {
    // TODO: implement view output methods
}
