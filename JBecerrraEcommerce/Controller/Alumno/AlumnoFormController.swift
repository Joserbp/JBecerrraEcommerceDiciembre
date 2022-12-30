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

    @IBAction func SeguesRojoButton(_ sender: UIButton) {
        performSegue(withIdentifier: "NavegacionRojo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let idenficador = segue.identifier
        if segue.identifier == "NavegacionRojo"{
            print("Se intenta navegar a la vista roja")
        }
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let nombre = NombreField.text!
        let ApellidoPaterno = ApellidoPaternoField.text!
        let ApellidoMaterno = ApellidoMaternoField.text!
        let Genero = GeneroField.text!
        
        alumnoModel = Alumno(IdAlumno: 0, Nombre: nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Genero: Genero)
        
        let result = alumnoViewModel.Add(alumno: alumnoModel!)
        
        if result.Correct{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Confirmación", message: "Alumno Agregado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.NombreField.text = ""
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "El alumno no se agrego correctamente " + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        
    }
    
    @IBAction func NombreEndEdit(_ sender: UITextField) {
        if NombreField.text == ""{
            NombreField.placeholder = "Escribe un nombre"
            NombreField.backgroundColor = .red
        }else
        {
            NombreField.placeholder = ""
            NombreField.backgroundColor = .tertiarySystemFill
        }
    }
    
}

