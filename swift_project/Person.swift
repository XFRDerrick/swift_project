//
//  Person.swift
//  swift_project
//
//  Created by 赫腾飞 on 15/12/10.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    
    var age: Int = 0
    
    //字典转模型
    init(dic: [String : AnyObject]) {
        
        
        super.init()
        
        setValuesForKeysWithDictionary(dic)
        
    }
    
    
    /**
        重写description
     */
    
    override var description: String{
    
        let key = ["name","age"]
        
        return "\(dictionaryWithValuesForKeys(key))"
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

    
}
