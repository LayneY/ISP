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

    var charX = 0

    init() {
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
        
        self.veloY = 2
        
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
        increaseIndex()

        frames[0].renderMode = .destinationPoint(Point(x:charX,y:30))
        frames[1].renderMode = .destinationPoint(Point(x:charX+19,y:30))
        frames[3].renderMode = .destinationPoint(Point(x:charX-2,y:30))
        //frames[1].renderMode = .destinationPoint(Point(x:charX,y:30))
        frames[2].renderMode = .destinationPoint(Point(x:charX+19,y:30))
        frames[4].renderMode = .destinationPoint(Point(x:charX-2,y:30))
        charX += 10
        forward = true
    }

    func moveBackward() {
        increaseRevIndex()
        
        revFrames[0].renderMode = .destinationPoint(Point(x:charX,y:30))
        revFrames[1].renderMode = .destinationPoint(Point(x:charX+46,y:30))
        revFrames[3].renderMode = .destinationPoint(Point(x:charX+55,y:30))
        //revFrames[1].renderMode = .destinationPoint(Point(x:charX,y:30))
        revFrames[2].renderMode = .destinationPoint(Point(x:charX+46,y:30))
        revFrames[4].renderMode = .destinationPoint(Point(x:charX+55,y:30))
        charX -= 10
        forward = false
    }

    func jump() {

    }
}
