//
//  Question.swift
//  TestCreator
//
//  Created by Евгений on 19.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class Question: Equatable{
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.questionType == rhs.questionType && lhs.statement == rhs.statement && lhs.categories == rhs.categories
    }
    var result: [Theme:Double] = [:]
    var categories: [Theme] = []
    var questionType: QuestionType {return .unknown}
    var statement: Statement
    
    init(statement: Statement){
        self.statement = statement
    }
    
}

enum QuestionStatus{
    case answered
    case notAnswered
}

enum QuestionType{
    case unknown
    case singleAnswer
    case multipleAnswer
    case pairs
    case scroller
}
