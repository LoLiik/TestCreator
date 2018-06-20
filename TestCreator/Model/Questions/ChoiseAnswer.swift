//
//  Answer.swift
//  TestCreator
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation
import UIKit

class ChoiseAnswer:Equatable{
    static func == (lhs: ChoiseAnswer, rhs: ChoiseAnswer) -> Bool {
        return lhs.text == rhs.text && lhs.imageURL == rhs.imageURL
    }
    
    var text:String?
    var imageURL: URL?
    var correctAnswer:Bool? = nil
    var impacts:[Theme:Double] = [:]
    
    init(text: String){
        self.text = text
        self.imageURL = nil
    }
    
    init(image:URL){
        self.imageURL = image
        self.text = nil
    }
    
    init(text:String? = "", imageURL: URL? = nil, correctAnswer: Bool? = nil){
        guard text != nil || imageURL != nil || correctAnswer != nil else {
            self.text = ""
            return
        }
        self.text = text
        self.imageURL = imageURL
        self.correctAnswer = correctAnswer
    }
    
    func addWeight(_ weight: Double, for category:Theme) {
        self.impacts.updateValue(weight, forKey: category)
    }
    
    func removeWeight(for category:Theme){
        self.impacts.removeValue(forKey: category)
    }
}
