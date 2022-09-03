//
//  ViewController.swift
//  QuizApp
//
//  Created by Sevda Gul Baran on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let score = UserDefaults.standard.string(forKey: "score") ?? "0"
        
        scoreLabel.text = "Last Score: \(score)"
        
    }
}

