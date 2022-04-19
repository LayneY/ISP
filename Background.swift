import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

<<<<<<< HEAD
   // let sky :  NewSkyscraper
    
    init() {

     //   sky = NewSkyscraper()
=======

    
    init() {


>>>>>>> 2a7f1a3e364d05451e833c6b2b7e7b69e502e05e
        
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

<<<<<<< HEAD
    override func setup(canvasSize:Size, canvas:Canvas) {
        //create the blue sky
          let skyRect = Rect(topLeft:Point(x:0,y:0), size:Size(width:2000,height:1000))
          let skyRectangle = Rectangle(rect:skyRect)
          let skyFill = FillStyle(color:Color(.blue))
          canvas.render(skyFill, skyRectangle)

          //create the ground
          let groundR = Rect(topLeft:Point(x:0,y:800),size:Size(width:2000, height:200))
          let ground = Rectangle(rect:groundR)
          let gFill = FillStyle(color:Color(.green))
          canvas.render(gFill, ground)

          //render 3 skyscrapers 
       //   sky.renderSkyscraper(x:100,y:400,color:Color(.red),window:Color(.yellow),height:400,canvas:canvas)
         // sky.renderSkyscraper(x:400,y:50,color:Color(.gray),window:Color(.black),height:750,canvas:canvas)
         // sky.renderSkyscraper(x:800,y:550,color:Color(.tomato),window:Color(.orange),height:250,canvas:canvas)
      }
=======

>>>>>>> 2a7f1a3e364d05451e833c6b2b7e7b69e502e05e
}
