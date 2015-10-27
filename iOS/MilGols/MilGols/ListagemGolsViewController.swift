//
//  ListagemGolsViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 29/09/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit
import CoreData

class ListagemGolsViewController: UITableViewController {
    
    private var managedContext: NSManagedObjectContext!
    var golsNaoDetalhados = [[Gol]]()
    var golsDetalhados = [[Gol]]()
    var golSelecionado:Gol!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let segmentoGolsNaoDetalhados = 0
    let segmentoGolsDetalhados = 1
    
    @IBAction func segmentoAlterado(sender: UISegmentedControl) {
        
        if (segmentedControl.selectedSegmentIndex == segmentoGolsNaoDetalhados)
        {
            self.recarregarGolsNaoDetalhados()
        }
        else if (segmentedControl.selectedSegmentIndex == segmentoGolsDetalhados)
        {
            self.recarregarGolsDetalhados()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext

        recarregarGolsNaoDetalhados()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func recarregarGolsNaoDetalhados()
    {
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        let gol = Gol(entity: entityGol!, insertIntoManagedObjectContext: managedContext)
        
        self.golsNaoDetalhados.insert(gol.getGols(managedContext, detalhados: false), atIndex: 0)
        self.tableView.reloadData()
    }
    
    func recarregarGolsDetalhados()
    {
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        let gol = Gol(entity: entityGol!, insertIntoManagedObjectContext: managedContext)
        
        self.golsDetalhados.insert(gol.getGols(managedContext, detalhados: true), atIndex: 0)
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (segmentedControl.selectedSegmentIndex == segmentoGolsNaoDetalhados)
        {
            return golsNaoDetalhados[0].count
        }
        else if (segmentedControl.selectedSegmentIndex == segmentoGolsDetalhados)
        {
            return golsDetalhados[0].count
        }
        return 0
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CelulaGolNaoDetalhado = tableView.dequeueReusableCellWithIdentifier("GolAtual", forIndexPath: indexPath) as! CelulaGolNaoDetalhado
        
      //  let cell = CelulaGolNaoDetalhado()
        if (segmentedControl.selectedSegmentIndex == segmentoGolsNaoDetalhados)
        {
            let gol = golsNaoDetalhados[indexPath.section][indexPath.row]
            //let cell = CelulaGolNaoDetalhado()
            cell.textLabel?.text = "\(gol.datahora) - \(gol.detalhado)"
        }
        else if (segmentedControl.selectedSegmentIndex == segmentoGolsDetalhados)
        {
            let gol = golsDetalhados[indexPath.section][indexPath.row]
            //let cell = CelulaGolNaoDetalhado()
            cell.textLabel?.text = "\(gol.datahora) - \(gol.detalhado)"
        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "abrirNovoDetalhamentoGol")
        {
            if (segmentedControl.selectedSegmentIndex == segmentoGolsNaoDetalhados)
            {
                golSelecionado = golsNaoDetalhados[self.tableView.indexPathForSelectedRow!.section][self.tableView.indexPathForSelectedRow!.row]
                
                (segue.destinationViewController as!
                    NovoDetalhamentoGolTableViewController).golSelecionado = self.golSelecionado
            }
        }
    }


}
