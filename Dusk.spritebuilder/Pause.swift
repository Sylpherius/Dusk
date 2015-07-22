//
//  Pause.swift
//  Dusk
//
//  Created by Alan on 7/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Pause: CCNode {
    func pause(){
        CCDirector.sharedDirector().popScene()
    }
}
