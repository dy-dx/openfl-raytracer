package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;

class Renderer {

  public var buffer : BitmapData;

  public function new (bitmapData:BitmapData) {
    this.buffer = bitmapData;
  }


  public function render () : BitmapData {
    return buffer;
  }

}
