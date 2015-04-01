package;

import openfl.geom.Vector3D;

class Object3D {

  public var color : Int;
  public var position : Vector3D;

  public function new () {
    color = 0x0;
    position = new Vector3D(0, 0, 0);
  }

  public function intersect (ray:Ray) : Intersection {
    throw "blah";
    return new Intersection(false, ray);
  }


}
