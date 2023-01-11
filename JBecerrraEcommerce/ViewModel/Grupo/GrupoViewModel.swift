//
//  GrupoViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 11/01/23.
//

import Foundation
import SQLite3

class GrupoViewModel{
    func GetByIdPlantel(_ IdPlantel : Int) -> Result {
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdGrupo,Nombre,IdPlantel FROM Grupo WHERE IdPlantel = \(IdPlantel)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var grupo = Grupo()
                    grupo.IdGrupo = Int(sqlite3_column_int(statement, 0))
                    grupo.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                    grupo.plantel = Plantel()
                    grupo.plantel?.IdPlantel = Int(sqlite3_column_int(statement, 2))
                    result.Objects?.append(grupo)
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
