//
//  SecondViewController.swift
//  CatchTheGary1.4
//
//  Created by Alper Can Eryaşar on 11.03.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var gary1: UIImageView!
    @IBOutlet weak var gary2: UIImageView!
    @IBOutlet weak var gary3: UIImageView!
    @IBOutlet weak var gary4: UIImageView!
    @IBOutlet weak var gary5: UIImageView!
    @IBOutlet weak var gary6: UIImageView!
    @IBOutlet weak var gary7: UIImageView!
    @IBOutlet weak var gary8: UIImageView!
    @IBOutlet weak var gary9: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scorelLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var hideTimer = Timer()
    var garyArray = [UIImageView]()
    
    var myName = ""
    var score = 0
    var counter = 0
    var highscore = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        scorelLabel.text = "Score : \(score)"
        
        gary1.isUserInteractionEnabled = true
        gary2.isUserInteractionEnabled = true
        gary3.isUserInteractionEnabled = true
        gary4.isUserInteractionEnabled = true
        gary5.isUserInteractionEnabled = true
        gary6.isUserInteractionEnabled = true
        gary7.isUserInteractionEnabled = true
        gary8.isUserInteractionEnabled = true
        gary9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        gary1.addGestureRecognizer(recognizer1)
        gary2.addGestureRecognizer(recognizer2)
        gary3.addGestureRecognizer(recognizer3)
        gary4.addGestureRecognizer(recognizer4)
        gary5.addGestureRecognizer(recognizer5)
        gary6.addGestureRecognizer(recognizer6)
        gary7.addGestureRecognizer(recognizer7)
        gary8.addGestureRecognizer(recognizer8)
        gary9.addGestureRecognizer(recognizer9)
        
        garyArray = [gary1,gary2,gary3,gary4,gary5,gary6,gary7,gary8,gary9]
        
        counter = 20
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.45, target: self, selector: #selector(hideGary), userInfo: nil, repeats: true)
    // Do any additional setup after loading the view.
   
        
        
    }
    
    
    @objc func countDown(){
        
        counter = counter - 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            
            timer.invalidate()
            hideTimer.invalidate()
            
            for gary in garyArray {
                gary.isHidden = false
            }
            
            if self.score > self.highscore {
                self.highscore = self.score
                highscoreLabel.text = "HighScore : \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highScore")
            }
            
            self.score = 0
            self.scorelLabel.text = "Score : \(self.score)"
            self.counter = 0
            self.timeLabel.text = "\(self.counter)"
            
            let alert = UIAlertController(title: "Time's Over", message: "Do You Want To Play Again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { UIAlertAction in
                
                //replay
                self.score = 0
                self.scorelLabel.text = "Score : \(self.score)"
                self.counter = 20
                self.timeLabel.text =  "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideGary), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @objc func hideGary(){
        for gary in garyArray{
            gary.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(garyArray.count - 1)))
        garyArray[random].isHidden = false
    }
    
    
    @objc func increaseScore(){
        score = score + 1
        scorelLabel.text = "Score : \(score)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
