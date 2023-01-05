//
//  Usuario.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 05/01/23.
//

import Foundation

struct Usuario{
    var IdUsuario : Int
    var Nombre : String
    var ApellidoPaterno: String
    var ApellidoMaterno: String
    var FechaNacimiento: Date
    var Imagen : String

    init(Nombre: String, ApellidoPaterno: String, ApellidoMaterno: String, FechaNacimiento: Date, Imagen: String) {
        self.Nombre = Nombre
        self.ApellidoPaterno = ApellidoPaterno
        self.ApellidoMaterno = ApellidoMaterno
        self.FechaNacimiento = FechaNacimiento
        self.Imagen = Imagen
    }
    init(){
        self.Nombre = ""
        self.ApellidoPaterno = ""
        self.ApellidoMaterno = ""
        self.FechaNacimiento = Date.now
        self.Imagen = ""
    }
}
