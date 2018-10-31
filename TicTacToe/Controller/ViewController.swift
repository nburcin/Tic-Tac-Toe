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
    // 1 is noughts, 2 is crosses
    var activeGame = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 is empty, 1 is noughts, 2 is crosses
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.layer.cornerRadius = 10.0
        playAgainButton.isHidden = false
        playAgainButton.clipsToBounds = true
        resultLabel.layer.cornerRadius = 10.0
        resultLabel.isHidden = true
        resultLabel.clipsToBounds = true
        
        resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    @IBAction func button(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    
                    resultLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        resultLabel.text = "Noughts have won!"
                    } else {
                        resultLabel.text = "Crosses have won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 500, y: self.resultLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                }
            }
//            for combination in winningCombinations {
//
//                if gameState[combination[0]] != 0 && gameState[combination[1]] != 0 && gameState[combination[2]] != 0 && (gameState[combination[0]] != gameState[combination[1]] || gameState[combination[0]] != gameState[combination[2]] || gameState[combination[1]] != gameState[combination[2]]){
//
//                    activeGame = false
//                    resultLabel.isHidden = false
//                    playAgainButton.isHidden = false
//                    resultLabel.text = "No Winner!"
//
//                    UIView.animate(withDuration: 1, animations: {
//
//                        self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 500, y: self.resultLabel.center.y)
//                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
//                    })
//                }
//
//            }
        }
    }
    
    @IBAction func playAgainButtonWasPressed(_ sender: Any) {
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            resultLabel.isHidden = true
            playAgainButton.isHidden = true
            
            resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            
        }
    }
    
    
    
}

