// The logistic map chaos for students 
//     by Akira Kageyama, on 2018.09.23
 
float a_min = 2.4;
float a_max = 4.0;


final int N = 100; // for x
final int M = 200; // for a

float[][] x = new float[M][N];
float[] a = new float[M];

void setup() {
  size( 600, 400 );

  for (int i=0; i<M; i++) {
    a[i] = a_min + ((a_max-a_min) / M ) * i;
    for (int j=0; j<N; j++) {
      x[i][j] = 1.0 / (N+1) * (j+1);
    }
  }
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

void draw_points(float[] a, float[][] x) {

  fill( 0 );
  noStroke();

  for (int i=0; i<M; i++) {
    float a_ = a[i];
    float point_pos_yoko = width*(a_-a_min)/(a_max-a_min);
    for (int j=0; j<N; j++) {
      float x_ = x[i][j];
      float point_pos_tate = tate_coord_conv(x_); 
      ellipse( point_pos_yoko, point_pos_tate, 2, 2 );
    }
  }                    
}

void draw() {
  background( 255 );

  draw_yokosen();

  draw_points(a,x);
  

  if ( frameCount > 5 ) {    
    for (int i=0; i<M; i++) {
      for (int j=0; j<N; j++) {
        x[i][j] = a[i] * x[i][j] * (1-x[i][j]);
      }
    }
  }

  
  if ( frameCount < 20 ) {
    frameRate(1);
  }
  else {
    frameRate(10);    
  }


}
