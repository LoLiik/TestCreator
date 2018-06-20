//
//  StatesmentTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 19.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class StatesmentTests: XCTestCase {
    
    func  test_Statesment_InitWithNils() {
        // 1.given
        // 2.when
        let sut = Statement(text: nil, imageURL: nil, audioFileName: nil)
        // 3.then
        XCTAssertEqual(sut.text, "", "Error initializing Statement with all nils: text not empty", file: "Statement.swift", line: 21)
    }
    
    func test_Statement_EqualityOfTwoEmptyStatements(){
        // 1.given
        let firstStatement = Statement()
        let secondStatement = Statement()
        // 2.when
        let equality = firstStatement == secondStatement
        // 3.then
        XCTAssertTrue(equality , "Error: two same statements are not equal", file: "Statement.swift", line: 12)
    }
    
    func test_Statement_EqualityOfTwoEqualStatements(){
        // 1.given
        let firstStatement = Statement(text: "First text")
        let secondStatement = Statement(text: "First text")
        // 2.when
        let equality = firstStatement == secondStatement
        // 3.then
        XCTAssertTrue(equality , "Error: two same statements are not equal", file: "Statement.swift", line: 12)
    }
    
    func test_Statement_NotEqualityOfTwoDifferentStatements(){
        //1.given
        let firstStatement = Statement(text: "First text")
        let secondStatement = Statement(text: "Second text")
        // 2.when
        let notEquality = firstStatement == secondStatement
        // 3.then
        XCTAssertFalse(notEquality , "Error: two different statements are equal", file: "Statement.swift", line: 12)
    }
}
