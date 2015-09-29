//
//  ViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 18/09/15.
//  Copyright (c) 2015 Scrum Masters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var marcadorGol: UIButton!

    @IBAction func registrarGol(sender: AnyObject) {
        let gol = Gol()
        gol.registrarGol()
    }
}

