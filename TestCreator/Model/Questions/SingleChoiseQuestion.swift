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
    
    init(statement: Statement, themes: [Theme] = [], answers: [ChoiseAnswer] = []){
        super.init(statement: statement)
        self.themes = themes
        for newAnswer in answers{
            self.add(answer: newAnswer)
        }
    }
    
    public var currentThemes: [Theme]{
        return themes
    }
    
    func add(theme:Theme) {
        if !self.currentThemes.contains(theme){
            self.themes.append(theme)
        }
    }
    
    func remove(theme:Theme){
        if let index = themes.index(of: theme){
            self.themes.remove(at: index)
        }
    }
    
    func add(answer:ChoiseAnswer){
        guard !self.answers.contains(answer) else {return}
        for answerTheme in answer.impacts.keys{
            if !self.themes.contains(answerTheme){
                return
            }
        }
        self.answers.append(answer)
        return
        
    }
    
    func remove(answer:ChoiseAnswer){
        if let index = answers.index(of: answer){
             self.answers.remove(at: index)
        }
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
