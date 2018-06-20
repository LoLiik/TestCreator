//
//  File.swift
//  TestCreator
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class SingleChoiseQuestion:Question{
    override var questionType: QuestionType{return .singleAnswer}
    var status: QuestionStatus = .notAnswered
    var answers: [ChoiseAnswer] = []
    var choosenAnswer: ChoiseAnswer? = nil
    
    
    init(statement: Statement, categories: [Theme] = [], answers: [ChoiseAnswer] = []){
        super.init(statement: statement)
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
    
    func add(answer:ChoiseAnswer){
        guard !self.answers.contains(answer) else {return}
        for answerCategory in answer.impacts.keys{
            if !self.categories.contains(answerCategory){
                return
            }
        }
        self.answers.append(answer)
        return
        
    }
    
    func remove(answer:ChoiseAnswer) -> ChoiseAnswer?{
        if let index = answers.index(of: answer){
            return self.answers.remove(at: index)
        }
        return nil
    }
    
    func choose(answer:ChoiseAnswer){
        if answers.contains(answer), choosenAnswer != answer{
            choosenAnswer = answer
            result = answer.impacts
            status = .answered
        }
    }
    
    func reset(){
        switch status{
        case .answered:
            choosenAnswer = nil
            result = [:]
            status = .notAnswered
        default:
            return
        }
    }
}
