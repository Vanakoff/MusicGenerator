//
//  Question.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 05/12/2021.
//

struct Question {
    let title: String
    let answers: [Answer]
    let type: ResponseType
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
}
