//
//  TestTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 17.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class TestTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Test_addQuestion() {
        // 1.given
        let mockStatement = Statement(text: "Mock Statement")
        let question = SingleChoiseQuestion(statement: mockStatement)
        let sut = Interview()
        // 2.when
        sut.add(question: question)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 1, "Error when add one question to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addSameQuestion(){
        // 1.given
        let mockStatement = Statement(text: "Mock Statement")
        let question = SingleChoiseQuestion(statement: mockStatement)
        let sut = Interview()
        // 2.when
        sut.add(question: question)
        sut.add(question: question)
        sut.add(question: question)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 1, "Error when add same question to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addEqualQuestion(){
        // 1.given
        let mockStatement = Statement(text: "Mock Statement")
        let firstQuestion = SingleChoiseQuestion(statement: mockStatement)
        let secondQuestion = SingleChoiseQuestion(statement: mockStatement)
        let sut = Interview()
        // 2.when
        sut.add(question: firstQuestion)
        sut.add(question: secondQuestion)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 1, "Error when add equal question Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addTwoQuestionsOfSameTypeWithDifferentStatesments(){
        // 1.given
        
        let firstStatement = Statement(text: "Mock Statement")
        let firstQuestion = SingleChoiseQuestion(statement: firstStatement)
        let secondStatement = Statement(text: "Another Statement")
        let secondQuestion = SingleChoiseQuestion(statement: secondStatement)
        let sut = Interview()
        // 2.when
        sut.add(question: firstQuestion)
        sut.add(question: secondQuestion)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 2, "Error when add two questions of same type with different statesments to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addMTwoQuestionsOfDifferentTypesWithSameStatement(){
        // 1.given
        let firstStatement = Statement(text: "Mock Statement")
        let firstQuestion = SingleChoiseQuestion(statement: firstStatement)
        class differentQuestionType:Question{
            override var questionType: QuestionType {return .multipleAnswer}
        }
        let differentStatement: Statement = Statement(text: "Some Statement")
        let secondQuestion = differentQuestionType(statement: differentStatement)
        let sut = Interview()
        // 2.when
        sut.add(question: firstQuestion)
        sut.add(question: secondQuestion)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 2, "Error when add two questions of different types with same statesment to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_removeExistingQuestion(){
        // 1.given
        let mockStatement = Statement(text: "Mock Statement")
//        let question: SingleChoiseQuestion = SingleChoiseQuestion()
        XCTFail()
//        if let statement = mockStatement {
//            question = SingleChoiseQuestion(statement: statement)
//        }else{
//            XCTFail()
//        }
//        let sut = Interview()
//        sut.add(question: question)
//        // 2.when
//        sut.remove(question: question)
//        // 3.then
//        // FIXME: - check line
//        XCTAssertEqual(sut.questions.count, 0, "Error when delete existing question from Interview", file: "Interview.swift", line: 0)
    }
    
}
