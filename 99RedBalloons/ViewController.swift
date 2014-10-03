//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Raymond Scott on 10/2/14.
//  Copyright (c) 2014 Raymond Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var balloonLabel: UILabel!
    
    var currentIndex = 1
    var myBalloons:[Balloon] = []
    var randomNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        loadBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadBalloons ()
    {
        for (var i = 1; i < 100; i++)
        {
            var myBalloon = Balloon()
            myBalloon.number = i
            randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            switch randomNumber {
            case 1:
                myBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                myBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                myBalloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                myBalloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            myBalloons.append(myBalloon)
        }
    }
    
    
    @IBAction func nextBalloonButtonPressed(sender: UIBarButtonItem) {
        
        var randomIndex = Int(arc4random_uniform(UInt32(myBalloons.count)))
        
        while currentIndex == randomIndex
        {
            randomIndex = Int(arc4random_uniform(UInt32(myBalloons.count)))
        }
        
        currentIndex = randomIndex
        
        var balloon = myBalloons[randomIndex]
        
        balloonLabel.text = "\(balloon.number) Balloon"
        myImageView.image = balloon.image
    }
}
