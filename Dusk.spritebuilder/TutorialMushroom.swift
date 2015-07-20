//
//  TutorialMushroom.swift
//  Dusk
//
//  Created by Alan on 7/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class TutorialMushroom: CCSprite {
    var type: FuzzColor = .White
    var mushroomType: String = "red"
    
    weak var tutorial: Tutorial!
    
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
        
        tutorial = self.parent as? Tutorial
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        tutorial.mushroomTapped(type)
    }

}
