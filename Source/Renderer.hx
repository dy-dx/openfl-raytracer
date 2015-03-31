package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Vector3D;

class Renderer {

  public var buffer : BitmapData;

  public function new (bitmapData:BitmapData) {
    this.buffer = bitmapData;
  }


  public function render (scene:Scene3D) : BitmapData {
    var bufferWidth = buffer.width;
    var bufferHeight = buffer.height;

    for (j in 0...bufferHeight) {
      for (i in 0...bufferWidth) {

        var x:Int = (i - Math.floor(bufferWidth/2));
        var y:Int = -(j - Math.floor(bufferHeight/2));

        var minDist:Float = Math.POSITIVE_INFINITY;
        var primaryRay:Ray = computePrimaryRay(x, y);
        // var pHit:Point3D;
        // var nHit:Normal;
        var closestObject:Object3D = null;

        for (object in scene.objects) {
          if (intersect(object, primaryRay)) {
            // todo: compare distance with other intersected objects
            closestObject = object;
          }
        }

        if (closestObject != null) {
          buffer.setPixel(i, j, closestObject.color);
        }

      }
    }


    return buffer;
  }


  function computePrimaryRay(x:Int, y:Int) : Ray {
    var eye = new Vector3D(0, 0, -800);
    var ray = new Ray(x, y, 0);
    ray.subtract(eye);
    return ray;
  }

  function intersect(object:Object3D, primaryRay:Ray) : Bool {
    // todo
    return true;
  }

}
