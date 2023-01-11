//
//  Semestre.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 10/01/23.
//

import Foundation

struct Grupo {
    var IdGrupo : Int
    var Nombre : String
    var plantel : Plantel?
    
    init(IdGrupo: Int, Nombre: String) {
        self.IdGrupo = IdGrupo
        self.Nombre = Nombre
    }
    
    init(){
        self.IdGrupo = 0
        self.Nombre = ""
    }
}
