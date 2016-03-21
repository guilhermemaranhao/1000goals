//
//  DetalhamentoGolTableViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 16/10/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//


import UIKit
import CoreData

class NovoDetalhamentoGolTableViewController: UITableViewController, ListaTiposGolProtocol {
    
    var golSelecionado:Gol?

    //Seções e linhas
    let secaoDetalhe=0
    let linhaTipo = 0
    
    let secaoImprensa=1
    let linhaFoto=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellDetalheGol")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func getTipoGolSelecionado(tipoGol: Tipo)
    {
        golSelecionado!.tipo = tipoGol
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       var cell: UITableViewCell
       cell = tableView.dequeueReusableCellWithIdentifier("cellDetalheGol", forIndexPath: indexPath)
        
       switch (indexPath.section)
       {
            case secaoDetalhe:
                switch(indexPath.row)
                {
                    case linhaTipo:
                        if (golSelecionado!.tipo == nil)
                        {
                            cell.textLabel!.text = "Como foi?"
                        }
                        else
                        {
                            cell.textLabel!.text = golSelecionado!.tipo!.descricao
                        }
                        break
                    default:
                        break
                }
            case secaoImprensa:
                switch (indexPath.row)
                {
                    case linhaFoto:
                        cell.textLabel?.text = "Adicione foto"
                        break
                    default:
                    break
                }
        default:
                break
        }
    
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if (indexPath.section == secaoDetalhe && indexPath.row == linhaTipo)
        {
            let listaTiposGolViewController: ListaTiposGolTableViewController = storyboard.instantiateViewControllerWithIdentifier("ListaTiposGolTableViewController") as! ListaTiposGolTableViewController
            listaTiposGolViewController.delegate = self
            self.navigationController?.pushViewController(listaTiposGolViewController, animated: true)
        }
    }
    
    @IBAction func detalharGol(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        golSelecionado!.detalhar(managedContext!)
    }
    
}
