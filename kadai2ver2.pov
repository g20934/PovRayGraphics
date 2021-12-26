//汽車を作りました。
#include "colors.inc"
#include "shapes.inc"
#include "stones.inc"
#include "komuro.inc"
#include "woods.inc"
#include "golds.inc"
#include "skies.inc"
#include "metals.inc"
#include "textures.inc"
#include "shapes2.inc"

camera {
  location <10,5,10>//10, 5, 10
  look_at <0,0,0>
  angle 60
}

light_source { <20,20,20> color White }

//汽車
union{
  //汽車の荷台
  union{
    //上の丸み
    difference{
            object{
              cylinder{
                <0, 0, 0>, <0, 1, 0>, 1.5
              }
              texture {Yellow_Pine}
            }

          object{
            Cube
            texture {Yellow_Pine}
            scale 1.5
            translate<0,0,1>
          }

          rotate<90, 0, 0>
          scale<1.1, 1, 2>
          translate<0, 1.0, -1.0>

    }
    //荷台の上の装飾
    difference{
      object{
        cylinder{
          <0, 0, 0>, <0, 1, 0>, 1
        }
        texture {T_Wood14}
      }
      union{
        object{
          cylinder{
            <0, -0.5, 0>, <0, 1.5, 0>, 0.9
          }
          texture {T_Wood14}
        }
        object{
          Cube
          scale<1, 2, 1>
          translate<0, 0, 1.0>
          texture {T_Wood14}
        }
      }
      scale<1.6, 2.5, 1.3>
      rotate<90, 0, 0>
      translate<0, 1.5, -1.2>
    }

    //下の直方体
    difference{
      object {
        Cube
        texture {Yellow_Pine}
        scale<1.5, 1.1, 1>
        translate<0, 0.4, 0>
      }

      union{

        //z軸方向に切る
          //奥
          object {
            Cube
            texture {T_Wood12}
            scale<0.3, 0.5, 1.5>
            translate<0.9, 1.1, 0>
          }

          //手前
          object {
            Cube
            texture {T_Wood12}
            scale<0.3, 0.5, 1.5>
            translate<-0.9, 1.1, 0>
          }

          //真ん中
          object {
            Cube
            texture {T_Wood12}
            scale<0.3, 0.5, 1.5>
            translate<0, 1.1, 0>
          }
          //x軸方向に切る
            //汽車を正面から見た時、左前
            object {
              Cube
              texture {T_Wood12}
              scale<0.7, 0.5, 0.3>
              translate<1, 1.1, 0.4>
            }

            //汽車を正面から見た時、左後
            object {
              Cube
              texture {T_Wood12}
              scale<0.7, 0.5, 0.3>
              translate<1, 1.1, -0.4>
            }

            //汽車を正面から見た時、右前&右後ろ
            union{
              object {
                Cube
                texture {T_Wood12}
                scale<0.7, 0.5, 0.3>
                translate<1, 1.1, 0.4>
              }

              object {
                Cube
                texture {T_Wood12}
                scale<0.7, 0.5, 0.3>
                translate<1, 1.1, -0.4>
              }
              translate<-2, 0, 0>
            }

            //中をきる
              object {
                Cube
                texture {T_Wood12}
                scale<1.0, 0.5, 0.7>
                translate<0, 0.4, 0>
              }
          }
    }
    scale<1, 1, 1.3>
    translate<0, 1.5, -1.3>//-1.3
  }

  //汽車の先頭
  union{
      //本体赤部分
      difference{
        object{
          cylinder{
            <0, 0, 0>, <0, 3, 0>, 1.5
          }
          texture {T_Copper_4A}
          //pigment{color Red}
          rotate<90, 0, 0>
        }

        object{
          Cube
          scale<1.5, 1.5, 3>
          translate<0, -1.5, 1>
        }

      }

      //赤の前についている黒
      object{
        cylinder{
          <0, 0, 0>, <0, 0.5, 0>, 1.0
        }
        pigment{color Black}
        rotate<90, 0, 0>
        translate<0, 0, 3>
      }

