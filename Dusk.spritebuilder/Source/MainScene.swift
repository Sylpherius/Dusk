import Foundation
class MainScene: CCNode {
    func start(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
        let tutorialScene = CCBReader.loadAsScene("Tutorial")
        CCDirector.sharedDirector().presentScene(tutorialScene)
    }
}
