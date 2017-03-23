boolean start=false;
char sale_pepe;
int sp;
char rgb = 'f';
PImage img;
int mediano;
PImage reset;
PImage Y;
PImage U;
PImage V;
PImage YUV;
PImage R;
PImage G;
PImage B;
PImage fai_iconi;
PGraphics fai_icong;
String fai_filename;
boolean disimage = false;
void setup()
{
  size(800,600);
  background(255);
  frameAndIcon("", "data/icon.png");
}

void draw()
{
 if(disimage){
  risoluzione();
  imageMode(CENTER);
  fill(255);
  if(rgb=='r')
  {
  background(255);
  image(R, 400, 250);
  }
  if(rgb=='g')
  {
  background(255);
  image(G, 400, 250);
  }
  if(rgb=='b')
  {
  background(255);
  image(B, 400, 250);
  }
  if(rgb=='f')
  {
  background(255);
  image(img, 400, 250);
  }if(rgb=='y')
  {
  background(255);
  image(Y, 400, 250);
  }
  if(rgb=='u')
  {
  background(255);
  image(U, 400, 250);
  }
  if(rgb=='v')
  {
  background(255);
  image(V, 400, 250);
  }
  if(rgb=='m')
  {
  background(255);
  image(YUV, 400, 250);
  }
  }
  interfaccia();
}

void frameAndIcon(String frameText, String iconFilename) {
  if ( fai_filename == null || !fai_filename.equals(iconFilename) ) {
    fai_iconi = loadImage(iconFilename);
    fai_icong = createGraphics(16, 16, JAVA2D);
    fai_filename = iconFilename;
  }
  frame.setTitle( frameText );
  fai_icong.beginDraw();
  fai_icong.image( fai_iconi, 0, 0 );
  fai_icong.endDraw();
  frame.setIconImage(fai_icong.image);
}

void mousePressed()
{
  if(mouseX > 200 && mouseX < 300 && mouseY > 500 && mouseY < 600)
  {
    carica();
  }
  if(start)
  {
    if(mouseX >700 && mouseX <800 && mouseY >0 && mouseY < 100)
  {
    mediano=3;
    FilterMediano();
  }
  if(mouseX >700 && mouseX <800 && mouseY >101 && mouseY < 200)
  {
    mediano=5;
    FilterMediano();
  }
  if(mouseX >700 && mouseX <770 && mouseY >201 && mouseY < 370)
  {
    initializeYUV();
    updateYUV();
    rgb='y';
  }
  if(mouseX >700 && mouseX <770 && mouseY >371 && mouseY < 440)
  {
    initializeYUV();
    updateYUV();
    rgb='u';
  }
  if(mouseX >700 && mouseX <770 && mouseY >441 && mouseY < 510)
  {
    initializeYUV();
    updateYUV();
    rgb='v';
  }
  if(mouseX >700 && mouseX <770 && mouseY >511 && mouseY < 580)
  {
    initializeYUV();
    updateYUV();
    rgb='m';
  }
  if(mouseX >700 && mouseX <800 && mouseY >201 && mouseY < 300)
  {
    mediano=7;
    FilterMediano();
  }
  if(mouseX >350 && mouseX < 450 && mouseY > 500 && mouseY < 600)
  {
    reset();
  }
  if(mouseX >500 && mouseX < 600 && mouseY > 500 && mouseY < 600)
  {
    salva();
  }
  
 if(mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100)
  {
    InitializeRGB();
      updateChannel();
  rgb = 'r';
  }
  else if(mouseX > 0 && mouseX < 101 && mouseY > 101 && mouseY < 200)
  {
      InitializeRGB();
      updateChannel();
  rgb = 'g';
  }
  else if(mouseX > 0 && mouseX < 201 && mouseY > 201 && mouseY < 300)
  {
     InitializeRGB();
      updateChannel();
  rgb = 'b';
  }
  else if(mouseX > 0 && mouseX < 100 && mouseY > 301 && mouseY < 400)
  {
      InitializeRGB();
      updateChannel();
    rgb='f';
    int pixel= int(img.width*img.height);
    R.loadPixels();
    G.loadPixels();
    B.loadPixels();
    img.loadPixels();
  for (int i = 0; i < pixel; i++) {
    img.pixels[i] = color(red(R.pixels[i]), green(G.pixels[i]), blue(B.pixels[i]));
    img.updatePixels();
  }
  }
    else if(mouseX > 0 && mouseX < 100 && mouseY > 401 && mouseY < 500)
  {
    InitializeRGB();
    initializeYUV();
    sale_pepe='s';
    sale_e_pepe();
    updateChannel();
    updateYUV();
  }
  else if(mouseX > 0 && mouseX < 100 && mouseY > 501 && mouseY < 600)
  {
    InitializeRGB();
    initializeYUV();
    sale_pepe='p';
    sale_e_pepe();
    updateChannel();
    updateYUV();
  }
  }
}
  public void carica()
    { 
      if(disimage)
      {
      reset();
      }
      selectInput("Select a file to process:", "fileSelected");
    }
    
