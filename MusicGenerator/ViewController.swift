//
//  ViewController.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
    }


}

