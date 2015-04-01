package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Vector3D;
import openfl.geom.ColorTransform;

class Renderer {

  public var buffer : BitmapData;

  var eye : Vector3D;
  var bufferWidth : Int;
  var bufferHeight : Int;

  public function new (bitmapData:BitmapData) {
    this.buffer = bitmapData;
    this.bufferWidth = buffer.width;
    this.bufferHeight = buffer.height;
    this.eye = new Vector3D(0, 0, bitmapData.width/2);
  }


  public function render (scene:Scene3D) : BitmapData {
    buffer.lock();
    clearBuffer();

    for (j in 0...bufferHeight) {
      for (i in 0...bufferWidth) {

        var x:Int = (i - Math.floor(bufferWidth/2));
        var y:Int = -(j - Math.floor(bufferHeight/2));

        var minDistance:Float = Math.POSITIVE_INFINITY;
        var primaryRay:Ray = computePrimaryRay(x, y);
        var closestObject:Object3D = null;
        var pHit:Vector3D = null;
        var nHit:Vector3D = null;

        for (object in scene.objects) {
          var hit:Intersection = object.intersect(primaryRay);
          if (hit.hit && minDistance > hit.distance()) {
            closestObject = object;
            minDistance = hit.distance();
            pHit = hit.point;
            nHit = hit.normal;
          }
        }

        if (closestObject != null) {
          var lightDir = scene.lightPos.subtract(pHit);
          lightDir.normalize();
          var brightness = Math.max(0, lightDir.dotProduct(nHit));
          var color = shading(closestObject.color, brightness, scene.ambient);
          buffer.setPixel(i, j, color);
        }

      }
    }

    buffer.unlock();

    return buffer;
  }

  function shading (color:Int, brightness:Float, ambient:Float) : Int {
    var r = (color >> 16) & 0xFF;
    var g = (color >> 8) & 0xFF;
    var b = color & 0xFF;
    var rgb = new Vector3D(r, g, b);
    rgb.scaleBy(brightness);
    rgb.x += ambient*r;
    rgb.y += ambient*g;
    rgb.z += ambient*b;
    r = Math.floor(Math.min(255, rgb.x));
    g = Math.floor(Math.min(255, rgb.y));
    b = Math.floor(Math.min(255, rgb.z));

    var hexcolor = (r << 16) + (g << 8) + b;
    return hexcolor;
  }


  function computePrimaryRay(x:Int, y:Int) : Ray {
    return new Ray(eye, x, y, 0);
  }

  function clearBuffer (color:Int = 0) : Void {
    buffer.fillRect(buffer.rect, color);
  }

}
