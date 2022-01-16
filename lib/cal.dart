class Cal {
  var length;
  var girth;
  var weight;
  var a;
  var b;
  var p;
  var pa,pb;


  Cal(double length,double girth){
    this.length = length/100;
    this.girth = girth/100;
  }

  void setCalWeight(){
    weight = (girth*girth*length*69.3);
    a = weight+(weight*0.03).round();
    b = weight-(weight*0.03).round();
    p = weight*112.50;
    pa = p+(0.03*p);
    pb = p-(0.03*p);
  }


}