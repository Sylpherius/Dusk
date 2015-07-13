import Foundation
class MainScene: CCNode {
    func didLoadFromCCB(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)

    }
    func start(){
        let tutorialScene = CCBReader.loadAsScene("Tutorial")
        CCDirector.sharedDirector().presentScene(tutorialScene)
    }
}
