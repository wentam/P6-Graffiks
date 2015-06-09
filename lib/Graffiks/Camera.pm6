use v6;
class Graffiks::Camera is repr('CStruct');

use NativeCall;

has num32 $.location_x;
has num32 $.location_y;
has num32 $.location_z;
has num32 $.target_x;
has num32 $.target_y;
has num32 $.target_z;
has num32 $.up_x;
has num32 $.up_y;
has num32 $.up_z;

sub gfks_create_camera()
  returns Graffiks::Camera
  is native("libgraffiks") { * }

sub gfks_set_active_camera(Graffiks::Camera)
  is native("libgraffiks") { * }

sub gfks_set_camera_location(Graffiks::Camera, num32, num32, num32)
  is native("libgraffiks") { * }

sub gfks_set_camera_target(Graffiks::Camera, num32, num32, num32)
  is native("libgraffiks") { * }

sub gfks_rotate_camera(Graffiks::Camera, num32, num32, num32, num32)
  is native("libgraffiks") { * }

sub gfks_get_camera_location_x(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_camera_location_y(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_camera_location_z(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_camera_target_x(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_camera_target_y(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

sub gfks_get_camera_target_z(Graffiks::Camera)
  returns num32
  is native("libgraffiks") { * }

method new() {
  return gfks_create_camera();
}

#= Makes this the active camera
method make-active() {
  gfks_set_active_camera(self);
}

#= Sets the location of the camera
method set_location($x, $y, $z) {
  gfks_set_camera_location(self, num32.new($x), num32.new($y), num32.new($z));
}

method location-x() {
  return gfks_get_camera_location_x(self);
}

method location-y() {
  return gfks_get_camera_location_y(self);
}

method location-z() {
  return gfks_get_camera_location_z(self);
}
