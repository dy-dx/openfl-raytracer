package;

import openfl.geom.Vector3D;

class Ray extends Vector3D {

  public var origin : Vector3D;
  public var direction : Vector3D;

  override public function new (origin:Vector3D, x:Float=0, y:Float=0, z:Float=0) {
    super(x, y, z);
    this.origin = origin;
    super.copyFrom(super.subtract(origin));

    this.direction = super.clone();
    this.direction.normalize();
  }

}
