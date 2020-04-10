//
//  Persona+CoreDataProperties.swift
//  AgendaSwiftTutorial
//
//  Created by Jaime Pantoja Diaz on 3/10/16.
//
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona");
    }

    @NSManaged public var apellidos: String?
    @NSManaged public var ciudad: String?
    @NSManaged public var codPostal: String?
    @NSManaged public var direccion: String?
    @NSManaged public var edad: String?
    @NSManaged public var nombre: String?
    @NSManaged public var telefono: String?

}
