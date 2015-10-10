//
//  ListagemGolsViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 29/09/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit

class ListagemGolsViewController: UITableViewController {
    
    var gol = Gol()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerNib(UINib(nibName: "GolAtual", bundle: nil), forCellReuseIdentifier: "GolAtual")
       // tabelaGols.dataSource =

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //gol.getGolsNaoDetalhados()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let data =
        
        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("GolAtual", forIndexPath: indexPath) as UITableViewCell
        
        let cell = dequeued as! CelulaGolNaoDetalhado
        cell.textLabel?.text = "Teste - Gol Não detalhado!"
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
