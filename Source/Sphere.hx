package;

import openfl.geom.Vector3D;

class Sphere extends Object3D {

  public var radius : Float;

  override public function new (?radius:Float) {
    super();
    this.radius = radius;
  }

  // http://www.scratchapixel.com/old/lessons/3d-basic-lessons/lesson-7-intersecting-simple-shapes/ray-sphere-intersection/

  override public function intersect (ray:Ray) : Bool {

    // solutions for t if the ray intersects
    var t0:Ray, t1:Ray;


    // origin of ray
    var o = ray.origin;
    // direction of ray
    var r = ray.clone();
    r.normalize();
    // origin to center of sphere
    var L = position.subtract(o);

    var tca = L.dotProduct(r);

    if (tca < 0) {
      return false;
    }

    var d = Math.sqrt( L.dotProduct(L) - tca*tca );

    if (d > radius) {
      return false;
    }

    return true;
  }
}
