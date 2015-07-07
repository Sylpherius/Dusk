import Foundation
class MainScene: CCNode {
    func start(){
        OALSimpleAudio.sharedInstance().playBg("GameMusic.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        
        
    }
}
