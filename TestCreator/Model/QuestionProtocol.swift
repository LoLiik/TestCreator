//
//  QuestionProtocol.swift
//  TestCreator
//
//  Created by Евгений on 18.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation
protocol QuestionProtocol{
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
