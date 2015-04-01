package;

import openfl.geom.Vector3D;

class Scene3D {

  public var objects : Array<Object3D>;
  public var ambient : Float = 0;
  public var lightPos : Vector3D;

  public function new () {
    objects = new Array<Object3D>();
    lightPos = new Vector3D();
  }

  public function add (obj:Object3D) {
    objects.push(obj);
  }


}
