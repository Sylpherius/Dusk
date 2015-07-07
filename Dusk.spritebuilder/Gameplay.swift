//
//  Gameplay.swift
//  Dusk
//
//  Created by Alan on 7/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
/*
import UIKit

enum FuzzColor {
    case Blue, Green, Red, Yellow, White
}
class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    weak var fuzz: Fuzz!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var scoreLabel: CCLabelTTF!
    weak var restartButton: CCButton!
    weak var restartScreen: CCSprite!
    weak var restartScore: CCLabelTTF!
    var fuzzies: [Fuzz] = [] //CURRENTLY BEING WORKED ON
    var gameOver = false
    var points : NSInteger = 0
    
    func triggerGameOver(){
        restartButton.visible = true
        restartScreen.visible = true
        restartScore.visible = true
        self.animationManager.runAnimationsForSequenceNamed("FadeIn")
    }
    func restart(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        points = 0
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
        //applies the "bounce" the fuzz does
        fuzz.physicsBody.velocity = ccp(0,200)
        fuzz.physicsBody.velocity = ccp(horizMove, fuzz.physicsBody.velocity.y)
        //updates the score
        points++
        scoreLabel.string = String(points)
        restartScore.string = String(points)
        //changes the color of the fuzz
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
*/

import UIKit

enum FuzzColor {
    case Blue, Green, Red, Yellow, White
}
class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    weak var fuzz1: Fuzz!
    weak var fuzz2: Fuzz!
    weak var tapToStart: CCLabelTTF!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var scoreLabel: CCLabelTTF!
    weak var restartButton: CCButton!
    weak var restartScreen: CCSprite!
    weak var restartScore: CCLabelTTF!
    var fuzzies: [Fuzz] = [] //CURRENTLY BEING WORKED ON
    var gameOver = false
    var points : NSInteger = 0
    var currentFuzz: Fuzz!
    var bothFuzz = false
    var oneGameOver = false
    var firstTap = false
    var firstFirst = false
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if firstFirst == false{
            firstTap = true
            firstFirst = true
        }
    }
    func triggerGameOver(){
        restartButton.visible = true
        restartScreen.visible = true
        restartScore.visible = true
        self.animationManager.runAnimationsForSequenceNamed("FadeIn")
    }
    func restart(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        points = 0
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: CCNode!, level: CCNode!) -> Bool {
        if oneGameOver == false{
            triggerGameOver()
            gameOver = true
            for fuzz in fuzzies {
                fuzz.white()
            }
            oneGameOver = true
        }
        return true
    }
    func veryBeginning(){
        tapToStart.visible = false
        self.animationManager.runAnimationsForSequenceNamed("Main")
        fuzzies.append(fuzz1)
        currentFuzz = fuzz1
        changeColor()
        fuzzies.append(fuzz2)
        currentFuzz = fuzz2
        changeColor()
        firstTap = false
    }
    func didLoadFromCCB(){
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        self.animationManager.runAnimationsForSequenceNamed("Beginning")
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        var horizMove = CGFloat(CCRANDOM_0_1() * 100 - 50)
        //applies the "bounce" the fuzz does
        currentFuzz.physicsBody.velocity = ccp(0,200)
        currentFuzz.physicsBody.velocity = ccp(horizMove, currentFuzz.physicsBody.velocity.y)
        //updates the score
        points++
        scoreLabel.string = String(points)
        restartScore.string = String(points)
        //changes the color of the fuzz
        if whichColor == 0{
            currentFuzz.blue()
        } else if whichColor == 1{
            currentFuzz.green()
        } else if whichColor == 2{
            currentFuzz.red()
        } else {
            currentFuzz.yellow()
        }
    }
    override func update(delta: CCTime) {
        for fuzz in fuzzies {
            fuzz.physicsBody.applyImpulse(ccp(0,-70))
        }
        if firstTap {
            veryBeginning()
        }
    }
    func pressBlue(){
        if gameOver == false{
            for fuzz in fuzzies {
                currentFuzz = fuzz
                if fuzz.fuzzColor == .Blue {
                    changeColor()
                    bothFuzz = true
                }
            }
            if bothFuzz == false{
                for fuzz in fuzzies {
                    fuzz.white()
                    gameOver = true
                }
            }
        }
    }
    func pressGreen(){
        if gameOver == false{
            for fuzz in fuzzies {
                currentFuzz = fuzz
                if fuzz.fuzzColor == .Green {
                    changeColor()
                    bothFuzz = true
                }
            }
            if bothFuzz == false{
                for fuzz in fuzzies {
                    fuzz.white()
                    gameOver = true
                }
            }
        }
    }
    func pressRed(){
        if gameOver == false{
            for fuzz in fuzzies {
                currentFuzz = fuzz
                if fuzz.fuzzColor == .Red {
                    changeColor()
                    bothFuzz = true
                }
            }
            if bothFuzz == false{
                for fuzz in fuzzies {
                    fuzz.white()
                    gameOver = true
                }
            }
        }
    }
    func pressYellow(){
        if gameOver == false{
            for fuzz in fuzzies {
                currentFuzz = fuzz
                if fuzz.fuzzColor == .Yellow {
                    changeColor()
                    bothFuzz = true
                }
            }
            if bothFuzz == false{
                for fuzz in fuzzies {
                    fuzz.white()
                    gameOver = true
                }
            }
        }
    }
}


