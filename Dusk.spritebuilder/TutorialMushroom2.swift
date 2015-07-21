//
//  TutorialMushroom2.swift
//  Dusk
//
//  Created by Alan on 7/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class TutorialMushroom2: CCSprite {
    var type: FuzzColor = .White
    var mushroomType: String = "red"
    
    weak var tutorial2: Tutorial2!
    
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
        tutorial2 = self.parent as? Tutorial2
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        tutorial2.mushroomTapped(type)
    }

}
