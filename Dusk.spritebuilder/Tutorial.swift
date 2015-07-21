//
//  Tutorial.swift
//  Dusk
//
//  Created by Alan on 7/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Tutorial: CCNode, CCPhysicsCollisionDelegate {
    weak var tut1Fuzz: CCSprite!
    weak var gamePhysicsNode: CCPhysicsNode!
    var delay: CCTime = 0
    var tutDone = false
    var tutReset = false
    var firstDelay: CCTime = 0
    
    func skip(){
        let gameplay = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplay)
    }
    func didLoadFromCCB(){
        gamePhysicsNode.collisionDelegate = self
    }
    override func update(delta: CCTime) {
        delay += delta
        firstDelay += delta
        if firstDelay >= 1{
            tut1Fuzz.physicsBody.applyImpulse(ccp(0,-2))
        }
        if tutDone && delay >= 1 {
            let nextTut = CCBReader.loadAsScene("Tutorial2")
            CCDirector.sharedDirector().presentScene(nextTut)
        }
        if tutReset && delay >= 1 {
            let tutorialScene = CCBReader.loadAsScene("Tutorial")
            CCDirector.sharedDirector().presentScene(tutorialScene)
        }
    }
    func mushroomTapped(type: FuzzColor){
        if tutDone == false && tutReset == false{
            tut1Fuzz.physicsBody.velocity = ccp(0,200)
            tutDone = true
            delay = 0
            self.animationManager.runAnimationsForSequenceNamed("FadeOut")
        }
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, fuzz: CCNode!, ground: CCNode!) -> Bool {
        delay = 0
        tutReset = true
        self.animationManager.runAnimationsForSequenceNamed("FadeOut")
        return true
    }
}
