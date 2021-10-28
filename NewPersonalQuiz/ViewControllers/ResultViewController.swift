//
//  ResultViewController.swift
//  NewPersonalQuiz
//
//  Created by Егор on 21.09.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var discribtionTypeLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateResults()
    }
    
}

extension ResultViewController {
    
    private func updateResults() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        var animals: [AnimalType] = []
        
        for answer in answers {
            animals.append(answer.type)
        } //  тоже самое что и написать let animals: [AnimalType] = { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimals = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimals)
    }
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐩")"
        discribtionTypeLabel.text = animal?.definition ?? "?"
    }
    
}
