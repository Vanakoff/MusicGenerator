//
//  ViewController.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Instance of Model
    let questions = Question.getQuestions()

    //MARK: Outlets
    @IBOutlet var logoImageView: UIImageView!
    
    //MARK: Settings
    override func viewDidLoad() {
        super.viewDidLoad()
       
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
    }
    
    //MARK: Actions
    @IBAction func howItWorksButtonTapped() {
        showAlert(title: "Music Generator", message: "Choose answers that matches best on current you to get the most interesting musical playlist")
    }
    
    @IBAction func aboutAppButtonTapped() {
        showAlert(title: "Information", message: "Pet project, MVC based app")
    }
    
}

//MARK: Extensions
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
