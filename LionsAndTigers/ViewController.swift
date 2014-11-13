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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        
        var randIndex = currentIndex
        
        while randIndex == currentIndex {
            randIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }
        
        currentIndex = randIndex
        
        let tiger = myTigers[randIndex]
        tiger.chuffNumberOfTimes(currentIndex , tigerName: tiger.name)
        
        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLbl.text = tiger.name
            self.ageLbl.text = "\(tiger.age)"
            self.breddLbl.text = tiger.breed
            self.randoFactLbl.text = tiger.randomFact()
            
            
            }, completion: {(finished: Bool) -> () in })
        
    }

}

    