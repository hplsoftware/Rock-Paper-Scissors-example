//
//  ResultsViewController.swift
//  RoshambuProject
//
//  Created by Rob Sutherland on 2016-09-30.
//  Copyright © 2016 HP Software. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: Properties
    
    var resultValue: Int?
    var resultLabelValue: String?
    
        // MARK: Outlets
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        // The dice will only appear if firstValue and secondValue have been set
        if let resultValue = self.resultValue {
            if(resultValue == 1){
                self.resultImage.image = UIImage(named: "paperCoverRock")

            }else if (resultValue == 2){
                self.resultImage.image = UIImage(named: "rockCrushesScissors")

            }else if (resultValue == 4){
                self.resultImage.image = UIImage(named: "itsAtie")
            
            }else if (resultValue == 3){
                self.resultImage.image = UIImage(named: "scissorsCutPaper")

            }
        }else {
            self.resultImage.image = nil;
        }
        
        if let resultLabelValue = self.resultLabelValue {
            
                self.resultLabel.text = resultLabelValue
        } else {
            self.resultLabel.text = "Not Set";
        }

    }
    
    // MARK: Action
    
    @IBAction func dismiss() {
        // dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }

}
