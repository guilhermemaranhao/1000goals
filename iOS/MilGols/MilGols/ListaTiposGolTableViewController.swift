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
    func getTipoGolSelecionado(tipoGol: Tipo)
}

class ListaTiposGolTableViewController: UITableViewController {

    private var managedContext: NSManagedObjectContext!
    var delegate: ListaTiposGolProtocol?
    var tipoGolSelecionado:Tipo?
    var tiposGol = [[Tipo]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
        
        self.tiposGol.insert(getTipos(), atIndex: 0)
        self.tableView.reloadData()
    }
    
    func getTipos() -> [Tipo]
    {
        return Tipo.getTipos(managedContext)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiposGol[0].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tipo", forIndexPath: indexPath)
        let tipo = tiposGol[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(tipo.descricao!)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.getTipoGolSelecionado(tiposGol[tableView.indexPathForSelectedRow!.section][tableView.indexPathForSelectedRow!.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
