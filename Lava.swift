import Igis
import Scenes

class Lava : RenderableEntity {
    var rect = Rect(topLeft:Point(x:0,y:0),size:Size(width:0,height:0))
    var rectangle : Rectangle
    let stroke = StrokeStyle(color:Color(.red))
    let fill = FillStyle(color:Color(.red))
    
    init() {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        super.init(name: "Lava")
    }

    override func render(canvas:Canvas) {
        canvas.render(stroke,fill,rectangle)
    }

    func move(to point:Point) {
        rect.topLeft = point
        rectangle.rect = rect
    }

    func setSize(size:Size) {
        rect.size = size
        rectangle.rect = rect
    }

    func getBoundingRect() -> Rect {
        return self.rect
    }
}
