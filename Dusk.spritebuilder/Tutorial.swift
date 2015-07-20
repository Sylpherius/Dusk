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
    var tut1Over = false
    
    func didLoadFromCCB(){
        gamePhysicsNode.collisionDelegate = self
    }
    override func update(delta: CCTime) {
        if tut1Over == false{
            tut1Fuzz.physicsBody.applyImpulse(ccp(0,-2))
        }
    }
    func mushroomTapped(type: FuzzColor){
        tut1Fuzz.physicsBody.velocity = ccp(0,200)
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, fuzz: CCNode!, ground: CCNode!) -> Bool {
        tut1Over = true
        tut1Fuzz.removeFromParent()
        tut1Mush.removeFromParent()
        return true
    }
}
