//
//  ViewController.swift
//  CatchTheGary1.4
//
//  Created by Alper Can Eryaşar on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFileld: UITextField!
    
    @IBOutlet weak var gary1: UIImageView!
    @IBOutlet weak var gary2: UIImageView!
    @IBOutlet weak var gary3: UIImageView!
    @IBOutlet weak var gary4: UIImageView!
    @IBOutlet weak var gary5: UIImageView!
    @IBOutlet weak var gary6: UIImageView!
    @IBOutlet weak var gary7: UIImageView!
    @IBOutlet weak var gary8: UIImageView!
    @IBOutlet weak var gary9: UIImageView!
    var userName = ""
    
    var hideTimer = Timer()
    var garyArray = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gary1.isUserInteractionEnabled = true
        gary2.isUserInteractionEnabled = true
        gary3.isUserInteractionEnabled = true
        gary4.isUserInteractionEnabled = true
        gary5.isUserInteractionEnabled = true
        gary6.isUserInteractionEnabled = true
        gary7.isUserInteractionEnabled = true
        gary8.isUserInteractionEnabled = true
        gary9.isUserInteractionEnabled = true
        
        garyArray = [gary1,gary2,gary3,gary4,gary5,gary6,gary7,gary8,gary9]
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(hideGary), userInfo: nil, repeats: true)
        
        
    }

    @IBAction func startButton(_ sender: Any) {
        userName = textFileld.text!
        performSegue(withIdentifier: "goSecond", sender: nil)
    }
    
    @IBAction func scoreButton(_ sender: Any) {
    }
    
    @IBAction func settingsButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSecond"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }
    
    @objc func hideGary(){
        for gary in garyArray{
            gary.isHidden = false
        }
        
        let random = Int(arc4random_uniform(UInt32(garyArray.count - 1)))
        garyArray[random].isHidden = true
    }
    
}

