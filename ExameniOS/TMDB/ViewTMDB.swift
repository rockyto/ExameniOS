//
//  ViewTMDB.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 20/10/22.
//

import UIKit

protocol AnyView {
    var presenter : AnyPresenter? {get set}
    func update(with results: [Movie])
    func update(with error: String)
}

class ViewTMDB: UIViewController {
    
    var movies : [Movie]?

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
