//
//  Settings.swift
//  Dusk
//
//  Created by Alan on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Settings: CCNode {
    var sounds = 0
    func back(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    func sound(){
        if sounds == 0{
            self.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            sounds++
        }
        if sounds == 1{
            self.animationManager.runAnimationsForSequenceNamed("Default Timeline")
            sounds--
        }
    }
}
