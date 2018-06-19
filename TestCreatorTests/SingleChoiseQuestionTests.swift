//
//  SingleChoiseQuestionTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class SingleChoiseQuestionTests: XCTestCase {
    let mockStatement = Statement(text: "Mock Statement")
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_SingleChoiseQuestion_statusOnCreation(){
        // 1.given
        
        // 2.when
        
        let sut = SingleChoiseQuestion(statement: mockStatement)
        // 3.then
        XCTAssertEqual(sut.status, .notAnswered, "SingleChoiseQuestion has wrong status on initialization", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    func test_SingleChoiseQuestion_CreationWithSingleCategories() {
        // 1.given
        let categoriesInTest = [Theme("cars"), Theme("bikes")]
        // 2.when
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [categoriesInTest.last!])
        // 3.then
        XCTAssertEqual(sut.currentCategory.count, 1)
    }
    
    func test_SingleChoiseQuestion_CreationWithMultipleCategories() {
        // 1.given
        let categoriesInTest = [Theme("cars"), Theme("bikes")]
        // 2.when
        let sut = SingleChoiseQuestion(statement: mockStatement, categories:categoriesInTest)
        // 3.then
        XCTAssertEqual(sut.currentCategory.count, categoriesInTest.count)
    }
    
    func test_SingleChoiseQuestion_AddingCategory(){
        // 1.given
        let categoriesInTest = [Theme("cars"), Theme("bikes")]
        let sut = SingleChoiseQuestion(statement: mockStatement, categories:categoriesInTest)
        // 2.when
        sut.add(category: Theme("moto"))
        // 3.then
        XCTAssertEqual(sut.currentCategory.count, 3)
    }
    
    func test_SingleChoiseQuestion_RemovingCategory() {
        // 1.given
        let categoriesInTest = [Theme("cars"), Theme("bikes"), Theme("moto")]
        let sut = SingleChoiseQuestion(statement: mockStatement, categories:categoriesInTest)
        // 2.when
        let removedCategory = sut.remove(category: categoriesInTest.first!)
        // 3.then
        XCTAssertEqual(sut.currentCategory.count, 2)
        XCTAssertEqual(removedCategory, categoriesInTest.first)
    }
    
    func test_SingleChoiseQuestion_RemovingWrongCategory() {
        // 1.given
        let categoriesInTest = [Theme("cars"), Theme("bikes"), Theme("moto")]
        let sut = SingleChoiseQuestion(statement: mockStatement, categories:categoriesInTest)
        // 2.when
        let removedWrongCategory = sut.remove(category: Theme("bike"))
        // 3.then
        XCTAssertEqual(sut.currentCategory.count, 3)
        XCTAssertNil(removedWrongCategory)
    }
    
    func test_SingleChoiseQuestion_HasAnswer() {
        // 1.given
        let mockAnswer = Answer(text: "Mock Answer")
        let sut = SingleChoiseQuestion(statement: mockStatement)
        // 2.when
        sut.add(answer: mockAnswer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, " Answer has not been added to SingleChoiseQuestion", file: "SingleChoiseQuestion", line: 55)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithWrongCategory(){
        // 1.given
        let wrongCategory = Theme("Another theme")
        let mockAnswer = Answer()
        mockAnswer.addWeight(1, for: wrongCategory)
        let sut = SingleChoiseQuestion(statement: mockStatement)
        // 2.when
        sut.add(answer:mockAnswer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Answer with wrong category added to SingleChoiseQuestion's answers",  file: "SingleChoiseQuestion", line: 55)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithRightCategory(){
        // 1.given
        let rightCategory = Theme("Test theme")
        let mockAnswer = Answer()
        mockAnswer.addWeight(10, for: rightCategory)
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [rightCategory])
        // 2.when
        sut.add(answer:mockAnswer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Answer with right category was not added to SingleChoiseQuestion's answers",  file: "SingleChoiseQuestion", line: 55)
        XCTAssertEqual(sut.answers[0].impacts[rightCategory], 10, "Answer with right category was not added to SingleChoiseQuestion's answers",  file: "SingleChoiseQuestion", line: 55)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithRightAndWrongCategories(){
        // 1.given
        let rightCategory = Theme("Test theme")
        let wrongCategory = Theme("Another theme")
        let mockAnswer = Answer()
        mockAnswer.addWeight(1, for: wrongCategory)
        mockAnswer.addWeight(10, for: rightCategory)
        let sut = SingleChoiseQuestion(statement: mockStatement)
        // 2.when
        sut.add(answer:mockAnswer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Answer with right category was not added to SingleChoiseQuestion's answers",  file: "SingleChoiseQuestion", line: 55)
    }
    
    func test_SingleChoiseQuestion_CreatingWithRightAnswerCategory(){
        // 1.given
        let rightCategory = Theme("Test theme")
        let mockAnswer = Answer()
        mockAnswer.addWeight(1, for: rightCategory)
        // 2.when
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [rightCategory], answers: [mockAnswer])
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Right answer was not added to SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 34)
    }
    
    func test_SingleChoiseQuestion_RemovingNotLastAnswer() {
        // 1.given
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        let themeCategory = Theme("Test theme")
        for answer in mockAnswers{
            answer.addWeight(1, for: themeCategory)
        }
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [themeCategory], answers: mockAnswers)
        // 2.when
        sut.remove(answer: mockAnswers[1])
        // 3.then
        XCTAssertEqual(sut.answers.count, 2, "Second answer was not removed properly", file: "SingleChoiseQuestion.swift", line: 69)
        XCTAssertEqual(sut.answers[0], mockAnswers[0])
        XCTAssertEqual(sut.answers[1], mockAnswers[2])
    }
    
    func test_SingleChoiseQuestion_RemovingLastAnswer() {
        // 1.given
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        let themeCategory = Theme("Test theme")
        for answer in mockAnswers{
            answer.addWeight(1, for: themeCategory)
        }
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [themeCategory], answers: mockAnswers)
        // 2.when
        sut.remove(answer: sut.answers[1])
        // 3.then
        XCTAssertEqual(sut.answers.count, 2, "Last answer was not removed properly", file: "SingleChoiseQuestion.swift", line: 69)
        XCTAssertEqual(sut.answers[0], mockAnswers[0], "Last answer was not removed properly", file: "SingleChoiseQuestion.swift", line: 69)
        XCTAssertEqual(sut.answers[1], mockAnswers[2], "Last answer was not removed properly", file: "SingleChoiseQuestion.swift", line: 69)
    }
    
    
    func  test_SingleChoiseQuestion_firstAnswerChoosen(){
        // 1.given
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        let themeCategory = Theme("Test theme")
        for answer in mockAnswers{
            answer.addWeight(1, for: themeCategory)
        }
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [themeCategory], answers: mockAnswers)
        // 2.when
        sut.choose(answer: mockAnswers[0])
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, mockAnswers[0], "Choosen answer was not applied", file: "SingleChoiseQuestion.swift", line: 76)
        XCTAssertEqual(sut.result, mockAnswers[0].impacts, "Choosen answer impacts were not applied", file: "SingleChoiseQuestion.swift", line: 77)
        XCTAssertEqual(sut.status, .answered, "SingleChoiseQuestion status was not changed to passed", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    func  test_SingleChoiseQuestion_notFirstAnswerChoosen(){
        // 1.given
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        let themeCategory = Theme("Test theme")
        for answer in mockAnswers{
            answer.addWeight(1, for: themeCategory)
        }
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [themeCategory], answers: mockAnswers)
        // 2.when
        sut.choose(answer: mockAnswers[2])
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, mockAnswers[2], "Choosen answer was not applied", file: "SingleChoiseQuestion.swift", line: 76)
        XCTAssertEqual(sut.result, mockAnswers[0].impacts, "Choosen answer impacts were not applied", file: "SingleChoiseQuestion.swift", line: 77)
        XCTAssertEqual(sut.status, .answered, "SingleChoiseQuestion status was not changed to passed", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    // MARK: - If Answer has multiple effects on different categories
    func  test_SingleChoiseQuestion_hasMultipleResultsWhenAnswered(){
        // 1.given
        let testCategories = [Theme("First Theme"), Theme("Second Theme"), Theme("Third Theme")]
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        var impactCount = 4.0
        for answer in mockAnswers{
            var weight = 1.0
            for Theme in testCategories{
                answer.addWeight(weight, for: Theme)
                weight += 1
                if impactCount == weight{
                    impactCount -= 1
                    print("Answers: \(answer.impacts)")
                    break
                }
            }
        }
        
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: testCategories, answers: mockAnswers)
        // 2.when
        sut.choose(answer: mockAnswers[0])
        print("\(sut.result)")
        let result = sut.result.values.reduce(0,+)
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, mockAnswers[0], "Choosen answer was not applied", file: "SingleChoiseQuestion.swift", line: 76)
        XCTAssertEqual(sut.result.count, 3, "Choosen answer impacts were not applied", file: "SingleChoiseQuestion.swift", line: 77)
        XCTAssertEqual(result, 6, "SingleChoiseQuestion status was not changed to passed", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    func  test_SingleChoiseQuestion_chooseAnotherAnswerWhenPassed(){
        // 1.given
        let testCategories = [Theme("First Theme"), Theme("Second Theme"), Theme("Third Theme")]
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        var impactCount = 4.0
        for answer in mockAnswers{
            var weight = 1.0
            for Theme in testCategories{
                answer.addWeight(weight, for: Theme)
                weight += 1
                if impactCount == weight{
                    impactCount -= 1
                    print("Answers: \(answer.impacts)")
                    break
                }
            }
        }
        
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: testCategories, answers: mockAnswers)
        // 2.when
        sut.choose(answer: mockAnswers[0])
        sut.choose(answer: mockAnswers[1])
        print("\(sut.result)")
        let result = sut.result.values.reduce(0,+)
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, mockAnswers[1], "Choosen answer was not applied", file: "SingleChoiseQuestion.swift", line: 76)
        XCTAssertEqual(sut.result.count, 2, "Choosen answer impacts were not applied", file: "SingleChoiseQuestion.swift", line: 77)
        XCTAssertEqual(result, 3, "SingleChoiseQuestion status was not changed to passed", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    func test_SingleChoiseQuestion_ChangeStatusWhenAborted(){
        // 1.given
        let mockAnswers = [Answer(text: "First answer"), Answer(text: "Second Answer"), Answer(text: "Third Answer")]
        let themeCategory = Theme("Test theme")
        for answer in mockAnswers{
            answer.addWeight(1, for: themeCategory)
        }
        let sut = SingleChoiseQuestion(statement: mockStatement, categories: [themeCategory], answers: mockAnswers)
        // 2.when
        sut.choose(answer: mockAnswers[2])
        sut.reset()
        // 3.then
        XCTAssertEqual(sut.result.count, 0, "Result was not reseted", file: "SingleChoiseQuestion.swift", line: 76)
        XCTAssertNil(sut.choosenAnswer, "Choosen answer was not reseted to nil", file: "SingleChoiseQuestion.swift", line: 77)
        XCTAssertEqual(sut.status, .notAnswered, "SingleChoiseQuestion status was not reset to notAnswered", file: "SingleChoiseQuestion.swift", line: 77)
    }
    
    
}
