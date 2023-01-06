//
//  UsuarioViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 05/01/23.
//

import CoreData
import UIKit

class UsuarioViewModel{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func Add(usuario : Usuario) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
            let usuarioCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            usuarioCoreData.setValue(usuario.Nombre, forKey: "nombre")
            usuarioCoreData.setValue(usuario.ApellidoPaterno, forKey: "apellidoPaterno")
            usuarioCoreData.setValue(usuario.ApellidoMaterno, forKey: "apellidoMaterno")
            usuarioCoreData.setValue(usuario.FechaNacimiento, forKey: "fechaNacimiento")
            
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetAll() -> Result {
        var result = Result()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do {
            let usuarios = try context.fetch(request)
            result.Objects = [Usuario]()
            for objUsuario in usuarios as! [NSManagedObject] {
                var usuario = Usuario()
                //usuario.IdUsuario =  objUsuario.objectID.uriRepresentation().absoluteString
                usuario.Nombre = objUsuario.value(forKey: "nombre") as! String
                usuario.ApellidoPaterno = objUsuario.value(forKey: "apellidoPaterno") as! String
                
                result.Objects?.append(usuario)
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
}
