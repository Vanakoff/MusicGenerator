//
//  Question.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 05/12/2021.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "What type of food do you like?",
                type: .single,
                answers: [
                    Answer(title: "Stake", animal: .dog),
                    Answer(title: "Fish", animal: .cat),
                    Answer(title: "Carrot", animal: .rabbit),
                    Answer(title: "Corn", animal: .turtle)
                ]
            ),
            Question(
                title: "What do you like the most?",
                type: .multiple,
                answers: [
                    Answer(title: "To Swim", animal: .dog),
                    Answer(title: "To Sleep", animal: .cat),
                    Answer(title: "To Hug", animal: .rabbit),
                    Answer(title: "To Eat", animal: .turtle)
                ]
            ),
            Question(
                title: "Do you like car rides?",
                type: .ranged,
                answers: [
                    Answer(title: "Hate", animal: .cat),
                    Answer(title: "Disappointed", animal: .rabbit),
                    Answer(title: "No matter", animal: .turtle),
                    Answer(title: "Like", animal: .dog)
                ]
            )
       
        ]
    }
}

struct Answer {
    let title: String
    let animal: Animal
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are a Dog"
        case .cat:
            return "You are a Cat"
        case .rabbit:
            return "You are a Rabbit"
        case .turtle:
            return "You are a Turtle"
        }
    }
}
