//
//  ListaTiposGolTableViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 20/10/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit

protocol ListaTiposGolProtocol {
    func tipoGolSelecionado(tipoGol: Dictionary<String, Any>)
}

class ListaTiposGolTableViewController: UITableViewController {

    var delegate: ListaTiposGolProtocol?
    var tipoGolSelecionado = 0
}
