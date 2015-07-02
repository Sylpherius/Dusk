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
    weak var scoreLabel: CCLabelTTF!
    weak var restartButton: CCButton!
    var fuzzies: [Fuzz] = [] //FOR FUTURE IMPLEMENTATION
    var gameOver = false
    var points : NSInteger = -1
    
    func triggerGameOver(){
        restartButton.visible = true
    }
    func restart(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        points = -1
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: CCNode!, level: CCNode!) -> Bool {
        triggerGameOver()
        gameOver = true
        fuzz.white()
        return true
    }
    func didLoadFromCCB(){
        gamePhysicsNode.collisionDelegate = self
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
                fuzz.white()
                gameOver = true
            }
        }
    }
    func pressGreen(){
        if gameOver == false{
            if fuzz.fuzzColor == .Green {
                changeColor()
            } else {
                fuzz.white()
                gameOver = true
            }
        }
    }
    func pressRed(){
        if gameOver == false{
            if fuzz.fuzzColor == .Red {
                changeColor()
            } else {
                fuzz.white()
                gameOver = true
            }
        }
    }
    func pressYellow(){
        if gameOver == false{
            if fuzz.fuzzColor == .Yellow {
                changeColor()
            } else {
                fuzz.white()
                gameOver = true
            }
        }
    }
}
