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
    
    func tipoGolSelecionado(tipoGol: Tipo)
    {
        golSelecionado.tipo = tipoGol
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "abrirListagemDeTiposDeGols")
        {
            let listaTiposGolViewController:ListaTiposGolTableViewController = segue.destinationViewController as! ListaTiposGolTableViewController
            listaTiposGolViewController.delegate = self
            listaTiposGolViewController.tipoGolSelecionado = golSelecionado.tipo
        }

    }
}
