//
//  Gol.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 18/09/15.
//  Copyright (c) 2015 Scrum Masters. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Gol
{
    private var managedContext: NSManagedObjectContext!
    
    func registrarGol()
    {
        let gol = getGolInstance()
        let dataCorrente = NSDate()
        gol.setValue(dataCorrente, forKey: "datahora")
        gol.setValue(false, forKey: "detalhado")
        
        var erro: NSError?
        if !managedContext.save(&erro)
        {
            println("Erro ao registrar Gol \(erro), \(erro?.userInfo)")
        }
        
        //Visualizando gol registrado.
        let fetchRequest = NSFetchRequest(entityName: "Gol")
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &erro) as? [NSManagedObject]
        
        if let results = fetchedResults {
            println("\(results)")
        }
        else
        {
            println("Gols não encontrados \(erro), \(erro!.userInfo)")
        }
        
    }
    
    private func getGolInstance() -> NSManagedObject
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext!
        
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        return NSManagedObject(entity: entityGol!, insertIntoManagedObjectContext: managedContext)
    }

}
