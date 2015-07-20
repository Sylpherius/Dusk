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
    weak var tut1Mush: CCSprite!
    weak var tut1Tap: CCLabelTTF!
    weak var gamePhysicsNode: CCPhysicsNode!
    var delay: CCTime = 0
    var tutDone = false
    
    func didLoadFromCCB(){
        gamePhysicsNode.collisionDelegate = self
    }
    override func update(delta: CCTime) {
        delay += delta
        tut1Fuzz.physicsBody.applyImpulse(ccp(0,-2))
        if tutDone && delay >= 1 {
            let nextTut = CCBReader.loadAsScene("Tutorial2")
            CCDirector.sharedDirector().presentScene(nextTut)
        }
    }
    func mushroomTapped(type: FuzzColor){
        if tutDone == false{
            tut1Fuzz.physicsBody.velocity = ccp(0,200)
            tutDone = true
            delay = 0
        }
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, fuzz: CCNode!, ground: CCNode!) -> Bool {
        return true
    }
}
