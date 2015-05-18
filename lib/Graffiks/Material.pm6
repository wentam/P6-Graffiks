use v6;
class Graffiks::Material is repr('CStruct');

use NativeCall;

has Pointer $.program;
has num32 $.diffuse_intensity;
has CArray[num32] $.diffuse_color;

sub _create_material()
  returns Graffiks::Material
  is native("libgraffiks")
  is symbol("create_material") { * }

method new() {
  return _create_material();
}
