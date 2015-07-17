import Foundation
class MainScene: CCNode {
    weak var titlePhysicsNode: CCPhysicsNode!
    var leaf: Leaf?
    
    func didLoadFromCCB(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
        OALSimpleAudio.sharedInstance().preloadEffect("Sound/Wind.wav")
        //OALSimpleAudio.sharedInstance().playEffect("Sound/Wind.wav")
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
        leaf = CCBReader.load("Leaf") as! Leaf?
        var xLeaf = Int(CCRANDOM_0_1() * 300 - 150)
    }
}