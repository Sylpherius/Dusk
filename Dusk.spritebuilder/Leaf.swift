//
//  Leaf.swift
//  Dusk
//
//  Created by Alan on 7/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Leaf: CCSprite {
    override func update(delta: CCTime) {
        self.physicsBody.applyImpulse(ccp(0,-20))
    }
}
