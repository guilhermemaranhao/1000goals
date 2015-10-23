//
//  Tipo.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 22/10/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import Foundation
import CoreData

class Tipo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func getTipos(managedContext: NSManagedObjectContext?) -> [Tipo]
    {
        let fetchRequest = NSFetchRequest(entityName: "Tipo")
        
        var erro: NSError?
        var tipos = [Tipo]()
        do{
            if let results = try managedContext!.executeFetchRequest(fetchRequest) as? [Tipo] {
                tipos = results
            }
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Tipos não encontrados \(erro), \(erro!.userInfo)")
        }
        return tipos
    }

}
