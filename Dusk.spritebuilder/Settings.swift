//
//  Settings.swift
//  Dusk
//
//  Created by Alan on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Settings: CCNode {
    weak var soundOn: CCSprite!
    func back(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    func didLoadFromCCB(){
        if whichMode.soundIsOn == true{
            soundOn.visible = true
        } else{
            soundOn.visible = false
        }
    }
    func sound(){
        if soundOn.visible == true{
            soundOn.visible = false
        }
        else{
            soundOn.visible = true
        }
    }
}
