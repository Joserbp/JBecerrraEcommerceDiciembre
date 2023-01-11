//
//  SemestreViewModel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 10/01/23.
//

import Foundation
import SQLite3

class PlantelViewModel{
    func GetAll() -> Result {
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdPlantel,Nombre FROM Plantel"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var plantel = Plantel()
                    plantel.IdPlantel = Int(sqlite3_column_int(statement, 0))
                    plantel.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                    result.Objects?.append(plantel)
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
