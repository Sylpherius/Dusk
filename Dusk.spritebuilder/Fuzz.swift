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
        self.animationManager.runAnimationsForSequenceNamed("turnBlue")
        fuzzColor = .Blue
    }
    func green(){
        self.animationManager.runAnimationsForSequenceNamed("turnGreen")
        fuzzColor = .Green
    }
    func red(){
        self.animationManager.runAnimationsForSequenceNamed("turnRed")
        fuzzColor = .Red
    }
    func yellow(){
        self.animationManager.runAnimationsForSequenceNamed("turnYellow")
        fuzzColor = .Yellow
    }
    func white(){
        self.animationManager.runAnimationsForSequenceNamed("turnWhite")
        fuzzColor = .White
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
