//
//  Gameplay.swift
//  Dusk
//
//  Created by Alan on 7/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

//7/16/15 - The day I got absolutely nothing done

import UIKit

enum FuzzColor {
    case Blue, Green, Red, Yellow, White
}
enum Mode {
    case Easy, Medium, Hard, Insane, Why, Mirage
}
enum Themes {
    case Normal, Autumn, Dusk, Midnight
}
struct whichMode {
    static var theMode: Mode = .Easy
    static var soundIsOn = true
    static var mirageOn = false
    static var theme: Themes = .Normal
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
    weak var settingsButton: CCButton!
    weak var settingsIcon: CCSprite!
    weak var modeButton: CCButton!
    weak var themeText: CCLabelTTF!
    weak var mirageText: CCLabelTTF!
    weak var pauseButton: CCButton!
    weak var pauseIcon: CCSprite!
    weak var black: CCSprite!
    weak var themeButton: CCButton!
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
    var themeWord = ""
    var mirageFuzz: Fuzz?
    var blackWarning = false
    
    //Changes the game difficulty
    func themes(){
        if whichMode.theme == .Normal {
            whichMode.theme = .Autumn
            themeWord = "Autumn"
            themeButton.title = "\(themeWord)"
        } else{
            if whichMode.theme == .Autumn {
                whichMode.theme = .Midnight
                themeWord = "Midnight"
                themeButton.title = "\(themeWord)"
            } else{
                if whichMode.theme == .Midnight {
                    whichMode.theme = .Normal
                    themeWord = "Normal"
                    themeButton.title = "\(themeWord)"
                }
            }
        }
    }
    func modes(){
        if whichMode.theMode == .Easy{
            whichMode.theMode = .Medium
            modeWord = "Normal"
            modeButton.title = "\(modeWord)"
        } else{
            if whichMode.theMode == .Medium{
                whichMode.theMode = .Hard
                modeWord = "Fast"
                modeButton.title = "\(modeWord)"
            } else{
                if whichMode.theMode == .Hard{
                    whichMode.theMode = .Insane
                    modeWord = "Frenzy"
                    modeButton.title = "\(modeWord)"
                } else{
                    if whichMode.theMode == .Insane{
                        whichMode.theMode = .Why
                        modeWord = "Why :("
                        modeButton.title = "\(modeWord)"
                    } else{
                        if whichMode.theMode == .Why{
                            whichMode.theMode = .Mirage
                            modeWord = "MIRAGE"
                            modeButton.title = "\(modeWord)"
                            whichMode.mirageOn = true
                            mirageText.visible = true
                        } else{
                            if whichMode.theMode == .Mirage{
                                whichMode.theMode = .Easy
                                modeWord = "Slow"
                                modeButton.title = "\(modeWord)"
                                whichMode.mirageOn = false
                                mirageText.visible = false
                            }
                        }
                    }
                }
            }
        }
    }
    //Implements the feature that slowly adds color to the background
    func addColors(){
        if points >= 5 && once == 0{
            if whichMode.theme == .Normal{
                theGrass.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                theGrass.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                theGrass.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
        if points >= 10 && once == 1{
            if whichMode.theme == .Normal{
                theTree.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                theTree.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                theTree.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
        if points >= 20 && once == 2{
            if whichMode.theme == .Normal{
                thePlants.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                thePlants.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                thePlants.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
        if points >= 40 && once == 3{
            if whichMode.theme == .Normal{
                theSecond.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                theSecond.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                theSecond.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
        if points >= 65 && once == 4{
            if whichMode.theme == .Normal{
                theBG.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                theBG.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                theBG.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
        if points >= 100 && once == 5{
            if whichMode.theme == .Normal{
                theSky.animationManager.runAnimationsForSequenceNamed("Color")
            }
            if whichMode.theme == .Autumn{
                theSky.animationManager.runAnimationsForSequenceNamed("Color2")
            }
            if whichMode.theme == .Midnight{
                theSky.animationManager.runAnimationsForSequenceNamed("Color3")
            }
            once++
        }
    }
    //Makes sure that the beginning change of colors in the Fuzz objects only occurs once
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if firstFirst == false{
            firstTap = true
            firstFirst = true
        }
    }
    //Updates the highscore
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
        } else if whichMode.theMode == .Why{
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreW")
        } else {
            newHighscore = NSUserDefaults.standardUserDefaults().integerForKey("highscoreMIRAGE")
        }
        highscoreLabel.string = "\(newHighscore)"
    }
    //Causes the game to end
    func triggerGameOver(){
        let defaults = NSUserDefaults.standardUserDefaults()
        var highscore: Int
        var highscoreE: Int = defaults.integerForKey("highscoreE")
        var highscoreM: Int = defaults.integerForKey("highscoreM")
        var highscoreH: Int = defaults.integerForKey("highscoreH")
        var highscoreI: Int = defaults.integerForKey("highscoreI")
        var highscoreW: Int = defaults.integerForKey("highscoreW")
        var highscoreMIRAGE: Int = defaults.integerForKey("highscoreMIRAGE")
        if whichMode.theMode == .Easy{
            highscore = highscoreE
        } else if whichMode.theMode == .Medium{
            highscore = highscoreM
        } else if whichMode.theMode == .Hard{
            highscore = highscoreH
        } else if whichMode.theMode == .Insane{
            highscore = highscoreI
        } else if whichMode.theMode == .Why{
            highscore = highscoreW
        } else {
            highscore = highscoreMIRAGE
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
            } else if whichMode.theMode == .Why{
                defaults.setObject(Int(self.points), forKey: "highscoreW")
                defaults.synchronize()
            } else {
                defaults.setObject(Int(self.points), forKey: "highscoreMIRAGE")
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
        themeText.visible = true
        themeButton.visible = true
        self.animationManager.runAnimationsForSequenceNamed("FadeIn")
    }
    //Restarts the scene
    func restart(){
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        points = 0
    }
    //Pauses the game
    func pause(){
        let pauseScene = CCBReader.loadAsScene("Pause")
        CCDirector.sharedDirector().pushScene(pauseScene)
    }
    //Sends the user to the settings (pushes the settings scene on)
    func settings(){
        let settingsScene = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().pushScene(settingsScene)
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: Fuzz!, ceiling: CCNode!) -> Bool {
        ball.physicsBody.velocity = ccp(ball.physicsBody.velocity.x,0)
        return true
    }
    //Triggers the game over scenario when the fuzz object hits the ground
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ball: Fuzz!, level: CCNode!) -> Bool {
        black.visible = false
        pauseButton.visible = false
        pauseIcon.visible = false
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
    //Works with the above function
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
    //Sets the stage so the player can get ready to start the game
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
    //Loads in things at the very beginning
    func didLoadFromCCB(){
        userInteractionEnabled = true
        multipleTouchEnabled = true
        gamePhysicsNode.collisionDelegate = self
        self.animationManager.runAnimationsForSequenceNamed("Beginning")
        updateHighscore()
    }
    //Changes the color of the fuzz object when the correct mushroom object is tapped and also adds in the jump
    func changeColor(){
        var whichColor = Int(CCRANDOM_0_1() * 4)
        var whichMirage = Int(CCRANDOM_0_1() * 4)
        var horizMove = CGFloat(CCRANDOM_0_1() * 100 - 50)
        //applies the "bounce" the fuzz does
        if whichMode.theMode == .Easy{
            currentFuzz.physicsBody.velocity = ccp(0,250)
        } else if whichMode.theMode == .Medium{
            currentFuzz.physicsBody.velocity = ccp(0,340)
        } else if whichMode.theMode == .Hard{
            currentFuzz.physicsBody.velocity = ccp(0,400)
        } else if whichMode.theMode == .Insane{
            currentFuzz.physicsBody.velocity = ccp(0,490)
        } else if whichMode.theMode == .Why{
            currentFuzz.physicsBody.velocity = ccp(0,560)
        } else {
            currentFuzz.physicsBody.velocity = ccp(0,250)
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
        //All of the things needed for MIRAGE mode
        if whichMode.mirageOn == true{
            mirageFuzz = CCBReader.load("MirageFuzz") as! Fuzz?
            if let mirageFuzz = mirageFuzz {
                var randX = CGFloat(CCRANDOM_0_1() * 100 - 50)
                var randY = CGFloat(CCRANDOM_0_1() * 400 - 200)
                var miragePos = currentFuzz.convertToWorldSpace(CGPoint(x: 0, y: 0))
                mirageFuzz.position = gamePhysicsNode.convertToNodeSpace(miragePos)
                gamePhysicsNode.addChild(mirageFuzz)
                mirageFuzz.physicsBody.sensor = true
                mirageFuzz.physicsBody.velocity = ccp(randX,randY)
                if whichMirage == 0{
                    mirageFuzz.blue()
                } else if whichMirage == 1{
                    mirageFuzz.green()
                } else if whichMirage == 2{
                    mirageFuzz.red()
                } else {
                    mirageFuzz.yellow()
                }
            }
        }
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, mFuzz: Fuzz!, level: CCNode!) -> Bool {
        mFuzz.removeFromParent()
        return true
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, mFuzz: Fuzz!, wall: CCNode!) -> Bool {
        mFuzz.removeFromParent()
        return true
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, mFuzz: Fuzz!, ceiling: CCNode!) -> Bool {
        mFuzz.removeFromParent()
        return true
    }
    override func update(delta: CCTime) {
        if fuzzies.count == 2 {
            for fuzz in fuzzies {
                if mode == .Easy{
                    fuzz.physicsBody.applyImpulse(ccp(0,-3))
                }
                if mode == .Medium{
                    fuzz.physicsBody.applyImpulse(ccp(0,-6))
                }
                if mode == .Hard{
                    fuzz.physicsBody.applyImpulse(ccp(0,-9))
                }
                if mode == .Insane{
                    fuzz.physicsBody.applyImpulse(ccp(0,-11))
                }
                if mode == .Why{
                    fuzz.physicsBody.applyImpulse(ccp(0,-15))
                }
                if mode == .Mirage{
                    fuzz.physicsBody.applyImpulse(ccp(0,-3))
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
            if mode == .Mirage{
                fuzzies[0].physicsBody.applyImpulse(ccp(0,-5))
            }
        }
        if firstTap {
            veryBeginning()
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        var currentHighscore: Int
        switch whichMode.theMode{
            case .Easy:
                currentHighscore = defaults.integerForKey("highscoreE")
                modeButton.title = "Slow"
            case .Medium:
                currentHighscore = defaults.integerForKey("highscoreM")
                modeButton.title = "Normal"
            case .Hard:
                currentHighscore = defaults.integerForKey("highscoreH")
                modeButton.title = "Fast"
            case .Insane:
                currentHighscore = defaults.integerForKey("highscoreI")
                modeButton.title = "Frenzy"
            case .Why:
                currentHighscore = defaults.integerForKey("highscoreW")
                modeButton.title = "Why :("
            case .Mirage:
                currentHighscore = defaults.integerForKey("highscoreMIRAGE")
                modeButton.title = "MIRAGE"
        default:
            println("Error in game difficulty")
        }
        switch whichMode.theme{
            case .Normal:
                themeButton.title = "Normal"
            case .Autumn:
                themeButton.title = "Autumn"
            case .Midnight:
                themeButton.title = "Midnight"
        default:
            println("Error in game theme")
        }
        highscoreLabel.string = "\(currentHighscore)"
    }
    func mushroomTapped(type: FuzzColor){
        if firstFirst{
            if gameOver == false{
                for fuzz in fuzzies {
                    currentFuzz = fuzz
                    if type == fuzz.fuzzColor{
                        changeColor()
                        bothFuzz = true
                    }
                }
                if bothFuzz == false{
                    if blackWarning == false{
                        black.visible = true
                        blackWarning = true
                    } else {
                        for fuzz in fuzzies {
                            fuzz.white()
                            gameOver = true
                        }
                    }
                }
                bothFuzz = false
            }
        }
    }
}
