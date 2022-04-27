import Igis
import Scenes

class Platform: RenderableEntity {
    var rectangle: Rectangle
    var platformBoundingRect : Rect
    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        self.platformBoundingRect(topLeft:Poin(x:0,y:0), size:Size(width:1,height:1))
        super.init(name:"Platform")
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.maroon))
        let lineWidth = LineWidth(width:3)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    func platformBoundingRect() -> Rect {
        return self.platformBoundingRect
    }
}
