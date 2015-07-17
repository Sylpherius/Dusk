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
        CCDirector.sharedDirector().popScene()
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
            whichMode.soundIsOn = false
            OALSimpleAudio.sharedInstance().stopBg()
        }
        else{
            soundOn.visible = true
            whichMode.soundIsOn = true
            OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
            OALSimpleAudio.sharedInstance().playBgWithLoop(true)
        }
    }
    func tutorial(){
        let tutorialScene = CCBReader.loadAsScene("Tutorial")
        CCDirector.sharedDirector().presentScene(tutorialScene)
    }
}
