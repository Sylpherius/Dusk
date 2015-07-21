//
//  Tutorial2.swift
//  Dusk
//
//  Created by Alan on 7/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Tutorial2: CCNode, CCPhysicsCollisionDelegate {
    weak var fuzz: Fuzz!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var bTap: CCLabelTTF!
    weak var gTap: CCLabelTTF!
    weak var rTap: CCLabelTTF!
    weak var yTap: CCLabelTTF!
    var delay: CCTime = 0
    var tutDone = 0
    var tutReset = false
    var justOnce = false
    var firstDelay: CCTime = 0
    var tutOnce = false
    
    func skip(){
        let gameplay = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplay)
    }
    func didLoadFromCCB(){
        gamePhysicsNode.collisionDelegate = self
        changeColor()
    }
    override func update(delta: CCTime) {
        delay += delta
        firstDelay += delta
        if firstDelay >= 1{
            fuzz.physicsBody.applyImpulse(ccp(0,-2))
        }
        if tutDone >= 6 && delay >= 1 {
            let nextScene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(nextScene)
        }
        if tutReset && delay >= 1 {
            let tutorialScene = CCBReader.loadAsScene("Tutorial2")
            CCDirector.sharedDirector().presentScene(tutorialScene)
        }
    }
    func mushroomTapped(type: FuzzColor){
        bTap.visible = false
        yTap.visible = false
        rTap.visible = false
        gTap.visible = false
        if tutDone < 6 && tutReset == false{
            if fuzz.fuzzColor == type{
                fuzz.physicsBody.velocity = ccp(0,200)
                tutDone++
                changeColor()
            } else if justOnce == false{
                justOnce = true
                fuzz.white()
                tutReset = true
                delay = 0
                self.animationManager.runAnimationsForSequenceNamed("FadeOut")
            }
        }
        if tutDone == 6 && tutOnce == false{
            tutOnce = true
            delay = 0
            self.animationManager.runAnimationsForSequenceNamed("FadeOut")
        }
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: CCNode!, ground: CCNode!) -> Bool {
        if justOnce == false{
            justOnce = true
            delay = 0
            tutReset = true
            self.animationManager.runAnimationsForSequenceNamed("FadeOut")
        }
        return true
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        if whichColor == 0{
            fuzz.blue()
            bTap.visible = true
        } else if whichColor == 1{
            fuzz.green()
            gTap.visible = true
        } else if whichColor == 2{
            fuzz.red()
            rTap.visible = true
        } else {
            fuzz.yellow()
            yTap.visible = true
        }
    }
}
