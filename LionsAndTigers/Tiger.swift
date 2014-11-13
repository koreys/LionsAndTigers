//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Korey Stanley on 11/8/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import Foundation
import UIKit


struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff(tigerName: String) {
        println("\(tigerName) Tiger says CHUFF CHUFF!")
    }
    
    func chuffNumberOfTimes(NumberOfTimes: Int, tigerName: String) {
        for var chuffNum = 0; chuffNum < NumberOfTimes; chuffNum++ {
            chuff(tigerName)
        }
    }
    
    func convertToTigerYears(regularAge: Int) ->Int {
        return regularAge * 3
    }
    
    func randomFact () -> String {
        var randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact: String
        if randomNumber == 0 {
            randomFact = "Korey is King!"
        }
        else if randomNumber == 1 {
            randomFact = "My name is spelt with a K!"
        }
        else {
            randomFact = "I amd really 36 years young."
        }
        
        return randomFact
    }
    
}