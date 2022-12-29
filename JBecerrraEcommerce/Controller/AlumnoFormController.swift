//
//  ViewController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 27/12/22.
//

import UIKit

class AlumnoFormController: UIViewController {

    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var GeneroField: UITextField!
    
    @IBOutlet weak var IdAlumnoField: UITextField!
    
    let alumnoViewModel = AlumnoViewModel()
    var alumnoModel : Alumno? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func AddButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        guard var nombre3 = NombreField.text , let apellidoPeterno = ApellidoPaternoField.text else { return  }
        guard NombreField.text != "" else{
            return
        }
        if let  nombre2 = NombreField.text {
            if let apellidoPeterno = ApellidoPaternoField.text{
                if let apellidoPeterno = ApellidoMaternoField.text{
                }
            }
        }else{
            return
        }
        
        let nombre = NombreField.text!
        let ApellidoPaterno = ApellidoPaternoField.text!
        let ApellidoMaterno = ApellidoMaternoField.text!
        let Genero = GeneroField.text!
        
        alumnoModel = Alumno(IdAlumno: 0, Nombre: nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Genero: Genero)
        
        let result = alumnoViewModel.Add(alumno: alumnoModel!)
        
        if result.Correct{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Confirmación", message: "Alumno Agregado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.NombreField.text = ""
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        else{
            //Mensaje de Error
        }
        
    }
    
    @IBAction func NombreEndEdit(_ sender: UITextField) {
        let texto = NombreField.text
        if NombreField.text == ""{
            NombreField.placeholder = "Escribe un nombre"
            NombreField.backgroundColor = .red
        }
    }
}

