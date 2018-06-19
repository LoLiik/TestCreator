//
//  Statement.swift
//  TestCreator
//
//  Created by Евгений on 18.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class Statement:Equatable{
    static func == (lhs: Statement, rhs: Statement) -> Bool {
        return lhs.text == rhs.text && lhs.imageURL == rhs.imageURL && lhs.audioFileName == rhs.audioFileName
    }
    
    var text:String?
    var imageURL:URL?
    // TODO: - Audio property
    var audioFileName: String? // or URL? or path? //
    
    init(text: String?, imageURL: URL? = nil, audioFileName: String? = nil){
        guard text != nil || imageURL != nil || audioFileName != nil else {
            self.text = ""
            return
        }
        self.text = text
        self.imageURL = imageURL
        self.audioFileName = audioFileName
    }
}


