//
//  Settings.swift
//  Dusk
//
//  Created by Alan on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import Mixpanel

class Settings: CCNode {
    weak var soundOn: CCSprite!
    var blood = 0
    let mixpanel = Mixpanel()
    var mixOnce = false
    
    func b1(){
        blood = 1
    }
    func b2(){
        if blood == 1{
            blood++
        } else{
            blood = 0
        }
    }
    func b3(){
        if mixOnce == false{
            mixpanel.track("Easter Egg Found", properties: ["#" : 1])
            mixOnce = true
        }
        if blood == 2{
            whichMode.easterBlood = true
        } else{
            blood = 0
        }
    }
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
