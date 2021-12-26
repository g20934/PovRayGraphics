//風船を持ったくまをブランコに乗せてみました。
#include "shapes.inc"
#include "colors.inc"
#include "komuro.inc"
#include "woods.inc"
#include "textures.inc"
#include "metals.inc"
#include "skies.inc"
#include "stones.inc"
#include "glass.inc"


camera {
  location <0,7,9>//10, 5, 10 879 588 79
  look_at <0,5,0>
  angle 90 //100
}

light_source { <20,30,20> color White }

#declare THETA = 2*3.14*clock/18;
#declare PHI = 30*sin(THETA);

//くまとブランコ
#declare BEARandSWING =
union{
  union{
    //くま
    union{
      //頭
      object{
        Sphere
        scale<1.4, 1.1, 1>
        texture{T_Wood12}
        translate <0, 2.8, 0>
      }

      //鼻
      object{
       Sphere
       texture {T_Wood23}
       scale<0.7, 0.5, 0.3>
       translate<0, 2.6, 0.8>

      }

      object{
        Sphere
        scale <0.3, 0.2, 0.2>
        translate<0, 2.7, 1.0>
      }

      //眼
      union{
        object{
          Sphere
          scale 0.2
          translate<0.6, 0, 0>
        }

        object{
          Sphere
          scale 0.2
          translate<-0.6, 0, 0>
        }translate<0, 2.9, 0.8>

      }


      //耳
      union{
        difference{
          object{
            Sphere
            texture{T_Wood12}
          }

          object{
            Sphere
            scale 0.7
            texture{T_Wood26}
            translate<0, 0, 1>
          }
          scale 0.6
          scale<1, 1, 0.7>
          translate<1, 0, 0>
        }

        difference{
          object{
            Sphere
            texture{T_Wood12}
          }

          object{
            Sphere
            scale 0.7
            texture{T_Wood26}
            translate<0, 0, 1>
          }
          scale 0.6
          scale<1, 1, 0.7>
          translate<-1, 0, 0>
        }translate<0, 3.5, 0>

      }

      //体
      object{
        Sphere
        scale<1.5, 2, 1.5>
        texture {T_Wood12}
      }

      //手
      union{
        object{
          Sphere
          scale<0.4, 1.3, 0.4>
          rotate <0, 0, 30>
          translate<1.4,0.4, 0>
          texture {T_Wood26}
        }

        object{
          Sphere
          scale<0.4, 1.3, 0.4>
          //rotate <0, 0, -120> //-30
          //translate<-1.4,1.5, 0>
          rotate <0, 0, -30>
          translate<-1.4,0.4, 0>
          texture {T_Wood26}
        }

      }

      //脚
      union{
        object{
          Sphere
          scale<0.3, 0.5, 1.0>
          translate<0.7, 0, 0>
          texture {T_Wood2}
        }

        object{
          Sphere
          scale<0.3, 0.5, 1.0>
          translate<-0.7, 0, 0>
          texture {T_Wood2}
        }
        translate<0, -1.6, 0.8>
      }

      //足
      union{
        object{
          Sphere
          scale<0.6, 1, 0.3>
          translate<0.7, 0, 0>
          texture {T_Wood26}
        }

        object{
          Sphere
          scale<0.6, 1, 0.3>
          translate<-0.7, 0, 0>
          texture {T_Wood26}//12
        }translate<0, -0.9, 1.6>
      }
      translate<0, 3.5, 0>
    }


    //ブランコ
    //x軸正の木
    union{
      union{
        object{
          cylinder{
            <0, 0, 0>, <0, 5, 0>, 0.3
          }
          rotate<-20, 0, 0>
          texture {Yellow_Pine}
          translate<0, 0, 2>
        }

        object{
          cylinder{
            <0, 0, 0>, <0, 5, 0>, 0.3
          }
          rotate<20, 0, 0>
          texture {Yellow_Pine}
          translate<0, 0, -2>
        }
        translate<3, 0, 0>

      }

      //x軸負の木
      union{
        object{
          cylinder{
            <0, 0, 0>, <0, 5, 0>, 0.3
          }
          rotate<-20, 0, 0>
          texture {Yellow_Pine}
          translate<0, 0, 2>
        }

        object{
          cylinder{
            <0, 0, 0>, <0, 5, 0>, 0.3
          }
          rotate<20, 0, 0>
          texture {Yellow_Pine}
          translate<0, 0, -2>
        }
        translate<-3, 0, 0>

      }

      //上の木
      object{
        cylinder{
          <0, 0, 0>, <0, 6, 0>, 0.2
        }
        rotate<0, 0, -90>
        texture {Yellow_Pine}
        translate<-3, 5, 0>
      }

      //銀の持ち手
      //x軸正
      #declare Kara1 = -6;
      #declare Made1 = 6;
      #declare T1 = Kara1;

      #while(T1 < Made1)
        #declare X1 = cos(T1*pi) / 6;
        #declare Z1 = sin(T1*pi) / 6;
        #declare Y1 = T1 / 3;
        object{
          Sphere
          texture {T_Silver_1A}
          scale 0.15
          translate<X1, Y1, Z1>
          translate < 2, 3, 0>
        }
        #declare T1 = T1 + 0.02;
      #end

      //x軸負
      #declare Kara2 = -6;
      #declare Made2 = 6;
      #declare T2 = Kara2;

      #while(T2 < Made2)
        #declare X2 = cos(T2*pi) / 6;
        #declare Z2 = sin(T2*pi) / 6;
        #declare Y2 = T2 / 3;
        object{
          Sphere
          texture {T_Silver_1A}
          scale 0.15
          translate<X2, Y2, Z2>
          translate <-2, 3, 0>
        }
        #declare T2 = T2 + 0.02;
      #end

      //くまさんが座る木の板
      object{
        Cube
        texture {Yellow_Pine}
        scale<2, 0.2, 1>
        translate<0, 1, 0>
      }

      scale<1.85, 2.2, 1>
    }
    scale 0.9
  }

  //風船
  object{
    Sphere
    texture {T_Dark_Green_Glass}
    scale<1, 1.1, 1>
    translate<-1.8, 8, 0>
  }

  #declare Kara = 2;
  #declare Made = 6;
  #declare T = Kara;

  #while(T < Made)
    #declare X = -sin(T*pi/8);
    #declare Y = T;
    object{
      Sphere
      pigment{color White}
      scale 0.05
      translate<X, Y, 0>
      translate < -1.2, 1.0, 0>
    }
    #declare T = T + 0.02;
  #end
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
