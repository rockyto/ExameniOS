//
//  ViewController.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//

import UIKit
import Eureka
import ImageRow
import FirebaseStorage
class ViewController: FormViewController {
    
    var userName:String = ""
    var userEmail = ""
    var userPhone = ""
    var imageKey: String!
    var enviaImagen: Data?
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        form +++ Section("Datos de usuario")
        +++
        Section()
        <<< TextRow(){ row in
            row.title = "Nombre"
           // self.userName = row.value!
            
            
        }.onChange({ (row) in
            self.userName = row.value!
        })

        <<< ImageRow("FireImage"){ row in
            row.title = "Selfie"
            row.sourceTypes = .Camera
            row.clearAction = .yes(style: UIAlertAction.Style.destructive)
            
            
            
        }.cellUpdate { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }.onChange({ [unowned self] row in
          //  imageKey = row.value
            guard let image = row.value else{
                return
            }
            
            guard let imagenData = image.pngData() else{
                return
            }
            
            enviaImagen = imagenData
     
            
        })
        +++ Section ("")
        <<< ButtonRow{ row in
            row.title = "Guardar"
            
        }.onCellSelection({ [self] (cell, row)in
            
            let spinningActivity = MBProgressHUD.showAdded(to:  self.view, animated: true)
            spinningActivity?.labelText = "Subiendo"
            spinningActivity?.detailsLabelText = "un momento por favor"
            
            storage.child("images/\(userName).png").putData(enviaImagen!,  metadata: nil, completion: {_, error in
                
                spinningActivity?.hide(true)
                
                let alert = UIAlertController(title: "Imagen subida", message: nil, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                
                guard error == nil else{
                    print("Falló")
                    return
                }
                
                
                
                
            })

            
        })
        
        
        
    }
    func showAlert(title: String, message: String, in vc: UIViewController) {
            
           
            
    }
}

