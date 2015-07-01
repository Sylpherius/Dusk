//
//  Fuzz.swift
//  Dusk
//
//  Created by Alan on 7/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Fuzz: CCSprite {
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
}
