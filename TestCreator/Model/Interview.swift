//
//  Test.swift
//  TestCreator
//
//  Created by Евгений on 17.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

protocol Question{
//    static func ==(lhs:Question, rhs:Question) -> Bool
    var result: [Theme:Double] {get set}
    var categories: [Theme] {get set}
    var questionType: QuestionType {get}
    var statement: String? {get set}
}

enum QueryStatus{
    case passed
    case notPassed
}

enum QuestionType{
    case singleAnswer
    case multipleAnswer
    case pairs
    case scroller
}


class Interview
{
    var questions:[Question]
    
    init(){
        self.questions = []
    }
    
    func add(question: Question){
        if !self.questions.contains(where: { $0.questionType == question.questionType && $0.statement == question.statement}){
            self.questions.append(question)
        }
    }
}
