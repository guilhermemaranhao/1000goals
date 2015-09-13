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
        let size = CGSizeMake(imagem!.size.width / 3.0, imagem!.size.height / 3.0)
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Utilizar o fator de escala da tela principal
      
        UIGraphicsBeginImageContextWithOptions(size, hasAlpha, scale)
       imagem?.drawInRect(CGRect(origin: CGPointZero, size: size))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
   
       marcadorGol.setImage(scaledImage, forState: UIControlState.Normal)
        
      // UIGraphicsEndImageContext()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

