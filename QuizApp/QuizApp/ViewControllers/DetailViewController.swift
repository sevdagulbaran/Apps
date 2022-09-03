//
//  DetailViewController.swift
//  QuizApp
//
//  Created by Sevda Gul Baran on 3.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    let questions = ["Simyacı kitabının yazarı kim?", "Gezegenler isimlerini nereden alıyor?", "Güneş sistemimizde kaç gezegen var?"]
    let answers = [["Paulo Coelho", "Osho", "Lev Tolstoy"], ["Yunan Tanrılarından.", "Onları keşfeden bilim adamlarından.", "Latince kelimelerden."], ["8", "9", "10"]]
    
    
    @IBOutlet private weak var aButton: UIButton!
    @IBOutlet private weak var cButton: UIImageView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var bButton: UIButton!
    
    private var currentQuestion = 0
    var score = 0
    private var rightAnswer:UInt32 = 0
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aButton.layer.cornerRadius = 12
        bButton.layer.cornerRadius = 12
        cButton.layer.cornerRadius = 12
        
    }
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
    }
    @IBAction func tappedButton(_ sender: UIButton) {
        if sender.tag == Int(rightAnswer) {
            
            print("RIGHT!!")
            score += 1
        }
        else {
            print("WRONG!!!!!")
        }
        
        if currentQuestion != questions.count {
            
            nextQuestion()
            
        }else {
            defaults.set(String(score), forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
   private func nextQuestion() {
        
        questionLabel.text = questions[currentQuestion]
        
        rightAnswer = arc4random_uniform(3) + 1
        
        var button = UIButton()
        
        var x = 1
        
        for i in 1...3 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer) {
                
                button.setTitle(answers[currentQuestion][0], for: .normal)
                
            }else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
}