void fileSelected(File selection) {
  if (selection == null) println("Nessuna immagine caricata");
  else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    reset = loadImage(selection.getAbsolutePath());
    rgb='f';
    start=true;
    disimage=true;
    background(255);
  }
}

public void risoluzione()
{
  int rapporto;
  if(img.width>img.height)
  {
  rapporto = img.height/img.width;
  img.resize(600, 600*rapporto);
  }
  else if(img.height>img.width){
  rapporto = img.width/img.height;
  img.resize(500*rapporto,500);
}
}

public void sale_e_pepe(){
  if (sale_pepe=='s')
  {
  int pixel= int(img.width*img.height);
    img.loadPixels();
  for (int i = 0; i < pixel; i++) {
    sp = int(random(1,100));
    if(sp==1 || sp==2 || sp==3)
    {
    img.pixels[i]= color(255, 255, 255);
    }
  }
  img.updatePixels();
  }
 else if (sale_pepe=='p')
  {
  int pixel= int(img.width*img.height);
    img.loadPixels();
  for (int i = 0; i < pixel; i++) {
    sp = int(random(1,100));
    if(sp==1 || sp==2 || sp==3)
    {
    img.pixels[i]= color(0, 0, 0);
    }
  }
  }
}


public void salva()
{
  selectOutput("Select a file to write to:", "salvafs");
}

void salvafs(File selection) {
  if (selection == null) println("Nessuna immagine caricata");
  else {
    println("User selected " + selection.getAbsolutePath());
    if(rgb=='r')
    {
    R.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='g')
    {
    G.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='b')
    {
    B.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='f')
    {
    img.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='y')
    {
    Y.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='u')
    {
    U.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='v')
    {
    V.save(savePath(selection.getAbsolutePath()));
    }
    if(rgb=='m')
    {
    YUV.save(savePath(selection.getAbsolutePath()));
    }
  }
}
public void updateChannel()
    {
      int pixel= int(img.width*img.height);
    R.loadPixels();
    G.loadPixels();
    B.loadPixels();
  for (int i = 0; i < pixel; i++) {
    R.pixels[i] = color(red(img.pixels[i]));
    G.pixels[i] = color(green(img.pixels[i]));
    B.pixels[i] = color(blue(img.pixels[i]));
  }
  R.updatePixels();
  G.updatePixels();
  B.updatePixels();
    }
    
public void InitializeRGB()
{
  if(R==null && G==null && B==null)
  {
    R=img.copy();
    G=img.copy();
    B=img.copy();
  }
}

public void interfaccia(){
  noStroke();
  fill(180, 224, 225);
  rect(0,0,100,600);
  rect(700,0,100,600);
  rect(100,500,600,100);
  imageMode(CORNER);
  PImage open;
  open = loadImage("data/apri.png");
  image(open, 200, 500, 100, 100);
  if(start)
  {
  PImage red;
  red = loadImage("data/r.png");
  image(red, 0, 0, 100, 100);
  PImage green;
  green = loadImage("data/g.png");
  image(green, 0, 100, 100, 100);
  PImage blue;
  blue = loadImage("data/b.png");
  image(blue, 0, 200, 100, 100);
  PImage RGBvar;
  RGBvar = loadImage("data/rgb.png");
  image(RGBvar, 0, 300, 100, 100);
  PImage salevar;
  salevar = loadImage("data/sale.png");
  image(salevar, 0, 400, 100, 100);
  PImage pepevar;
  pepevar = loadImage("data/pepe.png");
  image(pepevar, 0, 500, 100, 100);
  PImage resetI;
  resetI = loadImage("data/reset.png");
  image(resetI, 350, 500, 100, 100);
  PImage savevar;
  savevar = loadImage("data/save.png");
  image(savevar, 500, 500, 100, 100);
  PImage med3;
  med3 = loadImage("data/3x.png");
  image(med3, 700, 0, 100, 100);
  PImage med5;
  med5 = loadImage("data/5x.png");
  image(med5, 700, 100, 100, 100);
  PImage med7;
  med7 = loadImage("data/7x.png");
  image(med7, 700, 200, 100, 100);
  PImage Yb;
  Yb = loadImage("data/y.png");
  image(Yb, 700, 300, 70, 70);
  PImage Ub;
  Ub = loadImage("data/u.png");
  image(Ub, 700, 370, 70, 70);
  PImage Vb;
  Vb = loadImage("data/v.png");
  image(Vb, 700, 440, 70, 70);
  PImage YUVb;
  YUVb = loadImage("data/yuv.png");
  image(YUVb, 700, 510, 70, 70);
  }
  else
  {
  PImage red;
  red = loadImage("data/shut.png");
  image(red, 0, 0, 100, 100);
  PImage green;
  green = loadImage("data/shut.png");
  image(green, 0, 100, 100, 100);
  PImage blue;
  blue = loadImage("data/shut.png");
  image(blue, 0, 200, 100, 100);
  PImage RGBvar;
  RGBvar = loadImage("data/shut.png");
  image(RGBvar, 0, 300, 100, 100);
  PImage salevar;
  salevar = loadImage("data/shut.png");
  image(salevar, 0, 400, 100, 100);
  PImage pepevar;
  pepevar = loadImage("data/shut.png");
  image(pepevar, 0, 500, 100, 100);
  PImage resetI;
  resetI = loadImage("data/shut.png");
  image(resetI, 350, 500, 100, 100);
  PImage savevar;
  savevar = loadImage("data/shut.png");
  image(savevar, 500, 500, 100, 100);
  PImage med3;
  med3 = loadImage("data/shut.png");
  image(med3, 700, 0, 100, 100);
  PImage med5;
  med5 = loadImage("data/shut.png");
  image(med5, 700, 100, 100, 100);
  PImage med7;
  med7 = loadImage("data/shut.png");
  image(med7, 700, 200, 100, 100);
  PImage Yb;
  Yb = loadImage("data/shut.png");
  image(Yb, 700, 300, 70, 70);
  PImage Ub;
  Ub = loadImage("data/shut.png");
  image(Ub, 700, 370, 70, 70);
  PImage Vb;
  Vb = loadImage("data/shut.png");
  image(Vb, 700, 440, 70, 70);
  PImage YUVb;
  YUVb = loadImage("data/shut.png");
  image(YUVb, 700, 510, 70, 70);
  }
}

