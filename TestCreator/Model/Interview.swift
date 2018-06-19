//
//  Test.swift
//  TestCreator
//
//  Created by Евгений on 17.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class Interview
{
    var questions:[Question]
    
    init(){
        self.questions = []
    }
    
    func add(question: Question){
        if !self.questions.contains(question){
            self.questions.append(question)
        }
    }
    
    func remove(question: Question){
        
    }
}
