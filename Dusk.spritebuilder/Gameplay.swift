//
//  Gameplay.swift
//  Dusk
//
//  Created by Alan on 7/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

enum FuzzColor {
    case Blue, Green, Red, Yellow, White
}
class Gameplay: CCNode {
    weak var fuzz: Fuzz!
    var correctColor = false
    weak var gamePhysicsNode : CCPhysicsNode!
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        changeColor()
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        if whichColor == 0{
            fuzz.blue()
        } else if whichColor == 1{
            fuzz.green()
        } else if whichColor == 2{
            fuzz.red()
        } else {
            fuzz.yellow()
        }
    }
    func pressBlue(){
        if fuzz.fuzzColor == .Blue {
            correctColor = true
        }
        if correctColor == true {
            fuzz.physicsBody.applyImpulse(ccp(0,500))
            gamePhysicsNode.position = ccp(gamePhysicsNode.position.x + 50, gamePhysicsNode.position.y)
            changeColor()
            correctColor = false
        } else {
            //death to-be-implemented
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressGreen(){
        if fuzz.fuzzColor == .Green {
            correctColor = true
        }
        if correctColor == true {
            fuzz.physicsBody.applyImpulse(ccp(0,500))
            changeColor()
            correctColor = false
        } else {
            //death to-be-implemented
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressRed(){
        if fuzz.fuzzColor == .Red {
            correctColor = true
        }
        if correctColor == true {
            fuzz.physicsBody.applyImpulse(ccp(0,500))
            changeColor()
            correctColor = false
        } else {
            //death to-be-implemented
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressYellow(){
        if fuzz.fuzzColor == .Yellow {
            correctColor = true
        }
        if correctColor == true {
            fuzz.physicsBody.applyImpulse(ccp(0,500))
            changeColor()
            correctColor = false
        } else {
            //death to-be-implemented
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
}
