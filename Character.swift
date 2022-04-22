import Igis
import Scenes
import Foundation

class Character : RenderableEntity {

    var character : Image
    var character2 : Image
    var character3 : Image
    var frames : [Image]
    var index = 0

    var charX = 0

    init() {
        guard let imageURL = URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character1-removebg-preview.png") else {
            fatalError("character failed to load")
        }

        character = Image(sourceURL:imageURL)
        character2 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character2-removebg-preview.png")!)
        character3 = Image(sourceURL:URL(string:"https://codermerlin.com/users/layne-yarbrough/ISPImages/character3-removebg-preview.png")!)
        
        frames = []
        frames.append(character)
        frames.append(character2)
        frames.append(character3)
        super.init(name: "Character")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(character)
        canvas.setup(character2)
        canvas.setup(character3)
    }

    override func render(canvas:Canvas) {
        let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvas.canvasSize!)
        let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
        canvas.render(clearRectangle)
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
        /*
        if frames[index].isReady {
            canvas.render(frames[index])
           
        }
        **/
    }

    func increaseIndex() {
        if index == 0 {
            index = 1
        }else if index == 1 {
            index = 2
        }else{
            index = 0
        }
    }

    func moveForward() {
        increaseIndex()

        frames[0].renderMode = .destinationPoint(Point(x:charX,y:30))
        frames[1].renderMode = .destinationPoint(Point(x:charX+19,y:30))
        frames[2].renderMode = .destinationPoint(Point(x:charX-2,y:30))
        charX += 10
        
    }
}
