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
        do
        {
            try managedContext.save()
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Erro ao registrar Gol \(erro), \(erro?.userInfo)")
        }
        
        //Visualizando gol registrado.
        let fetchRequest = NSFetchRequest(entityName: "Gol")
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            print("\(results)")
            print("Primeiro gol marcado: \(results?.first)")
            print("Último gol marcado: \(results?.last)")
            print("quantidade de gols marcados: \(results?.count)")
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Gols não encontrados \(erro), \(erro!.userInfo)")
        }
        
    }
    
    private func getGolInstance() -> NSManagedObject
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext!
        
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        return NSManagedObject(entity: entityGol!, insertIntoManagedObjectContext: managedContext)
    }
    
    func getGolsNaoDetalhados()
    {
        let consultaGols = NSFetchRequest(entityName: "Gol")
        
        let criteria = NSPredicate(format: "detalhado == false", consultaGols)
        
        criteria.finalize()
        
    }

}
