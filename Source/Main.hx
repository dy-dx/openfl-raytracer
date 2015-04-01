package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.display.FPS;
import openfl.system.System;

class Main extends Sprite {

  var bitmap : Bitmap;
  var bitmapData : BitmapData;

  var renderer : Renderer;

  var outputWidth:Int = 800;
  var outputHeight:Int = 600;

  // stats
  var stats : TextField;

  var scene : Scene3D;
  var time : Float = Date.now().getTime();
  var sphere : Sphere;

  public function new () {
    super();

    this.stage.frameRate = 0.2;

    scene = new Scene3D();
    scene.ambient = 0.25;
    scene.lightPos.setTo(-50, 200, 150);

    sphere = new Sphere(100);
    sphere.color = 0x0000FF;
    scene.add(sphere);

    var sphere2 = new Sphere(70);
    sphere2.position.setTo(150, 30, -50);
    sphere2.color = 0xFF0000;
    scene.add(sphere2);

    var sphere3 = new Sphere(120);
    sphere3.position.setTo(-200, -100, -150);
    sphere3.color = 0x00FF00;
    scene.add(sphere3);

    var box = new Box(160, 120, 80);
    box.position.setTo(260, 180, -50);
    box.color = 0xFF00FF;
    scene.add(box);

    var box2 = new Box(60, 80, 180);
    box2.position.setTo(200, -180, 0);
    box2.color = 0x00FFFF;
    scene.add(box2);

    bitmapData = new BitmapData(outputWidth, outputHeight, false, 0x0);
    renderer = new Renderer(bitmapData);
    bitmap = new Bitmap(bitmapData);
    addChild(bitmap);

    // stats
    addChild(new FPS(10, 10, 0xffffff));
    stats = statsDisplay(10, 22, 0xFFFFFF);
    addChild(stats);

    // Render loop
    render(); // do an initial render when using a super slow framerate
    this.addEventListener(Event.ENTER_FRAME, render);
  }

  function statsDisplay (x:Float, y:Float, color:Int=0x0) : TextField {
    var t = new TextField();
    t.x = x;
    t.y = y;
    t.selectable = false;
    t.defaultTextFormat = new TextFormat("_sans", 12, color);
    t.autoSize = TextFieldAutoSize.LEFT;
    return t;
  }


  private function render (?e:Event) : Void {
    time = Date.now().getTime();
    sphere.position.x = Math.sin(time/1000) * 20;
    sphere.position.y = Math.cos(time/1000) * 20;
    bitmap.bitmapData = renderer.render(scene);
    var t1 = Date.now().getTime();

    stats.text = "Framerate set to " + stage.frameRate;
    stats.text += "\nRender time: " + (t1 - time);
    stats.text += "\nMem: " + Math.round(System.totalMemory / 1024 / 1024 * 100)/100;
  }


}
