use v6;
class Graffiks::Objloader;

use NativeCall;
use Graffiks::Object;

sub gfks_load_obj(int32, Str) returns Graffiks::Object is native("libgraffiks") { * }

method load ($filepath) {
  return gfks_load_obj(0x01,$filepath);
}
