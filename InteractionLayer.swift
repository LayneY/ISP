import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

    let platform = Platform(rect:Rect(size:Size(width:500, height:10)))

    let character = Character()
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: character, at: .front)

          insert(entity: platform, at: .front)
          // We insert our RenderableEntities in the constructor

      }
      override func preSetup(canvasSize:Size, canvas:Canvas) {
          platform.move(to:Point(x: 0, y:canvasSize.height - 20))
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
          }else if code == "Space" {
              character.jump()
          }
          
      }
  }
