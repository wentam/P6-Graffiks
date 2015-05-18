use v6;
class Graffiks::Mesh is repr('CStruct');

use NativeCall;

# these are the same as the mesh.c "mesh" struct
# because we reperesent CStruct
has int32 $.triangle_buffer;
has int32 $.normal_buffer;
has int32 $.vertex_color_buffer;
has int32 $.vertex_count;
has int32 $.normal_count;
has num32 $.location_x;
has num32 $.location_y;
has num32 $.location_z;
has num32 $.angle;
has num32 $.rot_x;
has num32 $.rot_y;
has num32 $.rot_z;

sub _create_mesh(CArray, CArray, int32, CArray) returns Graffiks::Mesh is native("libgraffiks") is symbol('create_mesh') { * }

method new(@vertices, @faces, @normals) {
  my @Cvertices := CArray[CArray].new();

  for @vertices.kv -> $i, @vertex {
    @Cvertices[$i] = CArray[num32].new();

    for ^3 -> $j {
      @Cvertices[$i][$j] = num32.new(@vertex[$j]);
    }
  }

  my @Cfaces := CArray[CArray].new();

  for @faces.kv -> $i, @face {
    @Cfaces[$i] = CArray[CArray].new();

    for ^3 -> $j {
      @Cfaces[$i][$j] = CArray[int32].new();

      for ^3 -> $k {
        @Cfaces[$i][$j][$k] = @face[$j][$k];
      }
    }
  }

  my @Cnormals := CArray[CArray].new();

  for @normals.kv -> $i, @normal {
    @Cnormals[$i] = CArray[num32].new();

    for ^3 -> $j {
      @Cnormals[$i][$j] = num32.new(@normal[$j]);
    }
  }

  return _create_mesh(@Cvertices, @Cfaces, @Cfaces.elems, @Cnormals);
}
