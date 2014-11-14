//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Korey Stanley on 11/8/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var breddLbl: UILabel!
    @IBOutlet weak var randoFactLbl: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Korey"
        myTiger.age = myTiger.convertToTigerYears(36)
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        
        myTigers.append(myTiger)
        
        myImageView.image = myTiger.image
        nameLbl.text = myTiger.name
        ageLbl.text = "\(myTiger.age)"
        breddLbl.text = myTiger.breed
        
        var secoundTiger = Tiger(age: myTiger.convertToTigerYears(6), name: "Tigres", breed: "Indo Chinese Tiger", image: UIImage(named: "IndochineseTiger.jpg"))
        var thirdTiger = Tiger(age: myTiger.convertToTigerYears(4), name: "Jacob", breed: "Malayan Tiger", image: UIImage(named: "MalayanTiger.jpg"))
        var fourthTiger = Tiger(age: myTiger.convertToTigerYears(5), name: "Scar", breed: "Siberian Tiger", image: UIImage(named: "SiberianTiger.jpg"))
        myTigers += [secoundTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.image = UIImage(named: "Lion.jpg")
        lion.isAlphaMale = false
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.isAlphaMale = false
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.lions += [lion, lioness]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randIndex)
        default:
            let randIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randIndex)
        }
        
    }

    
    func updateView() {
        
        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breddLbl.text = tiger.breed
                self.nameLbl.text = tiger.name
                self.ageLbl.text = "\(tiger.age)"
                self.randoFactLbl.text = tiger.randomFact()
                
            } else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breddLbl.text = lion.subspecies
                self.nameLbl.text = lion.name
                self.ageLbl.text = "\(lion.age)"
                self.randoFactLbl.hidden = true
                
            }
            self.randoFactLbl.hidden = false
            
            
            }, completion: {(finished: Bool) -> () in })
        
    }
    
    
}

    