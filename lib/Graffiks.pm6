use v6;
class Graffiks;

use NativeCall;

sub _init_linux(int32,int32,Str,
  &callback_init (int32,int32),
  &callback_update (num32),
  &callback_draw (),
  &callback_finish ())

  is native("libgraffiks")
  is symbol("init_graffiks_xorg") { * }

method new(:&init, :&update, :&draw, :&finish,
           :$window_width = 640,
           :$window_height = 480,
           :$window_title = "Graffiks") {

  _init_linux($window_width, $window_height, $window_title,
              &init, &update, &draw, &finish);

  return self.bless();
}
