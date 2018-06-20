//
//  Theme.swift
//  TestCreator
//
//  Created by Евгений on 14.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class Theme:Equatable, Hashable{
    private var name:String
    private var description:String?
    
    init(){
        self.name = ""
    }
    
    init(_ name:String){
        self.name = name
    }
    
    //MARK: - Equatable conformance: to provide contains method in array
    static func ==(lhs: Theme, rhs: Theme) -> Bool{
        return lhs.name == rhs.name
    }
    
    
    //MARK: - Hashable conformance: to provide Theme as a key in dictionary
    var hashValue: Int{
        return name.hashValue ^ (description ?? "default").hashValue
    }
}
