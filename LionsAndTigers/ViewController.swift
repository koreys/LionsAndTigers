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
    
    var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Korey"
        myTiger.age = 36
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        myImageView.image = myTiger.image
        nameLbl.text = myTiger.name
        ageLbl.text = "\(myTiger.age)"
        breddLbl.text = myTiger.breed
        
        var secoundTiger = Tiger(age: 6, name: "Tigres", breed: "Indo Chinese Tiger", image: UIImage(named: "IndochineseTiger.jpg"))
        var thirdTiger = Tiger(age: 4, name: "Jacob", breed: "Malayan Tiger", image: UIImage(named: "MalayanTiger.jpg"))
        var fourthTiger = Tiger(age: 5, name: "Scar", breed: "Siberian Tiger", image: UIImage(named: "SiberianTiger.jpg"))
        myTigers += [secoundTiger, thirdTiger, fourthTiger]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        let RandIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let tiger = myTigers[RandIndex]
        
        myImageView.image = tiger.image
        nameLbl.text = tiger.name
        ageLbl.text = "\(tiger.age)"
        breddLbl.text = tiger.breed
        
    }

}

