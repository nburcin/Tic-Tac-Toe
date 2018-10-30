//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nicholas Burcin on 10/30/18.
//  Copyright © 2018 Burcin Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.layer.cornerRadius = 10.0
        playAgainButton.isHidden = false
        playAgainButton.clipsToBounds = true
        resultLabel.layer.cornerRadius = 10.0
        resultLabel.isHidden = false
        resultLabel.clipsToBounds = true
    }

    @IBAction func playAgainButtonWasPressed(_ sender: Any) {
    }
    
}

