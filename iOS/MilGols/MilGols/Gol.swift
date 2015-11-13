//
//  Gol.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 18/09/15.
//  Copyright (c) 2015 Scrum Masters. All rights reserved.
//

import Foundation
import CoreData

class Gol: NSManagedObject
{
    
    func registrarGol(managedContext: NSManagedObjectContext?)
    {
        let dataCorrente = NSDate()
        self.datahora = dataCorrente
        self.detalhado = false
        
        var erro: NSError?
        do
        {
            try self.managedObjectContext?.save()
            //try managedContext!.save()
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Erro ao registrar Gol \(erro), \(erro?.userInfo)")
        }
        
        //Visualizando gol registrado.
        let fetchRequest = NSFetchRequest(entityName: "Gol")
        
        do{
            let results = try managedContext!.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            for result in results! {
                if let dataHora = result.valueForKey("datahora") as? NSDate, detalhado = result.valueForKey("detalhado") as? Bool {
                    print("Gol! \(dataHora) - \(detalhado)")
                }
            }
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Gols não encontrados \(erro), \(erro!.userInfo)")
        }
        
    }
    
    static func getGols(managedContext: NSManagedObjectContext?, detalhados: Bool) -> [Gol]
    {
        let fetchRequest = NSFetchRequest(entityName: "Gol")
        
        let criteria = NSPredicate(format: "detalhado == %@", detalhados)
        fetchRequest.predicate = criteria
        
        var erro: NSError?
        var golsNaoDetalhados = [Gol]()
        do{
            if let results = try managedContext!.executeFetchRequest(fetchRequest) as? [Gol] {
                golsNaoDetalhados = results
            }
        }
        catch let erro1 as NSError
        {
            erro = erro1
            print("Gols não encontrados \(erro), \(erro!.userInfo)")
        }
        return golsNaoDetalhados
    }
    
    func detalhar(managedContext: NSManagedObjectContext)
    {
        do
        {
            self.detalhado = true
            try managedObjectContext!.save()
        }
        catch let erroSalvar as NSError
        {
            print("Erro ao detalhar gol \(erroSalvar.description)")
        }
    }

}
