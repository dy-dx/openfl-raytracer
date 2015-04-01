package;

import openfl.geom.Vector3D;

class Intersection {

  public var hit : Bool;
  public var ray : Ray;
  public var point : Vector3D;
  public var normal : Vector3D;

  public function new (hit: Bool, ray: Ray, ?point: Vector3D, ?normal: Vector3D) {
    this.hit = hit;
    this.ray = ray;
    this.point = point;
    this.normal = normal;
  }

  public function distance () : Float {
    return point.subtract(ray.origin).length;
  }

}
