//
//  ListagemGolsViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 29/09/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit

class ListagemGolsViewController: UITableViewController {

    @IBOutlet weak var tabelaGols: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tabelaGols.dataSource =

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
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
