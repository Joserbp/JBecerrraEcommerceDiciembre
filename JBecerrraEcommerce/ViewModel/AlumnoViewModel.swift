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
    func GetAll() -> Result{
        
var result = Result()
let context = DB.init()
let query = "SELECT IdAlumno,Nombre FROM Alumno"
var statement : OpaquePointer? = nil
do{
    if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
        
        result.Objects = []
        while sqlite3_step(statement) == SQLITE_ROW{
            
            //USANDO CONSTRUCTOR COMPLETO
            var alumno = Alumno(IdAlumno: Int(sqlite3_column_int(statement, 0), Nombre: String(cString: sqlite3_column_text(statement, 1)), ApellidoPaterno: "", ApellidoMaterno: "", Genero: "")
                                
            //USANDO CONSTRUCTOR VACIO
            alumno.IdAlumno = Int(sqlite3_column_int(statement, 0))
            alumno.Nombre =   String(cString: sqlite3_column_text(statement, 1))
            alumno.result = Result()
            alumno.departament = Departamento()
                                alumno.departamento.area = Area()
                                alumno.departamento.area.idarea = Int(sqlite3_column_int(statement, 9)
                                                                      
            result.Objects?.append(alumno)
        }
        result.Correct = true
    }
}catch let error{
    result.Correct = false
    result.Ex = error
    result.ErrorMessage = error.localizedDescription
}
return result
    }
    func GetById(idAlumno: Int) {
        
    }
}
