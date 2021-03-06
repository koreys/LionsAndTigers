//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Korey Stanley on 11/13/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    func roar() {
        println("Lion: Roar, Roar!!")
    }
    
    func changeToAlphaMale() {
        self.isAlphaMale = true
    }
    
    
    func randoFact() -> String {
        var randoFact:String
        
        if self.isAlphaMale == true {
            randoFact = "Male lions are easy to recognize thanks to their distinctive manes"
        }
        else {
            randoFact = "Female Lionesses do all the hunting... and are generally bad ass."
        }
        
        return randoFact
    }
}
