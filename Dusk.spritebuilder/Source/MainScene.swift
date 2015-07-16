import Foundation
class MainScene: CCNode {
    func didLoadFromCCB(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
        OALSimpleAudio.sharedInstance().preloadEffect("ToBeImplemented")
    }
    func start(){
        OALSimpleAudio.sharedInstance().playEffect("ToBeImplemented")
        if NSUserDefaults.standardUserDefaults().integerForKey("highscore") == 0{
            let tutorialScene = CCBReader.loadAsScene("Tutorial")
            CCDirector.sharedDirector().presentScene(tutorialScene)
        } else {
            let gameplayScene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(gameplayScene)
        }
    }
}
