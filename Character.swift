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
    var initialY = 0
    var platforms : [Platform]
    var lavas : [Lava]

    var isFinished = false
    
    init(platforms:[Platform], lavas:[Lava]) {
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

        //make arrays
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

        //init values
        self.charY = 650
        self.lowestAllowableY = 200
        self.veloY = self.jumpVelocity
        destPoint = Point(x:charX,y:charY)
        self.boundingRect = Rect(topLeft:Point(x:0,y:0),size:Size(width:1,height:1))
        self.platforms = platforms
        self.lavas = lavas
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
//        let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvas.canvasSize!)
  //      let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
  //    canvas.render(clearRectangle)
        
        //moving forward and updating frames
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
        //move backwards and update frames
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
        //for jumping. only lets you jump if not in the air
        if !isOnPlatform() {
            if charY <= self.initialY - 120 {
                veloY = self.jumpVelocity
            }
            charY += veloY
            destPoint = Point(x:charX,y:charY)
            frames[0].renderMode = .destinationPoint(destPoint)
            revFrames[0].renderMode = .destinationPoint(destPoint)
        }else if isOnLava() { //for lava
            charX = 0
            charY = 650
            self.veloY = self.jumpVelocity
            self.initialY = 0
            destPoint = Point(x:charX,y:charY)
            frames[0].renderMode = .destinationPoint(destPoint)
            revFrames[0].renderMode = .destinationPoint(destPoint)
        }else if isOnFinish(canvasSize:canvasSize) {
            self.isFinished = true
        }

        //update bounding rect
        self.boundingRect = Rect(topLeft:Point(x:charX,y:charY), size:Size(width:133,height:146))
    }
    
    //increase the index of frames
    func increaseIndex() {
        if index >= 4 {
            index = 0
        }else{
            index += 1
        }
    }
    
    //increase backwards frame array
    func increaseRevIndex() {
        if revIndex >= 4 {
            revIndex = 0
        }else{
            revIndex += 1
        }
    }

    func moveForward() {
        //make sure there is no platform in front of the character
        if !isPlatformInFrontOf() {
            increaseIndex()

            frames[0].renderMode = .destinationPoint(Point(x:charX,y:charY))
            frames[1].renderMode = .destinationPoint(Point(x:charX+19,y:charY))
            frames[3].renderMode = .destinationPoint(Point(x:charX-2,y:charY))
            //frames[1].renderMode = .destinationPoint(Point(x:charX,y:30))
            frames[2].renderMode = .destinationPoint(Point(x:charX+19,y:charY))
            frames[4].renderMode = .destinationPoint(Point(x:charX-2,y:charY))
            charX += 20
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
            charX -= 20
            forward = false
        }

    func jump() {
        if isOnPlatform(){
            //sets velocity to up
            self.veloY = -self.jumpVelocity
            frames[0].renderMode = .destinationPoint(Point(x:charX,y:charY-5))
            charY -= 5
            self.initialY = charY
            self.isJumping = true
        }
    }

    //function to move the character
    func setDestPoint(images:[Image], destPoint:Point) {
        for img in images {
            img.renderMode = .destinationPoint(destPoint)
        }
    }

    func getBoundingRect() -> Rect {
        return self.boundingRect
    }

    //checks to see if character bounding rect is beyond the bounding rect of all the platforms
    func isOnPlatform() -> Bool{
        
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 35 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.x + 100 >= rect.topLeft.x && getBoundingRect().topLeft.y + 146 >= rect.topLeft.y && getBoundingRect().topLeft.y + 130 <= rect.topLeft.y + 2 {
                return true
            }
        }
        return false
    }

    //checks if character is on lava
    func isOnLava() -> Bool {
        for lava in lavas {
            let lavaRect = lava.getBoundingRect()
            let rect = getBoundingRect()
            if rect.topLeft.x + 35 <= lavaRect.topLeft.x + lavaRect.size.width && rect.topLeft.x + 100 >= lavaRect.topLeft.x && rect.topLeft.y + 146 >= lavaRect.topLeft.y && rect.topLeft.y + 130 <= lavaRect.topLeft.y + 2 {
                return true
            }
        }
        return false
    }

    func isTouchingPlatform() -> Bool {
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 75 >= rect.topLeft.x && getBoundingRect().topLeft.y + 120 >= rect.topLeft.y && getBoundingRect().topLeft.y <= rect.topLeft.y {
                return true
             }
        }
        return false
    }

    //checks if there is a platform in front of the character
    func isPlatformInFrontOf() -> Bool {
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x + 75 >= rect.topLeft.x && getBoundingRect().topLeft.x + 75 <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.y + 120 >= rect.topLeft.y && getBoundingRect().topLeft.y <= rect.topLeft.y {
                return true
            }
        }
        return false
    }

    //checks if there is a platform behind the character
    func isPlatformBehind() -> Bool {
        for plat in platforms {
            let rect = plat.getPlatformBoundingRect()
            if getBoundingRect().topLeft.x <= rect.topLeft.x + rect.size.width && getBoundingRect().topLeft.x >= rect.topLeft.x && getBoundingRect().topLeft.y + 100 >= rect.topLeft.y {
                return true
            }
        }
        return false
    }

    //if character is on finish
    func isOnFinish(canvasSize:Size) -> Bool {
        if charX > canvasSize.width / 2 + 700 && charY <= canvasSize.height / 4 {
            self.isFinished = true
            return true
        }else{
            return false
        }
    }

    //move the character
    func move(x:Int,y:Int) {
        charX = x
        charY = y
        destPoint = Point(x:charX,y:charY)
        frames[0].renderMode = .destinationPoint(destPoint)
        
    }
    
}
