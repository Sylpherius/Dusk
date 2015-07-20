//
//  Mushroom.swift
//  Dusk
//
//  Created by Alan on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Mushroom: CCSprite {
    var type: FuzzColor = .White
    var mushroomType: String = ""
    
    weak var gamePlay: Gameplay!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
        
        switch mushroomType {
            case "red":
                type = .Red
            case "blue":
                type = .Blue
            case "green":
                type = .Green
            case "yellow":
                type = .Yellow
        default:
            println("No Color")
        }
        
        gamePlay = self.parent as? Gameplay
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        gamePlay.mushroomTapped(type)
    }

    
}