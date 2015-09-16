//
//  ViewController.swift
//  1000gols
//
//  Created by Guilherme Maranhao on 08/09/15.
//  Copyright (c) 2015 Scrum Masters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marcadorGol: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.m
        
        let imagem = UIImage(named: "ball_icon")
        
        marcadorGol.setImage(imagem, forState: UIControlState.Normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registrarGol(sender: AnyObject) {
        
    }

}

