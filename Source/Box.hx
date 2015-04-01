package;

import openfl.geom.Vector3D;

class Box extends Object3D {

  public var width : Float;
  public var depth : Float;
  public var height : Float;

  override public function new (width:Float=1, height:Float=1, depth:Float=1) {
    super();
    this.width = width;
    this.height = height;
    this.depth = depth;
  }

  // http://scratchapixel.com/old/lessons/3d-basic-lessons/lesson-7-intersecting-simple-shapes/ray-box-intersection/

  override public function intersect (ray:Ray) : Intersection {

    var b0x = position.x - width/2;
    var b1x = position.x + width/2;
    var b0y = position.y - height/2;
    var b1y = position.y + height/2;
    var b0z = position.z - depth/2;
    var b1z = position.z + depth/2;


    var t0x = ( b0x - ray.origin.x ) / ray.direction.x;
    var t1x = ( b1x - ray.origin.x ) / ray.direction.x;
    var t0y = ( b0y - ray.origin.y ) / ray.direction.y;
    var t1y = ( b1y - ray.origin.y ) / ray.direction.y;
    var t0z = ( b0z - ray.origin.z ) / ray.direction.z;
    var t1z = ( b1z - ray.origin.z ) / ray.direction.z;

    var normal = new Vector3D(-1, -1, -1);

    if (t0x > t1x) {
      var tempx = t0x;
      t0x = t1x;
      t1x = tempx;
      normal.x = 1;
    }
    if (t0y > t1y) {
      var tempy = t0y;
      t0y = t1y;
      t1y = tempy;
      normal.y = 1;
    }
    if (t0z > t1z) {
      var tempz = t0z;
      t0z = t1z;
      t1z = tempz;
      normal.z = 1;
    }

    var tmin = t0x;
    var tmax = t1x;

    if (tmin > t1y || t0y > t1x) {
      return new Intersection(false, ray); // return "false"
    }

    if (t0y > tmin) {
      tmin = t0y;
      normal.x = 0;
    } else {
      normal.y = 0;
    }
    if (t1y < tmax) { tmax = t1y; }

    if (tmin > t1z || t0z > tmax) {
      return new Intersection(false, ray); // return "false"
    }

    if (t0z > tmin) {
      tmin = t0z;
      normal.x = normal.y = 0;
    } else {
      normal.z = 0;
    }
    if (t1z < tmax) { tmax = t1z; }


    var point = ray.direction.clone();
    point.scaleBy(tmin);
    point = point.add(ray.origin);

    var i = new Intersection(true, ray, point, normal);
    return i;
  }

}