      //黒の前についている金
      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.3
        }
        texture{T_Gold_1E}
        rotate<90, 0, 0>
        translate<0, 0, 3.5>

      }

      //赤い円柱の下の黒い板
      object{
        Cube
        pigment{color Black}
        scale<1.7, 0.2, 1.5>
        translate<0, -0.2, 1.5>
      }


      //煙突（黒）
      //煙突（黒）
      union{
        union{
        //煙突上の装飾
          object{
            cone{
              <0, 0, 0>, 0.7//底面
              <0, 0.5, 0>, 0.5 //上面
              texture {T_Chrome_1A}
            }
          }

          object{
            cone{
              <0, 0, 0>, 0.7//底面
              <0, 0.5, 0>, 0.5 //上面
              texture {T_Chrome_1A}
            }rotate<0, 0, 180>
          }

          translate<0, 1.2+0.5, 0>

        }

        //煙突本体
        object{
          cylinder{
            <0, 0, 0>, <0, 1.2, 0>, 0.5
          }
        }

        translate<0, 1.5, 2>

      }



      //煙突よりも後ろにある金色の円柱
      object{
        cylinder{
          <0, 0, 0>, <0, 0.7, 0>, 0.5
        }texture{T_Gold_1E}
        translate<0, 1.5, 0.7>
      }

      translate<0, 1, 0>
  }

  //車輪
  union{
    //汽車を正面から見た時、左前
    union{
      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.7
        }pigment{color Black}
        rotate<0, 0, 90>
        translate<1, 0, 0>
      }

      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.3
        }texture {Silver_Texture}
        rotate<0, 0, 90>
        translate<1.1, 0, 0>
      }
      translate<0, -0.6, 2>

    }

    //汽車を正面から見た時、左中央
    union{
      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.7
        }pigment{color Black}
        rotate<0, 0, 90>
        translate<1.0, 0, 0>
      }

      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.3
        }texture {Silver_Texture}
        rotate<0, 0, 90>
        translate<1.1, 0, 0>
      }
      translate<0, -0.6, 0>

    }

    //汽車を正面から見た時、左後
    union{
      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.7
        }pigment{color Black}
        rotate<0, 0, 90>
        translate<1.0, 0, 0>
      }

      object{
        cylinder{
          <0, 0, 0>, <0, 0.1, 0>, 0.3
        }texture {Silver_Texture}
        rotate<0, 0, 90>
        translate<1.1, 0, 0>
      }
      translate<0, -0.6, -2>

    }

    //左側の車輪を連結する直方体
    union{
      object{
        Cube
        texture {Silver_Texture}
        scale<0.1, 0.1, 1>
        translate<1.0, -0.7, 1.1>

      }

      object{
        Cube
        texture {Silver_Texture}
        scale<0.1, 0.1, 1>
        translate<1.0, -0.7, -1.1>
      }
    }

    //汽車を正面から見た時、右前＆右中央&右後
    union{
      union{
        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.7
          }pigment{color Black}
          rotate<0, 0, 90>
          translate<1, 0, 0>
        }

        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.3
          }texture {Silver_Texture}
          rotate<0, 0, 90>
          translate<0.8, 0, 0>
        }
        translate<0, -0.6, 2>

      }
      union{
        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.7
          }pigment{color Black}
          rotate<0, 0, 90>
          translate<1.0, 0, 0>
        }

        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.3
          }texture {Silver_Texture}
          rotate<0, 0, 90>
          translate<0.8, 0, 0>
        }
        translate<0, -0.6, 0>

      }
      union{
        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.7
          }pigment{color Black}
          rotate<0, 0, 90>
          translate<1.0, 0, 0>
        }

        object{
          cylinder{
            <0, 0, 0>, <0, 0.1, 0>, 0.3
          }texture {Silver_Texture}
          rotate<0, 0, 90>
          translate<0.8, 0, 0>
        }
        translate<0, -0.6, -2>

      }

      //右側の車輪を連結する直方体
      union{
        object{
          Cube
          texture {Silver_Texture}
          scale<0.1, 0.1, 1>
          translate<0.9, -0.7, 1.1>

        }

        object{
          Cube
          texture {Silver_Texture}
          scale<0.1, 0.1, 1>
          translate<0.9, -0.7, -1.1>
        }
      }
      translate<-1.5, 0, 0>
    }
    translate<0, 0.8, 0>
  }

  translate< 0, 0.6, 0>
}


//背景
sky_sphere{
  S_Cloud1
}

//地面
object{
  Plane_XZ
  texture{T_Stone40}
}

//線路
//進行方向と垂直
object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, 0>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, 3>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, 6>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, 9>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -3>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -6>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -9>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -12>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -15>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -18>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -21>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -24>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -27>

}

object{
  Cube
  texture{T_Wood8}
  scale<2.5, 0.2, 0.3>
  translate<0, 0, -30>

}
//進行方向
 //x軸正
object{
  Cube
  texture{T_Wood16}
  scale<0.3, 0.2, 100>
  translate<1, 0, 0>

}

//x軸負
object{
  Cube
  texture{T_Wood16}
  scale<0.3, 0.2, 100>
  translate<-1, 0, 0>

}
