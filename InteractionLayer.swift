import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

    var platforms : [Platform] = []
    
    let platform = Platform(rect:Rect(size:Size(width:2000, height:20)))
    let platform2 = Platform(rect:Rect(size:Size(width:200, height:50)))
    let platform3 = Platform(rect:Rect(size:Size(width:75, height:75)))
    let platform4 = Platform(rect:Rect(size:Size(width:75, height:150)))
    let platform5 = Platform(rect:Rect(size:Size(width:75, height:225)))
    let platform6 = Platform(rect:Rect(size:Size(width:1700, height:20)))
    let platform7 = Platform(rect:Rect(size:Size(width:50, height:50)))
    let platform8 = Platform(rect:Rect(size:Size(width:100, height:50)))
    let platform9 = Platform(rect:Rect(size:Size(width:50, height:50)))
    
    //let platform2 = Platform(rect:Rect(size:Size(width:
//    var character : Character
    
    init() {
        // append all platforms to array before character init
        platforms.append(contentsOf:[platform, platform2, platform3, platform4, platform5, platform6, platform7, platform8, platform9])
        //platforms.append(platform2)
        //platforms.append(platform3)
        
  //      self.character = Character(platforms:platforms)
          // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        
    //      insert(entity: character, at: .front)
        for index in platforms {
            insert(entity: index, at: .front)
        }
          
          // We insert our RenderableEntities in the constructor

      }
      override func preSetup(canvasSize:Size, canvas:Canvas) {
          platforms[0].move(to:Point(x: 0, y:canvasSize.height - 25))
          platforms[1].move(to:Point(x: canvasSize.width / 3, y:canvasSize.height - 75))
          platforms[2].move(to:Point(x: canvasSize.width - 380,y: canvasSize.height - 100))
          platforms[3].move(to:Point(x: canvasSize.width - 230,y: canvasSize.height - 175))
          platforms[4].move(to:Point(x: canvasSize.width - 80,y: canvasSize.height - 250))
          platforms[5].move(to:Point(x: 0, y:canvasSize.height - 400))
          platforms[6].move(to:Point(x: Int(Double(canvasSize.width) * 0.666), y: canvasSize.height / 2))
          platforms[7].move(to:Point(x: Int(Double(canvasSize.width) * 0.666) - 200, y: canvasSize.height / 2 - 20))
          platforms[8].move(to:Point(x: Int(Double(canvasSize.width) * 0.666) - 350, y: canvasSize.height / 2 - 20))
          dispatcher.registerKeyDownHandler(handler:self)
     }

      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler:self)
      }      

      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          if key == "d" {
      //        character.moveForward()
          
          }else if key == "a" {
        //      character.moveBackward()
          }
          if code == "Space" {
          //    character.jump()
          }
          
      }

      //func isOnPlatform() -> Bool {
//          let plat1Rect = platform.getPlatformBoundingRect().containment(target:character.getBoundingRect())
//          let plat1Set : ContainmentSet = [.contact]
  //        if plat1Set.isSubset(of:plat1Rect) {
    //          return true
      //    }else{
        //      return false
         // }
      //}
  }