public void FilterMediano()
{
  PImage temp;
  float[] arraymedr;
  float[] arraymedg;
  float[] arraymedb;
  
  img.loadPixels();
  int var= mediano/2;
  float medianoValorer;
    float medianoValoreg;
      float medianoValoreb;
  
  for (int i=0; i<img.width; i++)
  {
    for(int j=0; j<img.height; j++)
    {
       temp=img.get( max(i-var,0) , max(j-var,0) , min(mediano,img.width-i) , min(mediano,img.height-j) );
       
       temp.loadPixels();
       
       int size=temp.pixels.length;
       arraymedr=new float[size];
       arraymedg=new float[size];
       arraymedb=new float[size];
       
       for(int k=0; k<size;k++)
       {
         arraymedr[k]=red(temp.pixels[k]);
         arraymedg[k]=green(temp.pixels[k]);
         arraymedb[k]=blue(temp.pixels[k]);
       }
       
       arraymedr=sort(arraymedr);
       arraymedg=sort(arraymedg);
       arraymedb=sort(arraymedb);
       if (size%2 ==1)
       {
         medianoValorer=arraymedr[size/2];
         medianoValoreg=arraymedg[size/2];
         medianoValoreb=arraymedb[size/2];
       }
       else
       {
         medianoValorer=(arraymedr[size/2-1] + arraymedr[size/2])/2;
         medianoValoreg=(arraymedg[size/2-1] + arraymedg[size/2])/2;
         medianoValoreb=(arraymedb[size/2-1] + arraymedb[size/2])/2;
       }
       
       img.set(i,j,color(medianoValorer,medianoValoreg,medianoValoreb));
       
    }
  }
}

public void updateYUV()
{
 int pixel= img.width*img.height;
 img.loadPixels();
    Y.loadPixels();
    U.loadPixels();
    V.loadPixels();
    YUV.loadPixels();
  for (int i = 0; i < pixel; i++) {
    float r,g,b,y,u,v;
    r=red(img.pixels[i]);
    g=green(img.pixels[i]);
    b=blue(img.pixels[i]);
    y=0.3*r+0.6*g+0.1*b;
    u=b-y+128;
    v=r-y+128;
   Y.pixels[i]=color(y);
   U.pixels[i]=color(u);
   V.pixels[i]=color(v);
   YUV.pixels[i]=color(y,u,v);
  }
  Y.updatePixels();
    U.updatePixels();
    V.updatePixels();
    YUV.updatePixels();
}

public void initializeYUV()
{
  if(Y==null && U==null && V==null && YUV==null)
  {
    Y=img.copy();
    U=img.copy();
    V=img.copy();
    YUV=img.copy();
  }
}

public void reset()
{
  img=reset.copy();
  rgb='f';
  R=null;
  G=null;
  B=null;
  Y=null;
  U=null;
  V=null;
  YUV=null;
}
