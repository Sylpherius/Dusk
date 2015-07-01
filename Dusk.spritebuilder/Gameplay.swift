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
    weak var gamePhysicsNode : CCPhysicsNode!
    var fuzzies: [Fuzz] = [] //FOR FUTURE IMPLEMENTATION
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
        changeColor()
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        var horizMove = CGFloat(CCRANDOM_0_1() * 100 - 50)
        fuzz.physicsBody.velocity = ccp(0,200)
        fuzz.physicsBody.velocity = ccp(horizMove, fuzz.physicsBody.velocity.y)
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
    override func update(delta: CCTime) {
        fuzz.physicsBody.applyImpulse(ccp(0,-70))
    }
    func pressBlue(){
        if fuzz.fuzzColor == .Blue {
            changeColor()
        } else {
            //FOR FUTURE IMPLEMENTATION
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressGreen(){
        if fuzz.fuzzColor == .Green {
            changeColor()
        } else {
            //FOR FUTURE IMPLEMENTATION
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressRed(){
        if fuzz.fuzzColor == .Red {
            changeColor()
        } else {
            //FOR FUTURE IMPLEMENTATION
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
    func pressYellow(){
        if fuzz.fuzzColor == .Yellow {
            changeColor()
        } else {
            //FOR FUTURE IMPLEMENTATION
            fuzz.physicsBody.applyImpulse(ccp(0,0))
        }
    }
}
