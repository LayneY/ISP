import Igis
import Scenes
import Foundation

class Character : RenderableEntity {

    var character : Image
    var character2 : Image
    var character3 : Image

    var revChar1 : Image
    var revChar2 : Image
    var revChar3 : Image

    var forward = true
    var frames : [Image]
    var index = 0
    var revFrames : [Image]
    var revIndex = 0

    var veloY = 0

    var charY = 0
    var charX = 0

    var lowestAllowableY = 0

    var destPoint : Point

    var isJumping = false

    let jumpVelocity = 10
    
    var boundingRect : Rect

    var platforms : [Platform]
    init(platforms:[Platform]) {
        guard let imageURL = URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character1-removebg-preview.png") else {
            fatalError("character failed to load")
        }
        
        revFrames = []
        frames = []
        character = Image(sourceURL:imageURL)
        character2 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character2-removebg-preview.png")!)
        character3 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character3-removebg-preview.png")!)
        revChar1 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character1back-removebg-preview.png")!)
        revChar2 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character2back-removebg-preview.png")!)
        revChar3 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character3back-removebg-preview.png")!)
        for _ in 0 ..< 1 {
            character = Image(sourceURL:imageURL)
            frames.append(character)
        }
        for _ in 0 ..< 2 {
            character2 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character2-removebg-preview.png")!)
            frames.append(character2)
        }
        for _ in 0 ..< 2 {
            character3 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character3-removebg-preview.png")!)
            frames.append(character3)
        }

        for _ in 0 ..< 1 {
            revChar1 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character1back-removebg-preview.png")!)
            revFrames.append(revChar1)
        }
        for _ in 0 ..< 2 {
            revChar2 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character2back-removebg-preview.png")!)
            revFrames.append(revChar2)
        }
        for _ in 0 ..< 2 {
            revChar3 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character3back-removebg-preview.png")!)
            revFrames.append(revChar3)
        }
       
