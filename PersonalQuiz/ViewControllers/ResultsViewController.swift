//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
   
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionResultLabel: UILabel!
    
    var answersChoosen = [Answer]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navItem.hidesBackButton = true
        
        result()
    }
    
    private func result() {
        let result = calculateResult()
        
        resultLabel.text = String(result!.rawValue)
        definitionResultLabel.text = result?.definition
    }

    private func calculateResult() -> AnimalType? {
        var chosenAnimal: AnimalType?
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for answer in answersChoosen {
            switch answer.type{
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        switch max(dog, cat, rabbit, turtle) {
        case dog:
            chosenAnimal = .dog
        case cat:
            chosenAnimal = .cat
        case rabbit:
            chosenAnimal = .rabbit
        case turtle:
            chosenAnimal = .turtle
        default:
            break
        }
        
        return chosenAnimal
    }
    
    
    
    
}
