//
//  Fuzz.swift
//  Dusk
//
//  Created by Alan on 7/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Fuzz: CCSprite {
    var touchGround = false
    var fuzzColor: FuzzColor = .White
    func blue(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeBlue")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnBlue")
        }
        fuzzColor = .Blue
    }
    func green(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeGreen")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnGreen")
        }
        fuzzColor = .Green
    }
    func red(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeRed")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnRed")
        }
        fuzzColor = .Red
    }
    func yellow(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeYellow")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnYellow")
        }
        fuzzColor = .Yellow
    }
    func white(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eye")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnWhite")
        }
        fuzzColor = .White
    }
    func teal(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeTeal")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnTeal")
        }
        fuzzColor = .Teal
    }
    func purple(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyePurple")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnPurple")
        }
        fuzzColor = .Purple
    }
    func brown(){
        if whichMode.eyeball == true{
            self.animationManager.runAnimationsForSequenceNamed("eyeBrown")
        } else{
            self.animationManager.runAnimationsForSequenceNamed("turnBrown")
        }
        fuzzColor = .Brown
    }
    func getColor(var givenFuzz: Fuzz) -> FuzzColor{
        return givenFuzz.fuzzColor
    }
    func ground(){
        touchGround = true
    }
    func getGround() -> Bool{
        return touchGround
    }
}
