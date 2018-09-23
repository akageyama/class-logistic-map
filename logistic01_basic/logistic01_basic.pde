// The logistic map chaos for students 
//     by Akira Kageyama, on 2018.09.23 

float a_min = 2.4;
float a_max = 4.0;

float a_init = 3.6;
float x_init = 0.1;

float a, x;

void setup() {
  size( 600, 400 );
    
  a = a_init;
  x = x_init;

}

float tate_coord_conv(float x) {
  return height - x*height;
}

void draw_yokosen() {
  stroke(200); 
  for (int j=1; j<10; j++) {
    float x = 0.1*j;
    line(0, tate_coord_conv(x), width, tate_coord_conv(x));
    text(nf(x,1,1), 10, tate_coord_conv(x));
  }
}

void draw_point_with_str(float a, float x) {
  
  float point_pos_yoko = width*(a-a_min)/(a_max-a_min);
  float point_pos_tate = tate_coord_conv(x); 
  
  fill( 0 );
  noStroke();
  ellipse( point_pos_yoko, point_pos_tate, 5, 5 );
  text(nf(x,1,3), point_pos_yoko+10, 
                  point_pos_tate);
  text("| a = " + nf(a,1,3), point_pos_yoko-5, 
                             tate_coord_conv(0.05));

}

void draw() {
  background( 255 );

  draw_yokosen();

  draw_point_with_str(a,x);
  
  if ( frameCount > 5 ) {    
    x = a * x * (1-x);
  }
  
  if ( frameCount < 20 ) {
    frameRate(1);
  }
  else {
    frameRate(10);    
  }

}
