//
//  Estilo+CoreDataProperties.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 22/10/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Estilo {

    @NSManaged var id: NSNumber?
    @NSManaged var descricao: String?
    @NSManaged var gols: NSSet?

}
