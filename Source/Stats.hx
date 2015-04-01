package;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.system.System;

class Stats extends TextField {

  public function new (x:Float, y:Float, color:Int=0x0) {
    super();

    this.x = x;
    this.y = y;
    selectable = false;
    defaultTextFormat = new TextFormat("_sans", 12, color);
    autoSize = TextFieldAutoSize.LEFT;
  }

  public function update (frameRate:Float, renderTime:Float) : Void {
    text = "";
    // text += "Framerate set to " + frameRate + "\n";
    text += "Render time: " + renderTime + "ms\n";
    text += "Mem: " + Math.round(System.totalMemory / 1024 / 1024 * 100)/100;
  }


}
