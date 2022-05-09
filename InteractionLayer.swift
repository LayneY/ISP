import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
    //creates array for the platforms
    var platforms : [Platform] = []

    //first floor
    let platform = Platform(rect:Rect(size:Size(width:2000, height:20)))
    //first jump
    let platform2 = Platform(rect:Rect(size:Size(width:200, height:50)))
    //staircase jump
    let platform3 = Platform(rect:Rect(size:Size(width:75, height:75)))
    let platform4 = Platform(rect:Rect(size:Size(width:75, height:150)))
    let platform5 = Platform(rect:Rect(size:Size(width:75, height:225)))
    //second floor
    let platform6 = Platform(rect:Rect(size:Size(width:1700 , height:20)))
    //floating jump sequence
    let platform7 = Platform(rect:Rect(size:Size(width:50, height:50)))
    let platform8 = Platform(rect:Rect(size:Size(width:100, height:50)))
    let platform9 = Platform(rect:Rect(size:Size(width:50, height:50)))
    let platform10 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform11 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform12 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform13 = Platform(rect:Rect(size:Size(width:0, height:0)))
    //third floor
    let platform14 = Platform(rect:Rect(size:Size(width:0, height:0)))
    //final jump sequence
    let platform15 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform16 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform17 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform18 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform19 = Platform(rect:Rect(size:Size(width:0, height:0)))
    let platform20 = Platform(rect:Rect(size:Size(width:0, height:0)))
    //finish
    let finish = Platform(rect:Rect(size:Size(width:0, height:0)))

    //sets for var for character
    var character : Character

    //creates lava array
    var lavas : [Lava] = []
    //staricase lava
    let lava1 = Lava()
    //second floor lava
    let lava2 = Lava()
    //third floor lava
    let lava3 = Lava()
    
    init() {
        // append all platforms to array before character init
        platforms.append(contentsOf:[platform, platform2, platform3, platform4, platform5, platform6, platform7, platform8, platform9, platform10, platform11, platform12, platform13, platform14, platform15, platform16, platform17, platform18, platform19, platform20, finish])

        //append lavas to array before character init
        lavas.append(contentsOf:[lava1,lava2,lava3])
        

        //init character with platforms and lava
        self.character = Character(platforms:platforms,lavas:lavas)

          // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        //insert our platforms
        for index in platforms {
            insert(entity: index, at: .front)
        }
        //inserts our character
        insert(entity: character, at: .front)
        //inserts our lava
        for index in lavas {
            insert(entity: index, at:.front)
        }

    }
    
    override func preSetup(canvasSize:Size, canvas:Canvas) {
        //move platforms and lava into right positions
        //first floor
        platforms[0].setSize(size: Size(width: canvasSize.width, height: canvasSize.height / 50))
        //first jump
        platforms[1].setSize(size: Size(width: canvasSize.width / 6, height: canvasSize.height / 18))
        //staircase jump
        platforms[2].setSize(size: Size(width: canvasSize.width / 25, height: canvasSize.height / 13))
        platforms[3].setSize(size: Size(width: canvasSize.width / 25, height: Int(Double(canvasSize.height) / 6.5)))
        platforms[4].setSize(size: Size(width: canvasSize.width / 25, height: Int(Double(canvasSize.height) / 4.33)))
        //second floor
        platforms[5].setSize(size: Size(width: Int(Double(canvasSize.width) / 1.11) , height: canvasSize.height / 50)) //second level
        //floating jump sequence
        platforms[6].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[7].setSize(size: Size(width: canvasSize.width / 12, height: canvasSize.height / 16))
        platforms[8].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[9].setSize(size: Size(width: canvasSize.width / 12, height: canvasSize.height / 16))
        platforms[10].setSize(size: Size(width: canvasSize.width / 12, height: canvasSize.height / 16))
        platforms[11].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[12].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        //third floor
        platforms[13].setSize(size: Size(width: Int(Double(canvasSize.width) / 1.11), height: canvasSize.height / 50))
        //final jump sequence
        platforms[14].setSize(size: Size(width: canvasSize.width / 12, height: canvasSize.height / 16))
        platforms[15].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[16].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[17].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[18].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        platforms[19].setSize(size: Size(width: canvasSize.width / 30, height: canvasSize.height / 16))
        //finish
        platforms[20].setSize(size: Size(width: canvasSize.width / 7, height: canvasSize.height / 16))
        
        //first floor
        platforms[0].move(to:Point(x: 0, y:Int(Double(canvasSize.height) * 0.9755))) 
        //first jump
        platforms[1].move(to:Point(x: canvasSize.width / 3, y:canvasSize.height - 78)) 
        //staircase jump
        platforms[2].move(to:Point(x: canvasSize.width - 380,y: canvasSize.height - 100)) 
        platforms[3].move(to:Point(x: canvasSize.width - 230,y: canvasSize.height - 172)) 
        platforms[4].move(to:Point(x: canvasSize.width - 80,y: canvasSize.height - 246)) 
        //second floor
        platforms[5].move(to:Point(x: 0, y:canvasSize.height - 325)) 
        //floating jump sequence
        platforms[6].move(to:Point(x: Int(Double(canvasSize.width) * 0.666), y: canvasSize.height / 2 + 50))
        platforms[7].move(to:Point(x: Int(Double(canvasSize.width) * 0.666) - 250, y: canvasSize.height / 2 + 50))
        platforms[8].move(to:Point(x: Int(Double(canvasSize.width) * 0.666) - 400, y: canvasSize.height / 2 + 50))
        platforms[9].move(to:Point(x: canvasSize.width / 2 - 350, y: canvasSize.height / 2 + 50))
        platforms[10].move(to:Point(x: canvasSize.width / 2 - 600, y: canvasSize.height / 2 - 20))
        platforms[11].move(to:Point(x: canvasSize.width / 4 - 300, y: canvasSize.height / 2 - 20))
        platforms[12].move(to:Point(x: canvasSize.width / 4 - 450, y: canvasSize.height / 2 - 100))
        //third floor
        platforms[13].move(to:Point(x: 0 + canvasSize.width / 10, y: canvasSize.height / 2 - 200))
        //final jump sequence
        platforms[14].move(to:Point(x: canvasSize.width / 4 - 100, y: canvasSize.height / 4))
        platforms[15].move(to:Point(x: canvasSize.width / 3 , y: canvasSize.height / 4 ))
        platforms[16].move(to:Point(x: canvasSize.width / 3 + 200, y: canvasSize.height / 4))
        platforms[17].move(to:Point(x: canvasSize.width / 2 + 100, y: canvasSize.height / 4))
        platforms[18].move(to:Point(x: canvasSize.width / 2 + 300, y: canvasSize.height / 4))
        platforms[19].move(to:Point(x: canvasSize.width / 2 + 500, y: canvasSize.height / 4))
        //finish
        platforms[20].move(to:Point(x: canvasSize.width / 2 + 700, y: canvasSize.height / 4))
        
        lavas[0].move(to:Point(x:0,y:canvasSize.height - 325))
        lavas[0].setSize(size:Size(width:Int(Double(canvasSize.width) / 1.52),height:canvasSize.height / 50))
        lavas[1].move(to: Point(x:canvasSize.width - 300,y:canvasSize.height - 25))
        lavas[1].setSize(size:Size(width:canvasSize.width / 6, height:canvasSize.height / 50))
        lavas[2].move(to:Point(x: 0 + canvasSize.width / 7, y: canvasSize.height / 2 - 200))
        lavas[2].setSize(size:Size(width: Int(Double(canvasSize.width) / 1.11), height: canvasSize.height / 50))
          dispatcher.registerKeyDownHandler(handler:self)
     }

      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler:self)
      }      

      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          //key handler
          if key == "d" || code == "ArrowRight" {
              character.moveForward()
          
          }else if key == "a" || code == "ArrowLeft" {
              character.moveBackward()
          }else if key == "p" {
              //debug key for moving character to next level
              character.move(x:100,y:300)
              
          }
          //jump key handler
          if code == "Space" || code == "ArrowUp" || key == "w" {
              character.jump()
          }
          
      }

 
  }
