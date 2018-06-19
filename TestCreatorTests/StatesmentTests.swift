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
        let mockText: String? = nil
        let mockImageURL: URL? = nil
        let mockAudioFileName: String? = nil
        // 2.when
        let sut = Statement(text: mockText, imageURL: mockImageURL, audioFileName: mockAudioFileName)
        // 3.then
        XCTAssertEqual(sut.text, "", "Error initializing Statement with all nils: text not empty", file: "Statement.swift", line: 21)
        XCTAssertNil(sut.imageURL, "Error initializing Statement with all nils: imageURL is not nil property", file: "Statement.swift", line: 21)
        XCTAssertNil(sut.audioFileName, "Error initializing Statement with all nils: imageURL is not nil property", file: "Statement.swift", line: 21)
    }
    
}
