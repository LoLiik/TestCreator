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
        let question = SingleChoiseQuestion()
        let sut = Interview()
        // 2.when
        sut.add(question: question)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 1, "Error when add one question to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addMultipleQuestionsOfSameTypeWithDiffrentStatesment() {
        // 1.given
        let firstQuestion = SingleChoiseQuestion()
        firstQuestion.statement = "First question"
        let secondQuestion = SingleChoiseQuestion()
        secondQuestion.statement = "Second question"
        let sut = Interview()
        // 2.when
        sut.add(question: firstQuestion)
        sut.add(question: secondQuestion)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 2, "Error when add more then one question of same type to Interview", file: "Interview.swift", line: 39)
    }
    
    func test_Interview_addSameQuestion(){
        // 1.given
        let question = SingleChoiseQuestion()
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
        let firstQuestion = SingleChoiseQuestion()
        firstQuestion.statement = "String"
        let secondQuestion = SingleChoiseQuestion()
        secondQuestion.statement = "String"
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
        let firstQuestion = SingleChoiseQuestion()
        firstQuestion.statement = "First question"
        let secondQuestion = SingleChoiseQuestion()
        secondQuestion.statement = "Second question"
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
        let firstQuestion = SingleChoiseQuestion()
        firstQuestion.statement = "First question"
        class differentQuestionType:Question{
            var result: [Theme : Double]
            var categories: [Theme]
            let questionType: QuestionType = .multipleAnswer
            var statement: String? = "First question"
            
            init() {
                categories = []
                result = [:]
            }
        }
        let secondQuestion = differentQuestionType()
        secondQuestion.statement = "First question"
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
        let question = SingleChoiseQuestion()
        let sut = Interview()
        sut.add(question: question)
        // 2.when
        sut.remove(question: question)
        // 3.then
        // FIXME: - check line
        XCTAssertEqual(sut.questions.count, 0, "Error when delete existing question from Interview", file: file: "Interview.swift", line: 0)
    }
    
}
