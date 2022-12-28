//
//  AlumnoViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 28/12/22.
//

import Foundation
import SQLite3

class AlumnoViewModel {
    
    let alumnoModel : Alumno? = nil
    
    func Add(alumno : Alumno) -> Result{
                
        var result = Result()
        let context = DB.init()
        let query = "INSERT INTO Alumno(Nombre,ApellidoPaterno,ApellidoMaterno,Genero) VALUES(?,?,?,?)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (alumno.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 2, (alumno.ApellidoPaterno as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 3, (alumno.ApellidoMaterno as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 4, (alumno.Genero as NSString).utf8String, -1, nil)
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
            }
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    func Update() {
        
    }
    func Delete() {
        
    }
    func GetAll() {
        
    }
    func GetById() {
        
    }
}
