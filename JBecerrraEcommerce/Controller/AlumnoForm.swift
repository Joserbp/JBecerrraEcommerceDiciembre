//
//  ViewController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 27/12/22.
//

import UIKit

class AlumnoForm: UIViewController {

    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var GeneroField: UITextField!
    
    @IBOutlet weak var IdAlumnoField: UITextField!
    
    let alumnoViewModel = AlumnoViewModel()
    var alumnoModel : Alumno? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IdAlumnoField.isHidden = false
        
    }

    @IBAction func AddButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let nombre = NombreField.text!
        let ApellidoPaterno = ApellidoPaternoField.text!
        let ApellidoMaterno = ApellidoMaternoField.text!
        let Genero = GeneroField.text!
        
        alumnoModel = Alumno(IdAlumno: 0, Nombre: nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Genero: Genero)
        
        let result = alumnoViewModel.Add(alumno: alumnoModel!)
        
    }
    
}

