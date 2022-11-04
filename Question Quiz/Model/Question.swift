//
//  Question.swift
//  Question Quiz
//
//  Created by Ivan Behichev on 02.11.2022.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
