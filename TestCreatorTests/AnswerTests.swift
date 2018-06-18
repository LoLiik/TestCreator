//
//  AnswerTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class AnswerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Answer_HasTextWithNilImage(){
        // 1.given
        let answerText = "First option of  answer"
        // 2.when
        let sut = Answer(text: answerText)
        // 3.then
        XCTAssertEqual(sut.text, answerText, "Answer has wrong text", file : "Answer.swift", line: 23)
        XCTAssertNil(sut.image,  "Answer image not nil", file : "Answer.swift", line: 24)
    }
    
    func test_Answer_HasImageWithNilText(){
        // 1.given
        let answerImage = UIImage()
        // 2.when
        let sut = Answer(image: answerImage)
        // 3.then
        XCTAssertEqual(sut.image, answerImage, "Answer has wrong image", file : "Answer.swift", line: 28)
        XCTAssertNil(sut.text,  "Answer's text not nil", file : "Answer.swift", line: 29)
    }
    
    func test_Answer_HasImageWithText(){
        // 1.given
        let answerText = "First option of  answer"
        let answerImage = UIImage()
        // 2.when
        let sut = Answer(text: answerText, image: answerImage)
        // 3.then
        XCTAssertEqual(sut.image, answerImage, "Answer has wrong image", file : "Answer.swift", line: 34)
        XCTAssertEqual(sut.text, answerText, "Answer has wrong text", file : "Answer.swift", line: 33)
        XCTAssertNil(sut.correctAnswer, "Answer's correctAnswer is not nil", file : "Answer.swift", line: 35)
    }
    
    func test_Answer_EmptyInitWithDefault(){
        // 1.given
        let defaultText = "Default answer option"
        // 2.when
        let sut = Answer()
        // 3.then
        XCTAssertEqual(sut.text, defaultText, "Answer has wrong text", file : "Answer.swift", line: 32)
        XCTAssertNil(sut.image, "Answer's image is not nil", file : "Answer.swift", line: 32)
        XCTAssertNil(sut.correctAnswer, "Answer's correctAnswer is not nil", file : "Answer.swift", line: 32)
    }
    
    func test_Answer_AddWeightForCategories(){
        // 1.given
        let categories = [Theme("one"),Theme("two"), Theme("three")]
        let sut = Answer()
        var weight = -1.0
        // 2.when
        for category in categories{
            sut.addWeight(weight, for: category)
            weight += 1
        }
        // 3.then
        XCTAssertEqual(sut.impacts.count, 3, "Answer's impacts has wrong length", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[0]], -1, "Answer's impacts[0] is wrong", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[1]], 0, "Answer's impacts[1] is wrong", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[2]], 1, "Answer's impacts[2] is wrong", file : "Answer.swift", line: 39)
    }
    
    func test_Answer_UpdateWeightForExistingCategories(){
        // 1.given
        let categories = [Theme("one"),Theme("two"), Theme("three")]
        let sut = Answer()
        var weight = -1.0
        for category in categories{
            sut.addWeight(weight, for: category)
            weight += 1
        }
        weight = 99
        // 2.when
        for category in categories{
            sut.addWeight(weight, for: category)
            weight += 10
        }
        // 3.then
        XCTAssertEqual(sut.impacts.count, 3, "Answer's impacts has wrong length", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[0]], 99, "Answer's impacts[0] is wrong", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[1]], 109, "Answer's impacts[1] is wrong", file : "Answer.swift", line: 39)
        XCTAssertEqual(sut.impacts[categories[2]], 119, "Answer's impacts[2] is wrong", file : "Answer.swift", line: 39)
    }
    
    func test_Answer_RemoveWeightForCategories(){
        // 1.given
        let categories = [Theme("one"),Theme("two"), Theme("three")]
        let sut = Answer()
        var weight = -1.0
        for category in categories{
            sut.addWeight(weight, for: category)
            weight += 1
        }
        // 2.when
        sut.removeWeight(for: categories[0])
        sut.removeWeight(for: categories[2])
        
        // 3.then
        
        XCTAssertEqual(sut.impacts.count, 1, "Answer's impacts has wrong length", file : "Answer.swift", line: 43)
        XCTAssertNil(sut.impacts[categories[0]], "Answer's impacts removed weight exists", file : "Answer.swift", line: 43)
        XCTAssertNil(sut.impacts[categories[2]], "Answer's impacts has wrong length", file : "Answer.swift", line: 43)
        XCTAssertEqual(sut.impacts[categories[1]], 0, "Answer's impacts weight has wrong value after remove of another weight", file : "Answer.swift", line: 43)
    }
    
    
    
}
