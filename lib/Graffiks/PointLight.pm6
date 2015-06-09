use v6;
class Graffiks::PointLight is repr('CStruct');

use NativeCall;

has num32 $.x;
has num32 $.y;
has num32 $.z;
has num32 $.brightness;

sub gfks_add_point_light()
  returns Graffiks::PointLight
  is native("libgraffiks") { * }

sub gfks_get_point_light_x(Graffiks::PointLight)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_point_light_y(Graffiks::PointLight)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_point_light_z(Graffiks::PointLight)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_point_light_brightness(Graffiks::PointLight)
  returns num32
  is native("libgraffiks") { * }

sub gfks_set_point_light_location(Graffiks::PointLight, num32, num32, num32)
  is native("libgraffiks") { * }

sub gfks_set_point_light_brightness(Graffiks::PointLight, num32)
  is native("libgraffiks") { * }

method new() {
  return gfks_add_point_light();
}

method location-x() {
  return $.x;
}

method location-y() {
  return $.y;
}

method location-z() {
  return $.y;
}

method set_location($x, $y, $z) {
  gfks_set_point_light_location(self, num32.new($x), num32.new($y), num32.new($z));
}

method set_brightness($brightness) {
  gfks_set_point_light_brightness(self, num32.new($brightness));
}
