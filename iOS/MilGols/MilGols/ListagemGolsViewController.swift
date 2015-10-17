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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext!

        recarregarGolsNaoDetalhados()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //gol.getGolsNaoDetalhados()
    }
    
    func recarregarGolsNaoDetalhados()
    {
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        let gol = Gol(entity: entityGol!, insertIntoManagedObjectContext: managedContext)
        
        self.golsNaoDetalhados.insert(gol.getGolsNaoDetalhados(managedContext), atIndex: 0)
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golsNaoDetalhados[0].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("GolAtual", forIndexPath: indexPath) as UITableViewCell
        
        let gol = golsNaoDetalhados[indexPath.section][indexPath.row]
        let cell = CelulaGolNaoDetalhado()
        cell.textLabel?.text = "\(gol.datahora) - \(gol.detalhado)"
        
        return cell
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
