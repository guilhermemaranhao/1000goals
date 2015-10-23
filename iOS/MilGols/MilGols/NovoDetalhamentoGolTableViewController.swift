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
    
    var golSelecionado:Gol!

    //Linhas do formulário
    let linhaComoFoi = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if (indexPath.row == linhaComoFoi)
        {
            let listaTiposGolViewController:ListaTiposGolTableViewController = storyboard.instantiateViewControllerWithIdentifier("ListaTiposGolTableViewController") as! ListaTiposGolTableViewController
            listaTiposGolViewController.delegate = self
            listaTiposGolViewController.tipoGolSelecionado = golSelecionado.tipo
            self.navigationController?.pushViewController(listaTiposGolViewController, animated: true)
        }
    }
    
    func tipoGolSelecionado(tipoGol: Tipo)
    {
        golSelecionado.tipo = tipoGol
    }
}
