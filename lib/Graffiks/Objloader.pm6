use v6;
class Graffiks::Objloader;

use NativeCall;
use Graffiks::Object;

sub load_obj(Str) returns Graffiks::Object is native("libgraffiks") { * }

method load ($filepath) {
  return load_obj($filepath);
}
