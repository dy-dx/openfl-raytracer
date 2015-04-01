package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

class Main extends Sprite {

  var bitmap : Bitmap;
  var bitmapData : BitmapData;

  var renderer : Renderer;

  var outputWidth:Int = 800;
  var outputHeight:Int = 600;


  public function new () {
    super();

    var scene = new Scene3D();
    var sphere = new Sphere(100);
    sphere.color = 0x0000FF;
    scene.add(sphere);

    var sphere2 = new Sphere(70);
    sphere2.position.setTo(150, 30, -50);
    sphere2.color = 0x0000FF;
    scene.add(sphere2);

    var sphere3 = new Sphere(120);
    sphere3.position.setTo(-200, -100, -150);
    sphere3.color = 0x00FF00;
    scene.add(sphere3);

    bitmapData = new BitmapData(outputWidth, outputHeight, false, 0x0);
    renderer = new Renderer(bitmapData);
    bitmap = new Bitmap(renderer.render(scene));

    addChild(bitmap);
  }


}
