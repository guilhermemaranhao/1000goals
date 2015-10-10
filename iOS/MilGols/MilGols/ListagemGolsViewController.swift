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
    
    var gol = Gol()
    private var managedContext: NSManagedObjectContext!
    var golsNaoDetalhados = [Gol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        recarregarGolsNaoDetalhados()
        self.tableView.reloadData()
        //gol.getGolsNaoDetalhados()
    }
    
    func recarregarGolsNaoDetalhados()
    {
        let fetchRequest = NSFetchRequest(entityName: "Gol")
        
        do {
            if let gols = try managedContext.executeFetchRequest(fetchRequest) as? [Gol] {
                golsNaoDetalhados = gols
            }
        } catch {
            fatalError("Erro ao carregar listagem de gols não detalhados")
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golsNaoDetalhados.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("GolAtual", forIndexPath: indexPath) as UITableViewCell
        
        let gol = golsNaoDetalhados[indexPath.row]
        let cell = dequeued as! CelulaGolNaoDetalhado
        cell.textLabel?.text = "\(gol.datahora) - \(gol.detalhado)"
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
