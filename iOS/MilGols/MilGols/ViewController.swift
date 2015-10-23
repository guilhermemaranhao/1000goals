//
//  ViewController.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 18/09/15.
//  Copyright (c) 2015 Scrum Masters. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    private var managedContext: NSManagedObjectContext!
    @IBOutlet weak var marcadorGol: UIButton!

    @IBAction func registrarGol(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext!
        
        let entityGol = NSEntityDescription.entityForName("Gol", inManagedObjectContext: managedContext)
        let gol = Gol(entity: entityGol!, insertIntoManagedObjectContext: managedContext)

        gol.registrarGol(managedContext)
    }
}

