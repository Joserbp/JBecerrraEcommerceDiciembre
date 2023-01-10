//
//  Semestre.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 10/01/23.
//

import Foundation

struct Semestre {
    var IdSemestre : Int
    var Nombre : String
    
    init(IdSemestre: Int, Nombre: String) {
        self.IdSemestre = IdSemestre
        self.Nombre = Nombre
    }
    
    init(){
        self.IdSemestre = 0
        self.Nombre = ""
    }
}
