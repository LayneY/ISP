import Igis
import Scenes

class FinishText : RenderableEntity {
    var text : Text = Text(location:Point(x:1,y:1),text:"")
    var character : Character
    init(character:Character) {
        self.character = character
    }

    override func render(canvas:Canvas) {
        if character.isFinished {
            let finishText : Text
            let x = canvas.canvasSize!.center.x - 700
            let y = canvas.canvasSize!.center.y + 30
            finishText = Text(location:Point(x:x,y:y), text:"YOU WON!")
            finishText.font = "200pt Arial"
              let fill = FillStyle(color:Color(.black))
              canvas.render(fill,finishText)
        }
    }
}
