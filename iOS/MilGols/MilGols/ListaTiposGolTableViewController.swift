//
//  ListaTiposGolTableViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 20/10/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit
import CoreData

protocol ListaTiposGolProtocol {
    func tipoGolSelecionado(tipoGol: Tipo)
}

class ListaTiposGolTableViewController: UITableViewController {

    private var managedContext: NSManagedObjectContext!
    var delegate: ListaTiposGolProtocol?
    var tipoGolSelecionado:Tipo?
    var tiposGol: [Tipo]?
    
    override func viewDidLoad() {
        self.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
        
        let entityTipo = NSEntityDescription.entityForName("Tipo", inManagedObjectContext: managedContext)
        let tipo = Tipo(entity: entityTipo!, insertIntoManagedObjectContext: managedContext)
        tipo.getTipos(<#T##managedContext: NSManagedObjectContext?##NSManagedObjectContext?#>)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CelulaGolNaoDetalhado tableView.dequeueReusableCellWithIdentifier("GolAtual", forIndexPath: indexPath) as! CelulaGolNaoDetalhado
        
    
            let gol = golsDetalhados[indexPath.section][indexPath.row]
            //let cell = CelulaGolNaoDetalhado()
            cell.textLabel?.text = "\(gol.datahora) - \(gol.detalhado)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        <#code#>
    }
}
