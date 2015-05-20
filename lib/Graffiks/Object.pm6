use v6;
class Graffiks::Object is repr('CStruct');

use NativeCall;
use Graffiks::Mesh;
use Graffiks::Material;

has CArray $.meshes;
has CArray $.mats;
has int32 $.mesh_count;
has num32 $.location_x;
has num32 $.location_y;
has num32 $.location_z;
has num32 $.angle;
has num32 $.rot_x;
has num32 $.rot_y;
has num32 $.rot_z;

sub create_object(CArray, CArray, int32)
    returns Graffiks::Object
    is native("libgraffiks") { * }

sub draw_object_fw(Graffiks::Object) is native("libgraffiks") { * }

method new (@meshes, @mats) {
  my @Cmeshes := CArray[Graffiks::Mesh].new();

  for @meshes.kv -> $i, $mesh {
      @Cmeshes[$i] = $mesh;
  }

  my @Cmats := CArray[Graffiks::Material].new();

  for @mats.kv -> $i, $mat {
    @Cmats[$i] = $mat;
  }

  say @meshes.elems;

  return create_object(@Cmeshes, @Cmats, @meshes.elems);
}

method draw() {
    draw_object_fw(self);
}

multi method set_location($x, $y, $z) {
    $!location_x = num32.new($x);
    $!location_y = num32.new($y);
    $!location_z = num32.new($z);
}

multi method set_location(:$x!, :$y!, :$z!) {
  self.set_location($x, $y, $z);
}

multi method set_rotation($angle, $x, $y, $z) {
    $!angle = num32.new($angle);
    $!rot_x = num32.new($x);
    $!rot_y = num32.new($y);
    $!rot_z = num32.new($z);
}

multi method set_rotation(:$angle!, :$x!, :$y!, :$z!) {
  self.set_rotation($angle, $x, $y, $z);
}
