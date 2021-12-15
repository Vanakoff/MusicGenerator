//
//  ResultViewController.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 13/12/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImageView: UIImageView!
    
    //MARK: Instances
    var answers: [Answer]!
    
    //MARK: Settings
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    //MARK: Actions
    
    private func updateResult() {
        let mostFrequentAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        resultLabel.text = "\(animal?.rawValue ?? "🙃") + \(animal?.definition ?? "0")"
    }
    
    @IBAction func shareButtonPressed() {
        let activityVC = UIActivityViewController(
            activityItems:
                ["Share some info"],
            applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}

