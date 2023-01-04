//
//  ViewController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 27/12/22.
//

import UIKit

class AlumnoFormController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var GeneroField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    var idAlumno : Int? = nil
    
    let alumnoViewModel = AlumnoViewModel()
    var alumnoModel : Alumno? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary //Determina la fuente de la imagen
        imagePicker.isEditing = false //Permite edicion
        validar()
    }
    
    func validar(){
        if idAlumno == nil{
            //Mostrar buton que indique Agregar
            //Mostar el formulario vacio
            imageView.image = UIImage(named: "User")
        }else
        {
            // Mostar buton que inque Actualizar
            //Mostar el formulario precargado
            //Uso del GetById
            //CONVERTIR DE BASE64 a UIIMAGE
        }
    }
    
    @IBAction func AddButton(_ sender: UIButton) {  //Action
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let nombre = NombreField.text!
        let ApellidoPaterno = ApellidoPaternoField.text!
        let ApellidoMaterno = ApellidoMaternoField.text!
        let Genero = GeneroField.text!
        let image = imageView.image! //Convertir a base64
        let imageString : String
        if imageView.restorationIdentifier == "User"{
            imageString = ""
        }else{
            let imageData = image.pngData()! as NSData
            imageString = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        alumnoModel = Alumno(IdAlumno: 0, Nombre: nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Genero: Genero, Imagen: imageString)
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true,completion: nil)
        
    }
    
    @IBAction func btnImage() {
        self.present(imagePicker, animated: true)
    }
    
}

