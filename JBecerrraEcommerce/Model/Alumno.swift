//
//  Alumno.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 28/12/22.
//

import Foundation

struct Alumno {
    var IdAlumno : Int
    var Nombre : String
    var ApellidoPaterno : String
    var ApellidoMaterno : String
    var Genero : String
    //Propiedades de navegación
    //var result : Result?
    init(IdAlumno: Int, Nombre: String, ApellidoPaterno: String, ApellidoMaterno: String, Genero: String) {
        self.IdAlumno = IdAlumno
        self.Nombre = Nombre
        self.ApellidoPaterno = ApellidoPaterno
        self.ApellidoMaterno = ApellidoMaterno
        self.Genero = Genero
    }
    init() {
        self.IdAlumno = 0
        self.Nombre = ""
        self.ApellidoPaterno = ""
        self.ApellidoMaterno = ""
        self.Genero = ""
    //  self.result = nil
    }
}
