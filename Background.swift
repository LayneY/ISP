import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {

    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

     func renderHexagon(turtle: Turtle, color: Color, width: Int) {
        turtle.penColor(color:color)
        for _ in 1...30{
            turtle.forward(steps: width)
            turtle.right(degrees:60)
        }
    }
    
    override func render(canvas:Canvas) {

        //using image for very complex background part


        if let canvasSize = canvas.canvasSize{

            let fillStyle0 = FillStyle(color: Color(.lightskyblue))
            let hi = Rectangle(rect:Rect(topLeft:Point(), size: canvasSize), fillMode: .fill)
            canvas.render(fillStyle0, hi)

            let turtle = Turtle(canvasSize:canvasSize)
            let colors = [Color(.yellow)]
            turtle.penUp()
            turtle.forward(steps: 178)
            turtle.penDown()
            for i in 1 ... 40 {
                let width = i * 3
                let color = colors[0]
                renderHexagon(turtle:turtle, color:color, width:width)
                turtle.right(degrees:72)
            }
            canvas.render(turtle)       
        }


        
        let lineWidth = LineWidth(width:10)
        let strokeStyle = StrokeStyle(color:Color(.orange))
        let fillStyle = FillStyle(color:Color(.yellow))
        canvas.render(lineWidth, strokeStyle, fillStyle, Ellipse(center:Point(x:945, y:300), radiusX:140, radiusY:140, fillMode: .fillAndStroke))


        //mountain 1
        let lineWidthM = LineWidth(width:7)
        let fillStyleM = FillStyle(color:Color(.peru))
        let strokeStyleM  = StrokeStyle(color:Color(.saddlebrown))
        let linesM = Path(fillMode: .fillAndStroke)
        linesM.moveTo(Point(x:0, y:1000))// starting point       
        linesM.lineTo(Point(x:480, y:310))
        linesM.lineTo(Point(x:960, y:1000))
        linesM.lineTo(Point(x:0, y:1000))
        canvas.render(lineWidthM, strokeStyleM, fillStyleM, linesM)


        //snow cap 1
        let lineWidthS = LineWidth(width:1)
        let fillStyleS = FillStyle(color:Color(.ghostwhite))
        let strokeStyleS  = StrokeStyle(color:Color(.floralwhite))
        let linesS = Path(fillMode: .fillAndStroke)
        linesS.moveTo(Point(x:345, y:510))// starting point       
        linesS.lineTo(Point(x:480, y:315))
        linesS.lineTo(Point(x:615, y:510))
        linesS.lineTo(Point(x:400, y:510))
        canvas.render(lineWidthS, strokeStyleS, fillStyleS, linesS)



        //mountain 3
        let lineWidthM3 = LineWidth(width:7)
        let fillStyleM3 = FillStyle(color:Color(.peru))
        let strokeStyleM3  = StrokeStyle(color:Color(.saddlebrown))
        let linesM3 = Path(fillMode: .fillAndStroke)
        linesM3.moveTo(Point(x:1500, y:1000))// starting point       
        linesM3.lineTo(Point(x:1850, y:350))
        linesM3.lineTo(Point(x:2100, y:1000))
        linesM3.lineTo(Point(x:1500, y:1000))
        canvas.render(lineWidthM3, strokeStyleM3, fillStyleM3, linesM3)


        //snow cap 3
        let lineWidthS3 = LineWidth(width:1)
        let fillStyleS3 = FillStyle(color:Color(.ghostwhite))
        let strokeStyleS3  = StrokeStyle(color:Color(.floralwhite))
        let linesS3 = Path(fillMode: .fillAndStroke)
        linesS3.moveTo(Point(x:1752, y:540))// starting point       
        linesS3.lineTo(Point(x:1922, y:540))
        linesS3.lineTo(Point(x:1850, y:355))
        linesS3.lineTo(Point(x:1752, y:540))
        canvas.render(lineWidthS3, strokeStyleS3, fillStyleS3, linesS3)





        //mountain 2
        let lineWidthM2 = LineWidth(width:7)
        let fillStyleM2 = FillStyle(color:Color(.peru))
        let strokeStyleM2  = StrokeStyle(color:Color(.saddlebrown))
        let linesM2 = Path(fillMode: .fillAndStroke)
        linesM2.moveTo(Point(x:480, y:1000))// starting point       
        linesM2.lineTo(Point(x:1200, y:550))
        linesM2.lineTo(Point(x:1700, y:1000))
        linesM2.lineTo(Point(x:480, y:1000))
        canvas.render(lineWidthM2, strokeStyleM2, fillStyleM2, linesM2)


        //snow cap 2
        let lineWidthS2 = LineWidth(width:1)
        let fillStyleS2 = FillStyle(color:Color(.ghostwhite))
        let strokeStyleS2  = StrokeStyle(color:Color(.floralwhite))
        let linesS2 = Path(fillMode: .fillAndStroke)
        linesS2.moveTo(Point(x:1126, y:600))// starting point       
        linesS2.lineTo(Point(x:1250, y:600))
        linesS2.lineTo(Point(x:1200, y:555))
        linesS2.lineTo(Point(x:1126, y:600))
        canvas.render(lineWidthS2, strokeStyleS2, fillStyleS2, linesS2)




   
    }
}
