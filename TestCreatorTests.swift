//
//  TestCreatorTests.swift
//  TestCreatorTests
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import XCTest
@testable import TestCreator

class TestCreatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTestQueryHasCategoryOnCreation() {
        // 1.given
        
        // 2.when
        
        // 3.then
    }
    
    func testTestQueryAddingCategory(){
        // 1.given
        //        let categoriesInTest = [TestCategory("cars"), TestCategory("bikes")]
        let categoriesInTest = TestCategory("cars")
        let sut = TestQuery()
        
        // 2.when
        sut.category = category
        
        // 3.then
        XCTAssertEqual(sut.category.count, categoriesInTest.count)
    }
    
    func testTestQueryRemovingCategory() {
        // 1.given
        
        // 2.when
        
        // 3.then
    }

    func testTestQueryHasAnswer() {
        // 1.given
        
        // 2.when
        
        // 3.then
    }
    
    func testTestQueryAddingAnswer(){
        // 1.given
        
        // 2.when
        
        // 3.then
    }
    
    func testTestQueryRemovingNotLastAnswer() {
        // 1.given
        
        // 2.when
        
        // 3.then
    }
    
    func testTestQueryRemovingLastAnswer() {
        // 1.given
        
        // 2.when
        
        // 3.then
    }

    
    func  testQueryHasSingleResultWhenAnswered(){
        
    }
    
    // MARK: - If Answer has multiple effects on different categories
    func  testQueryHasMultipleResultsWhenAnswered(){
        
    }
    
    func  testQueryChangeStatusWhenAnswered(){
        
    }
    
    func testTestQueryChangeStatusWhenAborted(){
    
    }

    
}