        self.charY = 210
        self.lowestAllowableY = 200
        self.veloY = self.jumpVelocity
        destPoint = Point(x:charX,y:charY)
        self.boundingRect = Rect(topLeft:Point(x:0,y:0),size:Size(width:1,height:1))
        self.platforms = platforms
        super.init(name: "Character")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        for img in frames {
            canvas.setup(img)
        }
        for img in revFrames {
            canvas.setup(img)
        }
    }

    override func render(canvas:Canvas) {
        let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvas.canvasSize!)
        let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
        canvas.render(clearRectangle)
        if forward {
            if index != 0 {
                if frames[index].isReady {
                    canvas.render(frames[index])
            
                }
                increaseIndex()
            }else{
                if frames[index].isReady {
                    canvas.render(frames[index])
                }
            }
            index = 0
        }else{
            if revIndex != 0 {
                if revFrames[revIndex].isReady {
                    canvas.render(revFrames[revIndex])
            
                }
                increaseRevIndex()
            }else{
                if revFrames[revIndex].isReady {
                    canvas.render(revFrames[revIndex])
                }
            }
            revIndex = 0
        }
        /*
        if frames[index].isReady {
            canvas.render(frames[index])
           
        }
        **/
    }

    override func calculate(canvasSize:Size) {
        if !isOnPlatform() {
            if charY <= self.lowestAllowableY - 150 {
                veloY = self.jumpVelocity
            }
            charY += veloY
            destPoint = Point(x:charX,y:charY)
            frames[0].renderMode = .destinationPoint(destPoint)
        }else if isOnPlatform() && veloY >= 5 {
            
            isJumping = false
        }
        print(isTouchingPlatform())
        /*
        if isJumping && isOnPlatform() {
            if charY <= self.lowestAllowableY - 125 {
                veloY += self.jumpVelocity
            }
            
            charY += veloY
            destPoint = Point(x:charX, y:charY)
            //print(charY)
            frames[0].renderMode = .destinationPoint(destPoint)
//            self.isJumping = false
        }else{
            charY = 204
            destPoint = Point(x:charX, y:charY)
            frames[0].renderMode = .destinationPoint(destPoint)
            self.isJumping = false
        }**/
        //print(isOnPlatform())
        self.boundingRect = Rect(topLeft:Point(x:charX,y:charY), size:Size(width:133,height:146))
    }

    func increaseIndex() {
        if index >= 4 {
            index = 0
        }else{
            index += 1
        }
    }

    func increaseRevIndex() {
        if revIndex >= 4 {
            revIndex = 0
        }else{
            revIndex += 1
        }
    }

    func moveForward() {
        if !isTouchingPlatform() {
            increaseIndex()

            frames[0].renderMode = .destinationPoint(Point(x:charX,y:charY))
            frames[1].renderMode = .destinationPoint(Point(x:charX+19,y:charY))
            frames[3].renderMode = .destinationPoint(Point(x:charX-2,y:charY))
            //frames[1].renderMode = .destinationPoint(Point(x:charX,y:30))
            frames[2].renderMode = .destinationPoint(Point(x:charX+19,y:charY))
            frames[4].renderMode = .destinationPoint(Point(x:charX-2,y:charY))
            charX += 10
            forward = true
        }
    }

    func moveBackward() {
        increaseRevIndex()
        
        revFrames[0].renderMode = .destinationPoint(Point(x:charX,y:charY))
        revFrames[1].renderMode = .destinationPoint(Point(x:charX+46,y:charY))
        revFrames[3].renderMode = .destinationPoint(Point(x:charX+55,y:charY))
        //revFrames[1].renderMode = .destinationPoint(Point(x:charX,y:30))
        revFrames[2].renderMode = .destinationPoint(Point(x:charX+46,y:charY))
        revFrames[4].renderMode = .destinationPoint(Point(x:charX+55,y:charY))
        charX -= 10
        forward = false
    }

    func jump() {
        if isOnPlatform(){
            self.veloY = -self.jumpVelocity
            frames[0].renderMode = .destinationPoint(Point(x:charX,y:charY-10))
            charY -= 10
            self.isJumping = true
        }
    }

    func setDestPoint(images:[Image], destPoint:Point) {
        for img in images {
            img.renderMode = .destinationPoint(destPoint)
        }
    }

    func getBoundingRect() -> Rect {
        return self.boundingRect
    }

    func isOnPlatform() -> Bool{
        /*let plat1Rect = platforms.getPlatformBoundingRect().containment(target:getBoundingRect())
        let plat1Set : ContainmentSet = [.contact, .beyondVertically]
          if plat1Set.isSubset(of:plat1Rect) {
              return true
          }else{
              return false
              }**/
//        let plat1Rect = platforms.getPlatformBoundingRect()
//        print("char")
  //      print(getBoundingRect().topLeft.y + 146)
    //    print("plat")
      //  print(plat1Rect.topLeft.y)
        

        //for plat in self.platforms {
        /*var rect = platforms[0].getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 50 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.y + 146 >= rect.topLeft.y {
                return true
            }else{
                return false
            }
        rect = platforms[1].getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 50 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.y + 146 >= rect.topLeft.y {
                return true
            }else{
                return false
                }**/
/*        let rect = platforms[0].getPlatformBoundingRect()
        let rect2 = platforms[1].getPlatformBoundingRect()
        if getBoundingRect().topLeft.x + 50 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.x + 50 >= rect.topLeft.x && getBoundingRect().topLeft.y + 146 >= rect.topLeft.y && getBoundingRect().topLeft.y + 130 <= rect.topLeft.y + rect.size.height{
            return true
        }else if getBoundingRect().topLeft.x + 50 <= rect2.topLeft.x + rect2.size.width && getBoundingRect().topLeft.x + 50 >= rect2.topLeft.x && getBoundingRect().topLeft.y + 146 >= rect2.topLeft.y && getBoundingRect().topLeft.y + 130 <= rect2.topLeft.y + rect2.size.height{
            return true
        }else{
            return false
            }**/
        //}
        //return false
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 50 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.x + 50 >= rect.topLeft.x && getBoundingRect().topLeft.y + 146 >= rect.topLeft.y && getBoundingRect().topLeft.y + 130 <= rect.topLeft.y + rect.size.height {
                return true
            }
        }
        return false
    }

    func isTouchingPlatform() -> Bool {
        /*let rect = platforms[0].getPlatformBoundingRect()
        let rect2 = platforms[1].getPlatformBoundingRect()
        if getBoundingRect().topLeft.x + 75 >= rect.topLeft.x && getBoundingRect().topLeft.y + 120 >= rect.topLeft.y && getBoundingRect().topLeft.y <= rect.topLeft.y {
            
            print("touching 1")
            return true
        }else if getBoundingRect().topLeft.x + 75 >= rect2.topLeft.x && getBoundingRect().topLeft.y + 120 >= rect2.topLeft.y && getBoundingRect().topLeft.y <= rect2.topLeft.y {
            
            print("touching 2")
            return true
        }else{
            return false
            }**/
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 75 >= rect.topLeft.x && getBoundingRect().topLeft.y + 120 >= rect.topLeft.y && getBoundingRect().topLeft.y <= rect.topLeft.y {
                return true
            }
        }
        return false
    }
}
