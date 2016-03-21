//
//  Gol+CoreDataProperties.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 17/11/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Gol {

    @NSManaged var datahora: NSDate?
    @NSManaged var detalhado: NSNumber?
    @NSManaged var atualizadoBackEnd: NSNumber?
    @NSManaged var estilo: Estilo?
    @NSManaged var tipo: Tipo?

}
