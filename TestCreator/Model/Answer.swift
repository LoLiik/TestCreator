//
//  Answer.swift
//  TestCreator
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation
import UIKit

class Answer:Equatable{
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.text == rhs.text && lhs.image == rhs.image
    }
    
    var text:String?
    var image: UIImage?
    var correctAnswer:Bool? = nil
    var impacts:[Theme:Double] = [:]
    
    init(text: String){
        self.text = text
        self.image = nil
    }
    
    init(image:UIImage){
        self.image = image
        self.text = nil
    }
    
    init(text:String = "Default answer option", image: UIImage? = nil, correctAnswer: Bool? = nil){
        self.text = text
        self.image = image
        self.correctAnswer = correctAnswer
    }
    
    func addWeight(_ weight: Double, for category:Theme) {
        self.impacts.updateValue(weight, forKey: category)
    }
    
    func removeWeight(for category:Theme){
        self.impacts.removeValue(forKey: category)
    }
}
