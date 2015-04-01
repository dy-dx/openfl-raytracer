package;

import openfl.geom.Vector3D;

class Sphere extends Object3D {

  public var radius : Float;

  override public function new (?radius:Float) {
    super();
    this.radius = radius;
  }

  // http://www.scratchapixel.com/old/lessons/3d-basic-lessons/lesson-7-intersecting-simple-shapes/ray-sphere-intersection/

  override public function intersect (ray:Ray) : Intersection {

    // origin to center of sphere
    var L = position.subtract(ray.origin);

    var tca = L.dotProduct(ray.direction);

    if (tca < 0) {
      return new Intersection(false, ray);
    }

    var d = Math.sqrt( L.lengthSquared - tca*tca );

    if (d > radius) {
      return new Intersection(false, ray);
    }

    var thc = Math.sqrt(radius*radius - d*d);
    var hitDistance = Math.min(tca - thc, tca + thc);

    var point = ray.direction.clone();
    point.scaleBy(hitDistance);
    point = point.add(ray.origin);

    var normal = point.subtract(position);
    normal.normalize();

    var i = new Intersection(true, ray, point, normal);
    return i;
  }
}
