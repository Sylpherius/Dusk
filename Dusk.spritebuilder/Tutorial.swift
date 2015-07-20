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
    weak var tut2Fuzz: Fuzz!
    weak var tut2MushB: CCSprite!
    weak var tut2MushG: CCSprite!
    weak var tut2MushR: CCSprite!
    weak var tut2MushY: CCSprite!
    weak var gamePhysicsNode: CCPhysicsNode!
    var tut1Over = false
    var justOnce = 0
    var tut2Over = 0
/*
    Make a timeline of the first tutorial objects appearing (1)
    Make a timeline of the first tutorial objects disappearing, THEN remove them from the parent (2)
    Make a timeline of the 2nd tutorial objects appearing, don't make it connect to any others (3)
    Make a timeline of the 2nd tutorial objects disappearing, link this to both the gameplay and the reset (4)
*/
    
    func didLoadFromCCB(){
        //(1)
        gamePhysicsNode.collisionDelegate = self
    }
    override func update(delta: CCTime) {
        if tut1Over == false{
            tut1Fuzz.physicsBody.applyImpulse(ccp(0,-2))
        }
        if tut1Over == true && justOnce == 0 {
            //(2)
            tut1Fuzz.removeFromParent()
            tut1Mush.removeFromParent()
            tut1Tap.removeFromParent()
            //(3)
            tut2Fuzz.visible = true
            tut2MushB.visible = true
            tut2MushR.visible = true
            tut2MushG.visible = true
            tut2MushY.visible = true
            justOnce++
            changeColor()
        } else {
            if tut1Over == true && justOnce >= 1 {
                tut2Fuzz.physicsBody.applyImpulse(ccp(0,-2))
            }
        }
        if tut2Over >= 4 {
            //(4)
            let gameplayScene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(gameplayScene)
        }
    }
    func mushroomTapped(type: FuzzColor){
        if tut1Over == false{
            tut1Fuzz.physicsBody.velocity = ccp(0,200)
        }
        if tut1Over {
            tut2Fuzz.physicsBody.velocity = ccp(0,200)
        }
        tut1Over = true
        if type == tut2Fuzz.fuzzColor {
            changeColor()
        }
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, fuzz: CCNode!, ground: CCNode!) -> Bool {
        //(2)
        //(1)
        return true
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: Fuzz!, ground: CCNode!) -> Bool {
        //(4)
        //(3)
        return true
    }
    func changeColor(){
        tut2Over++
        var whichColor = Int(CCRANDOM_0_1() * 4)
        if whichColor == 0{
            tut2Fuzz.blue()
        } else if whichColor == 1{
            tut2Fuzz.green()
        } else if whichColor == 2{
            tut2Fuzz.red()
        } else {
            tut2Fuzz.yellow()
        }
    }
}
