//
//  GameScene.swift
//  AppLovin Helper
//
//  Created by Dominik on 18/05/2016.
//  Copyright (c) 2016 Dominik Ringler. All rights reserved.
//

import SpriteKit

extension GameScene: AdsDelegate {
    
    func adClicked() {
        print("Ads clicked")
    }
    
    func adClosed() {
        print("Ads closed")
    }
    
    func adDidRewardUser(withAmount rewardAmount: Int) {
        // e.g self.coins += rewardAmount
        
    }
}

class GameScene: SKScene {
    
    var myLabel: SKLabelNode!
    var touchCounter = 25 {
        didSet {
            guard touchCounter >= 0 else {return }
            myLabel.text = "Remove ads in \(touchCounter) clicks"
        }
    }
    
    override func didMove(to view: SKView) {
        myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Remove ads in \(touchCounter) clicks"
        myLabel.fontSize = 25;
        myLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        
        self.addChild(myLabel)
        
        
        AdsManager.shared.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        // Show inter
        AdsManager.shared.showInterstitial(withInterval: 2)
        
        // Remove ads after 3 clicks
        touchCounter -= 1
        if touchCounter == 0 {
            AdsManager.shared.removeAll()
        }
    }
   
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
