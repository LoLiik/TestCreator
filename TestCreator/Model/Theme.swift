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
    
    init(_ label:String){
        name = label
    }
    
    static func ==(lhs: Theme, rhs: Theme) -> Bool{
        return lhs.name == rhs.name
    }
    
    var hashValue: Int{
        return name.hashValue ^ (description ?? "default").hashValue
    }
}
