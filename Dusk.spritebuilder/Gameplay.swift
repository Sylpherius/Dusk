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
enum Mode {
    case Easy, Medium, Hard, Insane, Why
}
struct whichMode {
    static var theMode: Mode = .Easy
    static var soundIsOn = true
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
    weak var highscoreLabel: CCLabelTTF!
    weak var theGrass: CCSprite!
    weak var theTree: CCSprite!
    weak var thePlants: CCSprite!
    weak var theSecond: CCSprite!
    weak var theBG: CCSprite!
    weak var theSky: CCSprite!
    weak var bButton: CCButton!
    weak var yButton: CCButton!
    weak var rButton: CCButton!
    weak var gButton: CCButton!
    weak var settingsButton: CCButton!
    weak var settingsIcon: CCSprite!
    weak var modeButton: CCButton!
    var sapling: Sapling?
    var fuzzies: [Fuzz] = []
    var gameOver = false
    var points : NSInteger = 0
    var currentFuzz: Fuzz!
    var bothFuzz = false
    var oneGameOver = false
    var firstTap = false
    var firstFirst = false
    var whichFuzz = 0
    var once = 0
    var mode: Mode = whichMode.theMode
    var modeWord = ""
    
    func modes(){
        if whichMode.theMode == .Easy{
            whichMode.theMode = .Medium
            modeWord = "Medium"
            modeButton.title = "\(modeWord)"
        } else{
            if whichMode.theMode == .Medium{
                whichMode.theMode = .Hard
                modeWord = "Hard"
                modeButton.title = "\(modeWord)"
            } else{
                if whichMode.theMode == .Hard{
                    whichMode.theMode = .Insane
                    modeWord = "Insane"
                    modeButton.title = "\(modeWord)"
                } else{
                    if whichMode.theMode == .Insane{
                        whichMode.theMode = .Why
                        modeWord = "Why"
                        modeButton.title = "\(modeWord)"
                    } else{
                        if whichMode.theMode == .Why{
                            whichMode.theMode = .Easy
                            modeWord = "Easy"
                            modeButton.title = "\(modeWord)"
                        }
                    }
                }
            }
        }
    }
    func addColors(){
        if points >= 10 && once == 0{
            theGrass.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
        if points >= 25 && once == 1{
            theTree.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
        if points >= 40 && once == 2{
            thePlants.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
        if points >= 70 && once == 3{
            theSecond.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
        if points >= 100 && once == 4{
            theBG.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
        if points >= 150 && once == 5{
            theSky.animationManager.runAnimationsForSequenceNamed("Untitled Timeline")
            once++
        }
    }
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if firstFirst == false{
            firstTap = true
            firstFirst = true
        }
    }
    func updateHighscore() {
        var newHighscore: Int
        if whichMode.theMode == .Easy{
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreE")
        } else if whichMode.theMode == .Medium{
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreM")
        } else if whichMode.theMode == .Hard{
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreH")
        } else if whichMode.theMode == .Insane{
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreI")
        } else {
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreW")
        }
        highscoreLabel.string = "\(newHighscore)"
    }
    func triggerGameOver(){
        let defaults = NSUserDefaults.standardUserDefaults()
        var highscore: Int
        if whichMode.theMode == .Easy{
            highscore = defaults.integerForKey("highscoreE")
        } else if whichMode.theMode == .Easy{
            highscore = defaults.integerForKey("highscoreM")
        } else if whichMode.theMode == .Easy{
            highscore = defaults.integerForKey("highscoreH")
        } else if whichMode.theMode == .Easy{
            highscore = defaults.integerForKey("highscoreI")
        } else {
            highscore = defaults.integerForKey("highscoreW")
        }
        if self.points > highscore {
            if whichMode.theMode == .Easy{
                defaults.setObject(Int(self.points), forKey: "highscoreE")
                defaults.synchronize()
            } else if whichMode.theMode == .Medium{
                defaults.setObject(Int(self.points), forKey: "highscoreM")
                defaults.synchronize()
            } else if whichMode.theMode == .Hard{
                defaults.setObject(Int(self.points), forKey: "highscoreH")
                defaults.synchronize()
            } else if whichMode.theMode == .Insane{
                defaults.setObject(Int(self.points), forKey: "highscoreI")
                defaults.synchronize()
            } else {
                defaults.setObject(Int(self.points), forKey: "highscoreW")
                defaults.synchronize()
            }
            updateHighscore()
        }
        restartButton.visible = true
        restartScreen.visible = true
        restartScore.visible = true
        highscoreLabel.visible = true
        settingsIcon.visible = true
        settingsButton.visible = true
        modeButton.visible = true
        self.animationManager.runAnimationsForSequenceNamed("FadeIn")
    }
    func restart(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        points = 0
    }
    func settings(){
        let settingsScene = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(settingsScene)
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: Fuzz!, level: CCNode!) -> Bool {
        if oneGameOver == false{
            triggerGameOver()
            gameOver = true
            for fuzz in fuzzies {
                fuzz.white()
            }
            oneGameOver = true
        }
        //add the sapling animation
        sapling = CCBReader.load("Sapling") as! Sapling?
        if let sapling = sapling{
            var curPos = ball.convertToWorldSpace(CGPoint(x: 0, y: 0))
            sapling.position = gamePhysicsNode.convertToNodeSpace(curPos)
            gamePhysicsNode.addChild(sapling)
        }
        return true
    }
    func ccPhysicsCollisionPostSolve(pair: CCPhysicsCollisionPair!, ball: Fuzz!, level: CCNode!) {
        gamePhysicsNode.space.addPostStepBlock({
            ball.ground()
            for fuzz in self.fuzzies{
                if fuzz.touchGround == true{
                    self.fuzzies.removeAtIndex(self.whichFuzz)
                    break
                }
                self.whichFuzz++
            }
            self.whichFuzz = 0
            ball.removeFromParent()
            }, key: ball)
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
        multipleTouchEnabled = true
        bButton.exclusiveTouch = false
        gButton.exclusiveTouch = false
        rButton.exclusiveTouch = false
        yButton.exclusiveTouch = false
        gamePhysicsNode.collisionDelegate = self
        self.animationManager.runAnimationsForSequenceNamed("Beginning")
        //NSUserDefaults.standardUserDefaults().addObserver(self, forKeyPath: "highscore", options: .allZeros, context: nil)
        updateHighscore()
    }
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        var horizMove = CGFloat(CCRANDOM_0_1() * 100 - 50)
        //applies the "bounce" the fuzz does
        if whichMode.theMode == .Easy || whichMode.theMode == .Medium{
            currentFuzz.physicsBody.velocity = ccp(0,200)
        } else if whichMode.theMode == .Hard{
            currentFuzz.physicsBody.velocity = ccp(0,300)
        } else if whichMode.theMode == .Insane || whichMode.theMode == .Why{
            currentFuzz.physicsBody.velocity = ccp(0,400)
        }
        currentFuzz.physicsBody.velocity = ccp(horizMove, currentFuzz.physicsBody.velocity.y)
        //updates the score
        points++
        scoreLabel.string = String(points)
        restartScore.string = String(points)
        //changes the color of the fuzz
        addColors()
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
        if fuzzies.count == 2 {
            for fuzz in fuzzies {
                if mode == .Easy{
                    fuzz.physicsBody.applyImpulse(ccp(0,-5))
                }
                if mode == .Medium{
                    fuzz.physicsBody.applyImpulse(ccp(0,-10))
                }
                if mode == .Hard{
                    fuzz.physicsBody.applyImpulse(ccp(0,-15))
                }
                if mode == .Insane{
                    fuzz.physicsBody.applyImpulse(ccp(0,-20))
                }
                if mode == .Why{
                    fuzz.physicsBody.applyImpulse(ccp(0,-30))
                }
            }
        }
        if fuzzies.count == 1{
            if mode == .Easy{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-5))
            }
            if mode == .Medium{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-10))
            }
            if mode == .Hard{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-15))
            }
            if mode == .Insane{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-20))
            }
            if mode == .Why{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-30))
            }
        }
        if firstTap {
            veryBeginning()
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        var currentHighscore: Int
        if whichMode.theMode == .Easy{
            currentHighscore = defaults.integerForKey("highscoreE")
            modeButton.title = "Easy"
        } else{
            if whichMode.theMode == .Medium{
                currentHighscore = defaults.integerForKey("highscoreM")
                modeButton.title = "Medium"
            } else{
                if whichMode.theMode == .Hard{
                    currentHighscore = defaults.integerForKey("highscoreH")
                    modeButton.title = "Hard"
                } else{
                    if whichMode.theMode == .Insane{
                        currentHighscore = defaults.integerForKey("highscoreI")
                        modeButton.title = "Insane"
                    } else{
                            currentHighscore = defaults.integerForKey("highscoreW")
                            modeButton.title = "Why"
                    }
                }
            }
        }
        highscoreLabel.string = "\(currentHighscore)"
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
            bothFuzz = false
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
            bothFuzz = false
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
            bothFuzz = false
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
            bothFuzz = false
        }
    }
}
