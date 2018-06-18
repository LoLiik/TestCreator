//
//  File.swift
//  TestCreator
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class SingleChoiseQuestion:Question{    
    static func == (lhs: SingleChoiseQuestion, rhs: SingleChoiseQuestion) -> Bool {
        return lhs.statement == rhs.statement
    }
    
    public var result: [Theme:Double] = [:]
    var statement:String?
//        var image:UIImage?
    let questionType: QuestionType = .singleAnswer
    var status: QueryStatus = .notPassed
    var categories: [Theme]
    var answers: [Answer] = []
    var choosenAnswer: Answer? = nil
    
    
    init(categories: [Theme] = [], answers: [Answer] = []){
        self.categories = categories
        for newAnswer in answers{
            self.add(answer: newAnswer)
        }
    }
    
    public var currentCategory: [Theme]{
        return categories
    }
    
    func add(category:Theme) {
        if !self.currentCategory.contains(category){
            self.categories.append(category)
        }
    }
    
    func remove(category:Theme) -> Theme?{
        if let index = categories.index(of: category){
            return self.categories.remove(at: index)
        }
        return nil
    }
    
    func add(answer:Answer){
        guard !self.answers.contains(answer) else {return}
        for answerCategory in answer.impacts.keys{
            if !self.categories.contains(answerCategory){
                return
            }
        }
        self.answers.append(answer)
        return
        
    }
    
    func remove(answer:Answer) -> Answer?{
        if let index = answers.index(of: answer){
            return self.answers.remove(at: index)
        }
        return nil
    }
    
    func choose(answer:Answer){
        if answers.contains(answer), choosenAnswer != answer{
            choosenAnswer = answer
            result = answer.impacts
            status = .passed
        }
    }
    
    func reset(){
        switch status{
        case .passed:
            choosenAnswer = nil
            result = [:]
            status = .notPassed
        default:
            return
        }
    }
}
