//
//  SemestreViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 10/01/23.
//

import Foundation
import SQLite3

class SemestreViewModel{
    func GetAll() -> Result {
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdSemestre,Nombre FROM Semestre"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var semestre = Semestre()
                    semestre.IdSemestre = Int(sqlite3_column_int(statement, 0))
                    semestre.Nombre =   String(cString: sqlite3_column_text(statement, 1))
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
}
