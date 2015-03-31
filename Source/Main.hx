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
    var sphere = new Sphere();
    sphere.radius = 100;
    scene.add(sphere);

    bitmapData = new BitmapData(outputWidth, outputHeight, false, 0x444444);
    renderer = new Renderer(bitmapData);
    bitmap = new Bitmap(renderer.render(scene));

    addChild(bitmap);
  }


}
