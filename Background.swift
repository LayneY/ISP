import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {

    // var to set up audio
    let backS: Audio
    
    init() {
        // Using a meaningful name can be helpful for debugging

        //link to get sound incase somthing happens (https://www.chosic.com/download-audio/29716/)

        //getting audio
        guard let backURL = URL(string: "https://media.chosic.com/wp-content/uploads/2021/12/BoxCat-Games-Epic-Song.mp3")
        else{
            fatalError("failed audio") 
        }
        backS = Audio(sourceURL:backURL, shouldLoop:true)

        super.init(name:"Background") 
    }


    
    //func to create the hexagon that is repeated and used by turtle for and effect around the sun
    func renderHexagon(turtle: Turtle, color: Color, width: Int) {
        turtle.penColor(color:color)
        for _ in 1...30{
            turtle.forward(steps: width)
            turtle.right(degrees:60)
        }
    }


    
    // func to set up audio
    override func setup(canvasSize:Size, canvas:Canvas){
        canvas.setup(backS)
    }


    
    override func render(canvas:Canvas) {
        
        if let canvasSize = canvas.canvasSize{
            //vars to propotionalize sun height on all screens
            let canvasHeight: Double = Double(canvasSize.height)
            let SunHDiv: Double = 3.23666
            let SunHPos: Double = canvasHeight/SunHDiv

            
            //vars to propotionalize sun width on all screens
            let canvasWidth: Double = Double(canvasSize.width)
            let SunWDiv: Double = 2.02751
            let SunWPos: Double = canvasWidth/SunWDiv

            
            //vars to propotionalize sun radius on all screens
            let SunRDiv: Double = 13.5642
            let SunR: Double = canvasWidth/SunRDiv

            
            //vars to propotionalize the turtle sun effects on all screens
            let turtleNumRDiv: Double = 47.9
            let turtleNumR: Double = canvasWidth/turtleNumRDiv

            let turtleFDiv: Double = 10.2
            let turtleF: Double = canvasWidth/turtleFDiv

            
            //light blue background
            let fillStyle0 = FillStyle(color: Color(.lightskyblue))
            let sky = Rectangle(rect:Rect(topLeft:Point(), size: canvasSize), fillMode: .fill)
            canvas.render(fillStyle0, sky)

            
            //turtle setup
            let turtle = Turtle(canvasSize:canvasSize)
            let colors = [Color(.yellow)]
            turtle.penUp()

            
            //turtle start position
            turtle.forward(steps: Int(turtleF))
            turtle.penDown()

            
            //reapeated turtle to create design around sun
            for i in 1 ... Int(turtleNumR) {
                let width = i * 3
                let color = colors[0]
                renderHexagon(turtle:turtle, color:color, width:width)
                turtle.right(degrees:72)
            }
            canvas.render(turtle)       
            

            //sun
            let lineWidth = LineWidth(width:10)
            let strokeStyle = StrokeStyle(color:Color(.orange))
            let fillStyle = FillStyle(color:Color(.yellow))
            canvas.render(lineWidth, strokeStyle, fillStyle, Ellipse(center:Point(x:Int(SunWPos), y:Int(SunHPos)), radiusX:Int(SunR), radiusY:Int(SunR), fillMode: .fillAndStroke))


            //on school computer canvasWidth = 1899

          
            //vars to propotionalize mountian 1 on all screens
            let mW1Divy: Double = 1.899
            let mW2Divx: Double = 3.95625
            let mW2Divy: Double = 6.1258
            let mW3Divx: Double = 1.978125
            let mW3Divy: Double = 1.899
            let mW4Divy: Double = 1.899
            let mW1y: Double = canvasWidth/mW1Divy
            let mW2x: Double = canvasWidth/mW2Divx
            let mW2y: Double = canvasWidth/mW2Divy
            let mW3x: Double = canvasWidth/mW3Divx
            let mW3y: Double = canvasWidth/mW3Divy
            let mW4y: Double = canvasWidth/mW4Divy
          
            //mountain 1
            let lineWidthM = LineWidth(width:7)
            let fillStyleM = FillStyle(color:Color(.peru))
            let strokeStyleM  = StrokeStyle(color:Color(.saddlebrown))
            let linesM = Path(fillMode: .fillAndStroke)
            linesM.moveTo(Point(x:0, y:Int(mW1y)))       
            linesM.lineTo(Point(x:Int(mW2x), y:Int(mW2y)))
            linesM.lineTo(Point(x:Int(mW3x), y:Int(mW3y)))
            linesM.lineTo(Point(x:0, y:Int(mW4y)))
            canvas.render(lineWidthM, strokeStyleM, fillStyleM, linesM)


            
            
            //vars to propotionalize snow cap 1 on all screens
            let sW1Divx: Double = 5.504
            let sW1Divy: Double = 3.7235
            let sW2Divx: Double = 3.95625
            let sW2Divy: Double = 6.02857
            let sW3Divx: Double = 3.087
            let sW3Divy: Double = 3.7235
            let sW4Divx: Double = 4.7475
            let sW4Divy: Double = 3.7235 
            let sW1x: Double = canvasWidth/sW1Divx
            let sW1y: Double = canvasWidth/sW1Divy
            let sW2x: Double = canvasWidth/sW2Divx
            let sW2y: Double = canvasWidth/sW2Divy
            let sW3x: Double = canvasWidth/sW3Divx
            let sW3y: Double = canvasWidth/sW3Divy
            let sW4x: Double = canvasWidth/sW4Divx
            let sW4y: Double = canvasWidth/sW4Divy
            
            //snow cap 1
            let lineWidthS = LineWidth(width:1)
            let fillStyleS = FillStyle(color:Color(.ghostwhite))
            let strokeStyleS  = StrokeStyle(color:Color(.floralwhite))
            let linesS = Path(fillMode: .fillAndStroke)
            linesS.moveTo(Point(x:Int(sW1x), y:Int(sW1y)))       
            linesS.lineTo(Point(x:Int(sW2x), y:Int(sW2y)))
            linesS.lineTo(Point(x:Int(sW3x), y:Int(sW3y)))
            linesS.lineTo(Point(x:Int(sW4x), y:Int(sW4y)))
            canvas.render(lineWidthS, strokeStyleS, fillStyleS, linesS)



            
            //vars to propotionalize mountian 3 on all screens
            let m3W1Divx: Double = 1.266
            let m3W1Divy: Double = 1.899
            let m3W2Divx: Double = 1.0264
            let m3W2Divy: Double = 5.4257
            let m3W3Divx: Double = 0.90428
            let m3W3Divy: Double = 1.899
            let m3W4Divx: Double = 1.266
            let m3W4Divy: Double = 1.899 
            let m3W1x: Double = canvasWidth/m3W1Divx
            let m3W1y: Double = canvasWidth/m3W1Divy
            let m3W2x: Double = canvasWidth/m3W2Divx
            let m3W2y: Double = canvasWidth/m3W2Divy
            let m3W3x: Double = canvasWidth/m3W3Divx
            let m3W3y: Double = canvasWidth/m3W3Divy
            let m3W4x: Double = canvasWidth/m3W4Divx
            let m3W4y: Double = canvasWidth/m3W4Divy

            //mountain 3
            let lineWidthM3 = LineWidth(width:7)
            let fillStyleM3 = FillStyle(color:Color(.peru))
            let strokeStyleM3  = StrokeStyle(color:Color(.saddlebrown))
            let linesM3 = Path(fillMode: .fillAndStroke)
            linesM3.moveTo(Point(x:Int(m3W1x), y:Int(m3W1y)))       
            linesM3.lineTo(Point(x:Int(m3W2x), y:Int(m3W2y)))
            linesM3.lineTo(Point(x:Int(m3W3x), y:Int(m3W3y)))
            linesM3.lineTo(Point(x:Int(m3W4x), y:Int(m3W4y)))
            canvas.render(lineWidthM3, strokeStyleM3, fillStyleM3, linesM3)



            
            //vars to propotionalize snow cap 3 on all screens
            let s3W1Divx: Double = 1.0839
            let s3W1Divy: Double = 3.51666
            let s3W2Divx: Double = 0.988
            let s3W2Divy: Double = 3.51666
            let s3W3Divx: Double = 1.02648
            let s3W3Divy: Double = 5.3492
            let s3W4Divx: Double = 1.0839
            let s3W4Divy: Double = 3.51666 
            let s3W1x: Double = canvasWidth/s3W1Divx
            let s3W1y: Double = canvasWidth/s3W1Divy
            let s3W2x: Double = canvasWidth/s3W2Divx
            let s3W2y: Double = canvasWidth/s3W2Divy
            let s3W3x: Double = canvasWidth/s3W3Divx
            let s3W3y: Double = canvasWidth/s3W3Divy
            let s3W4x: Double = canvasWidth/s3W4Divx
            let s3W4y: Double = canvasWidth/s3W4Divy
            
            //snow cap 3
            let lineWidthS3 = LineWidth(width:1)
            let fillStyleS3 = FillStyle(color:Color(.ghostwhite))
            let strokeStyleS3  = StrokeStyle(color:Color(.floralwhite))
            let linesS3 = Path(fillMode: .fillAndStroke)
            linesS3.moveTo(Point(x:Int(s3W1x), y:Int(s3W1y)))       
            linesS3.lineTo(Point(x:Int(s3W2x), y:Int(s3W2y)))
            linesS3.lineTo(Point(x:Int(s3W3x), y:Int(s3W3y)))
            linesS3.lineTo(Point(x:Int(s3W4x), y:Int(s3W4y)))
            canvas.render(lineWidthS3, strokeStyleS3, fillStyleS3, linesS3)



            
            //vars to propotionalize mountian 2 on all screens
            let m2W1Divx: Double = 3.95625
            let m2W1Divy: Double = 1.899
            let m2W2Divx: Double = 1.5825
            let m2W2Divy: Double = 3.4527
            let m2W3Divx: Double = 1.11705
            let m2W3Divy: Double = 1.899
            let m2W4Divx: Double = 3.95625
            let m2W4Divy: Double = 1.899 
            let m2W1x: Double = canvasWidth/m2W1Divx
            let m2W1y: Double = canvasWidth/m2W1Divy
            let m2W2x: Double = canvasWidth/m2W2Divx
            let m2W2y: Double = canvasWidth/m2W2Divy
            let m2W3x: Double = canvasWidth/m2W3Divx
            let m2W3y: Double = canvasWidth/m2W3Divy
            let m2W4x: Double = canvasWidth/m2W4Divx
            let m2W4y: Double = canvasWidth/m2W4Divy

            //mountain 2
            let lineWidthM2 = LineWidth(width:7)
            let fillStyleM2 = FillStyle(color:Color(.peru))
            let strokeStyleM2  = StrokeStyle(color:Color(.saddlebrown))
            let linesM2 = Path(fillMode: .fillAndStroke)
            linesM2.moveTo(Point(x:Int(m2W1x), y:Int(m2W1y)))       
            linesM2.lineTo(Point(x:Int(m2W2x), y:Int(m2W2y)))
            linesM2.lineTo(Point(x:Int(m2W3x), y:Int(m2W3y)))
            linesM2.lineTo(Point(x:Int(m2W4x), y:Int(m2W4y)))
            canvas.render(lineWidthM2, strokeStyleM2, fillStyleM2, linesM2)



            
            //vars to propotionalize snow cap 2 on all screens
            let s2W1Divx: Double = 1.6865
            let s2W1Divy: Double = 3.165
            let s2W2Divx: Double = 1.5192
            let s2W2Divy: Double = 3.165
            let s2W3Divx: Double = 1.5825
            let s2W3Divy: Double = 3.421621
            let s2W4Divx: Double = 1.6865
            let s2W4Divy: Double = 3.165 
            let s2W1x: Double = canvasWidth/s2W1Divx
            let s2W1y: Double = canvasWidth/s2W1Divy
            let s2W2x: Double = canvasWidth/s2W2Divx
            let  s2W2y: Double = canvasWidth/s2W2Divy
            let s2W3x: Double = canvasWidth/s2W3Divx
            let s2W3y: Double = canvasWidth/s2W3Divy
            let s2W4x: Double = canvasWidth/s2W4Divx
            let s2W4y: Double = canvasWidth/s2W4Divy

            //snow cap 2
            let lineWidthS2 = LineWidth(width:1)
            let fillStyleS2 = FillStyle(color:Color(.ghostwhite))
            let strokeStyleS2  = StrokeStyle(color:Color(.floralwhite))
            let linesS2 = Path(fillMode: .fillAndStroke)
            linesS2.moveTo(Point(x:Int(s2W1x), y:Int(s2W1y)))       
            linesS2.lineTo(Point(x:Int(s2W2x), y:Int(s2W2y)))
            linesS2.lineTo(Point(x:Int(s2W3x), y:Int(s2W3y)))
            linesS2.lineTo(Point(x:Int(s2W4x), y:Int(s2W4y)))
            canvas.render(lineWidthS2, strokeStyleS2, fillStyleS2, linesS2)
        }

        
        //if the sound is ready then play it
        if backS.isReady{
            canvas.render(backS)
        }

        
    }
}
