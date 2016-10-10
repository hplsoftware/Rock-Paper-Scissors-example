//
//  ViewController.swift
//  RoshambuProject
//
//  Created by Rob Sutherland on 2016-09-30.
//  Copyright © 2016 HP Software. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    @IBAction func paperClick(_ sender: AnyObject) {
////        if(sender.tag == 1){
////            
////        }else if(sender.tag == 2){
////            
////        }else if(sender.tag == 3){
////            
////        }
//    }
    
    @IBAction func rockClick(_ sender: AnyObject) {
        let opponentChose = randomOpponentValue()
        
        var resultText = ""
        var resultIndex = 0
        if(opponentChose == 1){
            //tie
            resultText = "It was a tie!"
            resultIndex = 4
        }else if(opponentChose == 2){
            //opponent win
            resultText = "You Lost!"
            resultIndex = 1 //paper covers rock
        }else{
            //user wins
            resultText = "You Won!"
            resultIndex = 2 //rock crushes scissors
        }
        
        var controller:ResultsViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        controller.resultValue = resultIndex
        controller.resultLabelValue = resultText
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "resultViewPaper"){
            let controller = segue.destination as! ResultsViewController
            
            let opponentChose = randomOpponentValue()
            
            var resultText = ""
            var resultIndex = 0
            if(opponentChose == 1){
                resultText = "You Won"
                resultIndex = 1 //paper covers rock
            }else if(opponentChose == 2){
                //opponent win
                resultText = "A Tie!"
                resultIndex = 4
            }else{
                //user wins
                resultText = "You Lost!"
                resultIndex = 3 //rscissors cuts paper
            }

            controller.resultValue = resultIndex
            controller.resultLabelValue = resultText
        }
    }
    
    @IBAction func paperClick(_ sender: AnyObject) {
       
    }
    
    @IBAction func scissorsClick(_ sender: AnyObject) {
        let opponentChose = randomOpponentValue()
        if(opponentChose == 1){
            //opponent win
        }else if(opponentChose == 2){
            //user wins
        }else{
            //tie
        }
        performSegue(withIdentifier: "resultView", sender: self)
    }
    
    // randomly generates a Int from 1 to 3
    func randomOpponentValue() -> Int {
        // generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        // return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }

}

