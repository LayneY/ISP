import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

    var platforms : [Platform] = []
    
    let platform = Platform(rect:Rect(size:Size(width:500, height:10)))
    
    var character : Character
    
    init() {
        // append all platforms to array before character init
        platforms.append(platform)
        self.character = Character(platforms:platforms)
          // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        
          insert(entity: character, at: .front)

          insert(entity: platform, at: .front)
          
          // We insert our RenderableEntities in the constructor

      }
      override func preSetup(canvasSize:Size, canvas:Canvas) {
          platforms[0].move(to:Point(x: 0, y:350))
          dispatcher.registerKeyDownHandler(handler:self)
      }

      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler:self)
      }      

      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          if key == "d" {
              character.moveForward()
          
          }else if key == "a" {
              character.moveBackward()
          }
          if code == "Space" {
              character.jump()
          }
          
      }

      func isOnPlatform() -> Bool {
          let plat1Rect = platform.getPlatformBoundingRect().containment(target:character.getBoundingRect())
          let plat1Set : ContainmentSet = [.contact]
          if plat1Set.isSubset(of:plat1Rect) {
              return true
          }else{
              return false
          }
      }
  }
