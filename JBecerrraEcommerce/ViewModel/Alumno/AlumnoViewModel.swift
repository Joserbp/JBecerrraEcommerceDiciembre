//
//  AlumnoViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 28/12/22.
//

import Foundation
import SQLite3

class AlumnoViewModel {
    
    func Add(alumno : Alumno) -> Result{
        
        var result = Result()
        let context = DB.init()
        let query = "INSERT INTO Alumno(Nombre,ApellidoPaterno,ApellidoMaterno,Genero,Image) VALUES(?,?,?,?,?)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (alumno.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 2, (alumno.ApellidoPaterno as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 3, (alumno.ApellidoMaterno as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 4, (alumno.Genero as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 5, (alumno.Imagen as NSString).utf8String, -1, nil)
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
        sqlite3_finalize(statement)
        sqlite3_close(context.db)
        return result
    }
    func Update() {
        
    }
    func Delete(IdAlumno : Int) -> Result {
        
        var result = Result()
        let context = DB.init()
        let query = "DELETE FROM Alumno WHERE IdAlumno = \(IdAlumno)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
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
    func GetAll() -> Result{
        
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdAlumno,Nombre,ApellidoPaterno,ApellidoMaterno,Genero,Image FROM Alumno"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var alumno = Alumno()
                    alumno.IdAlumno = Int(sqlite3_column_int(statement, 0))
                    alumno.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                    alumno.ApellidoPaterno =   String(cString: sqlite3_column_text(statement, 2))
                    alumno.ApellidoMaterno =   String(cString: sqlite3_column_text(statement, 3))
                    alumno.Genero =   String(cString: sqlite3_column_text(statement, 4))
                    if sqlite3_column_text(statement, 5) != nil{
                        alumno.Imagen = String(cString: sqlite3_column_text(statement, 5))
                    }else
                    {
                        alumno.Imagen = ""
                    }
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
