import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    let frc : Image
    let team5417 : Image
    let rapidreact : Image
    let firstrc : Image
    
    init() {
        guard let frcURL = URL(string:"https://d2pn8kiwq2w21t.cloudfront.net/images/i-xrWLRHJ-XL-16.width-1024.jpg") else {
            fatalError("Failed to create URL for frc")
        }
        frc = Image(sourceURL:frcURL)

        guard let t5417URL = URL(string:"https://i.ytimg.com/vi/9f04b6a2OVQ/maxresdefault.jpg") else {
            fatalError("team 5417 failed")
        }
        team5417 = Image(sourceURL:t5417URL)

        guard let rr = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl037GiUJ3lx6PY4W10nKywhxwBjT7XCOzuQ&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl037GiUJ3lx6PY4W10nKywhxwBjT7XCOzuQ&usqp=CAU") else {
            fatalError("rapid react failed")
        }
        rapidreact = Image(sourceURL:rr)

        guard let first = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj8ngtAokA--3i74R7npvVWMOubGA4fF-Ogg&usqp=CAU") else {
            fatalError("first failed")
        }
        firstrc = Image(sourceURL:first)

        
        
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(frc)
        canvas.setup(team5417)
        canvas.setup(rapidreact)
        canvas.setup(firstrc)
    }

    override func render(canvas:Canvas) {
        renderImages(canvas:canvas)
    }

    func renderImages(canvas:Canvas) {
        if frc.isReady {
            //let frcsourceRect = Rect(topLeft:Point(x:740,y:400), size:Size(width:400,height:600))
            //let frcdestinationRect = Rect(topLeft:Point(x:100,y:200), size:Size(width:266, height:247))
            frc.renderMode = .destinationRect(Rect(topLeft:Point(x:10,y:200), size:Size(width:560, height:347)))
            canvas.render(frc)
            renderRectangle(x:10,y:200,width:560,height:347,strokeColor:Color(.red), canvas:canvas)
        }

        if team5417.isReady {
            let t5417sourceRect = Rect(topLeft:Point(x:450,y:100), size:Size(width:400,height:550))
            let t5417Destination = Rect(topLeft:Point(x:900,y:200), size:Size(width:300, height:300))
            team5417.renderMode = .sourceAndDestination(sourceRect:t5417sourceRect, destinationRect:t5417Destination)
            canvas.render(team5417)
            renderRectangle(x:900,y:200,width:300,height:300,strokeColor:Color(.yellow), canvas:canvas)
        }

        if rapidreact.isReady {
            rapidreact.renderMode = .destinationRect(Rect(topLeft:Point(x:600,y:300), size:Size(width:150,height:100)))
            canvas.render(rapidreact)
            renderRectangle(x:600,y:300,width:150,height:100,strokeColor:Color(.blue), canvas:canvas)
        }

        if firstrc.isReady {
            firstrc.renderMode = .destinationRect(Rect(topLeft:Point(x:50,y:50), size:Size(width:400, height:100)))
            canvas.render(firstrc)
            renderRectangle(x:50,y:50,width:400,height:100,strokeColor:Color(.green), canvas:canvas)
        }
    }

    func renderRectangle(x:Int, y:Int, width:Int, height:Int, strokeColor:Color, canvas:Canvas) {
        let rect = Rect(topLeft:Point(x:x,y:y), size:Size(width:width, height:height))
        let rectangle = Rectangle(rect:rect, fillMode:.stroke)
        let color = StrokeStyle(color:strokeColor)
        let lineWidth = LineWidth(width:5)
        canvas.render(color, lineWidth, rectangle)
    }
}
