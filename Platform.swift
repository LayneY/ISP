import Igis
import Scenes

class platform: RenderableEntity {
    var rectangle: Rectangle

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        super.innit(name:"Platform")
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
}
