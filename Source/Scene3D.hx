package;

class Scene3D {

  public var objects : Array<Object3D>;

  public function new () {
    objects = new Array<Object3D>();
  }

  public function add (obj:Object3D) {
    objects.push(obj);
  }


}
