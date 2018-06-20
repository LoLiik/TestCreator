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
    
    func makeSUT(statement: Statement = Statement(), themes: [Theme] = [], answers: [ChoiseAnswer] = []) -> SingleChoiseQuestion {
        return SingleChoiseQuestion(statement: statement, themes: themes, answers: answers)
    }
    
    func test_SingleChoiseQuestion_CreationWithSingleTheme() {
        // 1.given
        let theme = Theme("Topic 1")
        // 2.when
        let sut = makeSUT(themes: [theme])
        // 3.then
        XCTAssertEqual(sut.currentThemes.count, 1, "Error: wrong themes on initialization of SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 17)
    }
    
    func test_SingleChoiseQuestion_CreationWithMultipleThemes() {
        // 1.given
        let themes = [Theme("Topic 1"), Theme("bikes")]
        // 2.when
        let sut = makeSUT(themes:themes)
        // 3.then
        XCTAssertEqual(sut.currentThemes.count, themes.count, "Error: wrong themes on initialization of SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 17)
    }
    
    func test_SingleChoiseQuestion_AddingTheme(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2")]
        let sut = makeSUT(themes: themes)
        // 2.when
        sut.add(theme: Theme("Topic 3"))
        // 3.then
        XCTAssertEqual(sut.currentThemes.count, 3, "Error: when add theme to SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 29)
    }
    
    func test_SingleChoiseQuestion_RemovingTheme() {
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2")]
        let sut = makeSUT(themes:themes)
        // 2.when
        sut.remove(theme: themes[0])
        // 3.then
        XCTAssertEqual(sut.currentThemes.count, 1, "Error: when remove theme from SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 35)
    }
    
    func test_SingleChoiseQuestion_RemovingWrongTheme() {
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2")]
        let sut = makeSUT(themes: themes)
        // 2.when
        sut.remove(theme: Theme("Wrong Topic"))
        // 3.then
        XCTAssertEqual(sut.currentThemes.count, 2, "Error: when remove not existing theme from SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 36)
    }
    
    func test_SingleChoiseQuestion_HasAnswer() {
        // 1.given
        let answer = ChoiseAnswer(text: "Mock Answer")
        // 2.when
        let sut = makeSUT(answers: [answer])
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Error: answer has not been added to SingleChoiseQuestion", file: "SingleChoiseQuestion", line: 17)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithWrongTheme(){
        // 1.given
        let wrongTheme = Theme("Wrong Topic")
        let answerWithWrongTheme = ChoiseAnswer()
        answerWithWrongTheme.addWeight(0.0, for: wrongTheme)
        let sut = makeSUT()
        // 2.when
        sut.add(answer:answerWithWrongTheme)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Error: Answer with wrong theme added to SingleChoiseQuestion",  file: "SingleChoiseQuestion", line: 43)
    }
    
    
    func test_SingleChoiseQuestion_AddingAnswerWithEmptyThemeTo_QuestionWithEmptyTheme(){
        // 1.given
        let emptyTheme = Theme()
        let answerWithEmptyTheme = ChoiseAnswer()
        answerWithEmptyTheme.addWeight(0.0, for: emptyTheme)
        let sut = makeSUT(themes:[emptyTheme])
        // 2.when
        sut.add(answer:answerWithEmptyTheme)
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Error: Answer with empty theme was not added to SingleChoiseQuestion with empty themes",  file: "SingleChoiseQuestion", line: 43)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithEmptyThemeTo_QuestionWithNoTheme(){
        // 1.given
        let emptyTheme = Theme()
        let answerWithEmptyTheme = ChoiseAnswer()
        answerWithEmptyTheme.addWeight(0.0, for: emptyTheme)
        let sut = makeSUT()
        // 2.when
        sut.add(answer:answerWithEmptyTheme)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Error: Answer with empty theme was not added to SingleChoiseQuestion with no themes",  file: "SingleChoiseQuestion", line: 43)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithNoThemeTo_QuestionWithNoTheme(){
        // 1.given
        let answerWithNoTheme = ChoiseAnswer()
        let sut = makeSUT()
        // 2.when
        sut.add(answer:answerWithNoTheme)
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Error: Answer with no theme was not added to SingleChoiseQuestion with no themes",  file: "SingleChoiseQuestion", line: 43)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithEmptyThemeTo_QuestionWithWithTheme(){
        // 1.given
        let theme = Theme("Topic 1")
        let emptyTheme = Theme()
        let answerWithEmptyTheme = ChoiseAnswer()
        answerWithEmptyTheme.addWeight(0.0, for: emptyTheme)
        let sut = makeSUT(themes: [theme])
        // 2.when
        sut.add(answer:answerWithEmptyTheme)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Error: Answer with empty theme was added to SingleChoiseQuestion with theme",  file: "SingleChoiseQuestion", line: 43)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithRightTheme(){
        // 1.given
        let theme = Theme("Topic 1")
        let answer = ChoiseAnswer()
        answer.addWeight(10, for: theme)
        let sut = makeSUT(themes: [theme])
        // 2.when
        sut.add(answer:answer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Error: Answer was not added to SingleChoiseQuestion",  file: "SingleChoiseQuestion", line: 48)
    }
    
    func test_SingleChoiseQuestion_AddingAnswerWithRightAndWrongThemes(){
        // 1.given
        let theme = Theme("Topic 1")
        let wrongTheme = Theme("Wrong Topic")
        let answer = ChoiseAnswer()
        answer.addWeight(1.0, for: wrongTheme)
        answer.addWeight(10.0, for: theme)
        let sut = makeSUT(themes: [theme])
        // 2.when
        sut.add(answer:answer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 0, "Error: Answer with right and wrong themes was added to SingleChoiseQuestion",  file: "SingleChoiseQuestion", line: 43)
    }
    
    func test_SingleChoiseQuestion_CreatingWithRightAnswerTheme(){
        // 1.given
        let theme = Theme("Topic 1")
        let answer = ChoiseAnswer()
        answer.addWeight(1, for: theme)
        // 2.when
        let sut = makeSUT(themes: [theme], answers: [answer])
        // 3.then
        XCTAssertEqual(sut.answers.count, 1, "Right answer was not added to SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 21)
    }
    
    func test_SingleChoiseQuestion_RemovingAnswer() {
        // 1.given
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second Answer"), ChoiseAnswer(text: "Third Answer")]
        let theme = Theme("Topic 1")
        for answer in answers{
            answer.addWeight(1, for: theme)
        }
        let sut = makeSUT( themes: [theme], answers: answers)
        // 2.when
        sut.remove(answer: answers[0])
        // 3.then
        XCTAssertEqual(sut.answers.count, 2, "Error: answer was not removed", file: "SingleChoiseQuestion.swift", line: 37)
    }
    
    func test_SingleChoiseQuestion_RemovingWrongAnswer() {
        // 1.given
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second Answer")]
        let notAddedAnswer = ChoiseAnswer(text: "Third Answer")
        let sut = makeSUT(answers: answers)
        // 2.when
        sut.remove(answer: notAddedAnswer)
        // 3.then
        XCTAssertEqual(sut.answers.count, 2, "Error: when remove answer that was not in SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 54)
    }
    
    func test_SingleChoiseQuestion_statusOnCreation(){
        // 1.given
        // 2.when
        let sut = makeSUT()
        // 3.then
        XCTAssertEqual(sut.status, .notAnswered, "Error: wrong status on initialization of SingleChoiseQuestion", file: "SingleChoiseQuestion.swift", line: 13)
    }
    
    func  test_SingleChoiseQuestion_choseAnswer(){
        // 1.given
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second Answer"), ChoiseAnswer(text: "Third Answer")]
        let theme = Theme("Test theme")
        for answer in answers{
            answer.addWeight(1, for: theme)
        }
        let sut = makeSUT(themes: [theme], answers: answers)
        // 2.when
        sut.choose(answer: answers[2])
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, answers[2], "Error: Choosen answer was not applied", file: "SingleChoiseQuestion.swift", line: 61)
    }
    
    func  test_SingleChoiseQuestion_changeResultOnAnswerChoosen(){
        // 1.given
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second Answer"), ChoiseAnswer(text: "Third Answer")]
        let theme = Theme("Test theme")
        for answer in answers{
            answer.addWeight(1, for: theme)
        }
        let sut = makeSUT(themes: [theme], answers: answers)
        // 2.when
        sut.choose(answer: answers[2])
        // 3.then
        XCTAssertEqual(sut.result, answers[2].impacts, "Error: result was not applied when answer was choosen", file: "SingleChoiseQuestion.swift", line: 62)
    }
    
    func  test_SingleChoiseQuestion_hasMultipleResultsWhenAnswered(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answer = ChoiseAnswer(text: "First answer")
        answer.addWeight(0.0, for: themes[0])
        answer.addWeight(0.0, for: themes[1])
        answer.addWeight(0.0, for: themes[2])
        
        let sut = makeSUT(themes: themes, answers: [answer])
        // 2.when
        sut.choose(answer: sut.answers[0])
        // 3.then
        XCTAssertEqual(sut.result.count, 3, "Error: multiple result was not applied when answer was choosen", file: "SingleChoiseQuestion.swift", line: 62)
    }
    
    func  test_SingleChoiseQuestion_ChangeStatusOnAnswerChoosen(){
        // 1.given
        let answers = [ChoiseAnswer(text: "First answer")]
        let theme = Theme("Topic 1")
        for answer in answers{
            answer.addWeight(1.0, for: theme)
        }
        let sut = makeSUT(themes: [theme], answers: answers)
        // 2.when
        sut.choose(answer: answers[0])
        // 3.then
        XCTAssertEqual(sut.status, .answered, "Error: status wasn't change when chose answer", file: "SingleChoiseQuestion.swift", line: 63)
    }
    
    func  test_SingleChoiseQuestion_AnswerChangedWhenChooseAnotherAnswer(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.choose(answer: sut.answers[1])
        // 3.then
        XCTAssertEqual(sut.choosenAnswer, answers[1], "Error: answer was not changed when different answer was choosen", file: "SingleChoiseQuestion.swift", line: 61)
    }
    
    func  test_SingleChoiseQuestion_ResultChangedWhenChooseAnotherAnswer(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.choose(answer: sut.answers[1])
        // 3.then
        XCTAssertEqual(sut.result, answers[1].impacts, "Error: result was not applied when different answer was choosen", file: "SingleChoiseQuestion.swift", line: 62)
    }
    
    func  test_SingleChoiseQuestion_StatusNotChangedWhenChooseAnotherAnswer(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.choose(answer: sut.answers[1])
        // 3.then
        XCTAssertEqual(sut.status, .answered, "Error: status was changed to .notAnswered when different answer was choosen", file: "SingleChoiseQuestion.swift", line: 63)
    }

    func test_SingleChoiseQuestion_ChangeAnswerWhenReset(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.reset()
        // 3.then
        XCTAssertNil(sut.choosenAnswer, "Error: chooseAnswer was not changed to nil when reset", file: "SingleChoiseQuestion.swift", line: 70)
    }
    
    func test_SingleChoiseQuestion_ChangeResultWhenReset(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.reset()
        // 3.then
        XCTAssertEqual(sut.result.count, 0, "Error: result was not changed when reset", file: "SingleChoiseQuestion.swift", line: 72)
    }
    
    func test_SingleChoiseQuestion_ChangeStatusWhenReset(){
        // 1.given
        let themes = [Theme("Topic 1"), Theme("Topic 2"), Theme("Topic 3")]
        let answers = [ChoiseAnswer(text: "First answer"), ChoiseAnswer(text: "Second answer")]
        answers[0].addWeight(0.0, for: themes[0])
        answers[0].addWeight(0.0, for: themes[1])
        answers[1].addWeight(0.0, for: themes[2])
        let sut = makeSUT(themes: themes, answers: answers)
        sut.choose(answer: sut.answers[0])
        // 2.when
        sut.reset()
        // 3.then
        XCTAssertEqual(sut.status, .notAnswered, "Error: status was not changed to .notAnswered when reset", file: "SingleChoiseQuestion.swift", line: 72)
    }
    
    
}
