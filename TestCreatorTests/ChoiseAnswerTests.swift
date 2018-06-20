//
//  AnswerTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class ChoiseAnswerTests: XCTestCase {
    
    func test_Answer_HasTextWithNilImage(){
        // 1.given
        let answerText = "First option of  answer"
        // 2.when
        let sut = ChoiseAnswer(text: answerText)
        // 3.then
        XCTAssertEqual(sut.text, answerText, "Answer has wrong text", file : "Answer.swift", line: 23)
    }
    
    func test_Answer_HasImageWithNilText(){
        // 1.given
        let answerImageURL = URL(string: "")
        // 2.when
        let sut = ChoiseAnswer(imageURL: answerImageURL)
        // 3.then
        XCTAssertEqual(sut.imageURL, answerImageURL, "Answer has wrong imageURL", file : "Answer.swift", line: 28)
    }
    
    func test_Answer_HasImageAndText(){
        // 1.given
        let answerText = "First option of  answer"
        let answerImageURL = URL(string: "")
        // 2.when
        let sut = ChoiseAnswer(text: answerText, imageURL: answerImageURL)
        // 3.then
        XCTAssertEqual(sut.imageURL, answerImageURL, "Answer has wrong imageURL", file : "Answer.swift", line: 34)
        XCTAssertEqual(sut.text, answerText, "Answer has wrong text", file : "Answer.swift", line: 33)
    }
    
    func test_Answer_EmptyInitWithDefault(){
        // 1.given
        // 2.when
        let sut = ChoiseAnswer()
        // 3.then
        XCTAssertEqual(sut.text, "", "Answer has wrong text", file : "Answer.swift", line: 32)
    }
    
    func test_Answer_AddWeightForTheme(){
        // 1.given
        let theme = Theme()
        let weight = 0.0
        let sut = ChoiseAnswer()
        // 2.when
        sut.addWeight(weight, for: theme)
        // 3.then
        XCTAssertEqual(sut.impacts.count, 1, "Answer's impacts has wrong length", file : "Answer.swift", line: 39)
    }
    
    func test_Answer_AddWeightForExistingTheme(){
        // 1.given
        let theme = Theme()
        let sut = ChoiseAnswer()
        let weight = 0.0
        sut.addWeight(weight, for: theme)
        // 2.when
        sut.addWeight(weight, for: theme)
        // 3.then
        XCTAssertEqual(sut.impacts.count, 1, "Answer's impacts has wrong length", file : "Answer.swift", line: 39)
    }
    
    func test_Answer_UpdateWeightValueForExistingTheme(){
        // 1.given
        let theme = Theme()
        let sut = ChoiseAnswer()
        let initialWeight = 0.0
        sut.addWeight(initialWeight, for: theme)
        let newWeight = 10.0
        // 2.when
        sut.addWeight(newWeight, for: theme)
        // 3.then
        XCTAssertEqual(sut.impacts[theme], 10.0, "Answer's impacts has wrong length", file : "Answer.swift", line: 39)
    }
    
    func test_Answer_RemoveWeightForCategories(){
        // 1.given
        let theme = Theme()
        let sut = ChoiseAnswer()
        let weight = 0.0
        sut.addWeight(weight, for: theme)
        // 2.when
        sut.removeWeight(for: theme)
        // 3.then
        XCTAssertEqual(sut.impacts.count, 0, "Answer's impacts has wrong length", file : "Answer.swift", line: 43)
    }
    
    
    
}
