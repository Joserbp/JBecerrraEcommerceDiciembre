//
//  Usuario+CoreDataProperties.swift
//  
//
//  Created by MacbookMBA7 on 05/01/23.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var apellidoPaterno: String?
    @NSManaged public var nombre: String?
    @NSManaged public var apellidoMaterno: String?
    @NSManaged public var fechaNacimiento: Date?
    @NSManaged public var imagen: String?

}
