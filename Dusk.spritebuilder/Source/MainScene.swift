import Foundation
class MainScene: CCNode {
//    weak var titlePhysicsNode: CCPhysicsNode!
//    var leaf: Leaf?
//    var leafTime: CCTime = 0
    
    func didLoadFromCCB(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
    }
    func start(){
        if NSUserDefaults.standardUserDefaults().integerForKey("highscore") == 0{
            let tutorialScene = CCBReader.loadAsScene("Tutorial")
            CCDirector.sharedDirector().presentScene(tutorialScene)
        } else {
            let gameplayScene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(gameplayScene)
        }
    }
    override func update(delta: CCTime) {
//        leafTime += delta
//        leaf = CCBReader.load("Leaf") as! Leaf?
//        var xLeaf = Int(CCRANDOM_0_1() * 300 - 150)
//        if leafTime >= 0.1 {
//            self.leafTime = 0
//            if let leaf = leaf {
//                titlePhysicsNode.addChild(leaf)
//                let leafPos = titlePhysicsNode.convertToWorldSpace(CGPoint(x: xLeaf, y: 0))
//                leaf.position = titlePhysicsNode.convertToNodeSpace(leafPos)
//            }
//        }
        
    }
}