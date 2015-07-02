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
class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    weak var fuzz: Fuzz!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var ground: CCNode!
    weak var scoreLabel: CCLabelTTF!
    var fuzzies: [Fuzz] = [] //FOR FUTURE IMPLEMENTATION
    var gameOver = false
    var points : NSInteger = 0
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, fuzz: CCNode!, ground: CCNode!) -> Bool {
        
        return true
    }
    func didLoadFromCCB(){
        userInteractionEnabled = true
        changeColor()
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        var horizMove = CGFloat(CCRANDOM_0_1() * 100 - 50)
        fuzz.physicsBody.velocity = ccp(0,200)
        fuzz.physicsBody.velocity = ccp(horizMove, fuzz.physicsBody.velocity.y)
        points++
        scoreLabel.string = String(points)
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
        if gameOver == false{
            if fuzz.fuzzColor == .Blue {
                changeColor()
            } else {
                //FOR FUTURE IMPLEMENTATION
                gameOver = true
            }
        }
    }
    func pressGreen(){
        if gameOver == false{
            if fuzz.fuzzColor == .Green {
                changeColor()
            } else {
                //FOR FUTURE IMPLEMENTATION
                gameOver = true
            }
        }
    }
    func pressRed(){
        if gameOver == false{
            if fuzz.fuzzColor == .Red {
                changeColor()
            } else {
                //FOR FUTURE IMPLEMENTATION
                gameOver = true
            }
        }
    }
    func pressYellow(){
        if gameOver == false{
            if fuzz.fuzzColor == .Yellow {
                changeColor()
            } else {
                //FOR FUTURE IMPLEMENTATION
                gameOver = true
            }
        }
    }
}
