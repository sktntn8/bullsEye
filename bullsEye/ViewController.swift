//
//  ViewController.swift
//  bullsEye
//
//  Created by Mohamed on 4/8/17.
//  Copyright © 2017 geekFactory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoureLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var backgrounImageView: UIImageView!
    @IBOutlet weak var targetLable: UILabel!
    // just to change labels color color
    @IBOutlet weak var targetTextLable: UILabel!
    @IBOutlet weak var roundTextLabel: UILabel!
    @IBOutlet weak var scoureTextLabel: UILabel!
    
    
    
    var currentValue  = 0
    var targetValue = 0
    var scoure = 0
    var roundValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value)
        startNewRound()
        let image = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(image, for: .normal)
        slider.setMinimumTrackImage(UIImage(named: "SliderTrackLeft"), for: .normal)
        slider.setMaximumTrackImage(UIImage(named: "SliderTrackRight"), for: .normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        displayResult()
        
    
    }
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        
        print("the value of the slider is \(lroundf(sender.value))")
        currentValue = lroundf(sender.value)

        
    }
    
    
    @IBAction func startOver(_ sender: UIButton) {
        scoure = 0
        roundValue = 1
        scoureLabel.text = "\(scoure)"
        roundLabel.text = "\(roundValue)"
        
    }
    
    
    

}
extension ViewController{

    func startNewRound() {
        backgrounImageView.isHidden = false
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        scoureLabel.textColor = .white
        roundLabel.textColor = .white
        scoureTextLabel.textColor = .white
        roundTextLabel.textColor = .white
        targetTextLable.textColor = .white


    }
    
    func displayResult() {
        
        let (incresedScore , userMessage) = calculateTheDefference(target: targetValue, currentValue: currentValue )
        
        scoure = scoure + incresedScore
        roundValue += 1
        scoureLabel.text = "\(scoure)"
        roundLabel.text = "\(roundValue)"
        backgrounImageView.isHidden = true
        scoureLabel.textColor = .black
        roundLabel.textColor = .black
        scoureTextLabel.textColor = .black
        roundTextLabel.textColor = .black
        targetTextLable.textColor = .black
        
        
        
        let alert = UIAlertController(title: userMessage, message: "You scoures \(scoure) points" + "\n Your value is \(currentValue)" + "\n your target is \(targetValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction!) in
            self.startNewRound()

        })
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

   
    }
    
    func calculateTheDefference( target: Int , currentValue : Int) -> (Int , String){
        let defferenceRsult = abs(target - currentValue)
        switch defferenceRsult {
        case 0 :
            return(100,"perfect!")
        case 1..<5 :
            return(50,"You almost had it!!")
        case 5..<10 :
            return(10,"Pretty good!")
        default:
            return(0,"Not even close...")

        }
    }



}

