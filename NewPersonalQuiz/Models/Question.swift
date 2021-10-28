//
//  Model.swift
//  NewPersonalQuiz
//
//  Created by Егор on 21.09.2021.
//

import Foundation


struct Question {
    let title: String
    let type: ResponsType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
        Question(
            title: "Какую пищу предпочитаете?",
            type: .single,
            answers: [
                Answer(title: "Стейк", type: .dog),
                Answer(title: "Рыба", type: .cat),
                Answer(title: "Морковь", type: .rabbit),
                Answer(title: "Кукуруза", type: .turtle)
            ]
        ),
        Question(
            title: "Что вам нравится больше?",
            type: .multiple,
            answers: [
                Answer(title: "Плавать", type: .dog),
                Answer(title: "Спать", type: .cat),
                Answer(title: "Обниматься", type: .rabbit),
                Answer(title: "Есть", type: .turtle)
            ]
            ),
        Question(
            title: "Любите ли вы поездки на машине?",
            type: .ranged,
            answers: [
                Answer(title: "Ненавижу", type: .dog),
                Answer(title: "Нервничаю", type: .cat),
                Answer(title: "Не замечаю", type: .rabbit),
                Answer(title: "Обожаю", type: .turtle)
            ]
            )
        ]
    }
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum ResponsType {
    case single
    case multiple
    case ranged
}

enum AnimalType: Character {
    case dog = "🐩"
    case cat = "🐈‍⬛"
    case rabbit = "🐇"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится проводить время с друзьями. Вы окружаете себя людьми которые вам нравится и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себe. Цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}
