//
//  Plantel.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 11/01/23.
//

import Foundation

struct Plantel {
    var IdPlantel : Int
    var Nombre : String
    
    init(IdPlantel: Int, Nombre: String) {
        self.IdPlantel = IdPlantel
        self.Nombre = Nombre
    }
    
    init(){
        self.IdPlantel = 0
        self.Nombre = ""
    }
}
