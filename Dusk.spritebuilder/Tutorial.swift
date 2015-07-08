//
//  Tutorial.swift
//  Dusk
//
//  Created by Alan on 7/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Tutorial: CCNode {
    weak var nextTut1: CCSprite!
    weak var nextTut2: CCSprite!
    weak var nextTut3: CCSprite!
    weak var nextTut4: CCLabelTTF!
    weak var nextTut5: CCLabelTTF!
    weak var nextTut6: CCLabelTTF!
    var touches = 0
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if touches != 0{
            let gameplayScene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(gameplayScene)
        }
        nextTut1.visible = true
        nextTut2.visible = true
        nextTut3.visible = true
        nextTut4.visible = true
        nextTut5.visible = true
        nextTut6.visible = true
        touches++
    }
}
