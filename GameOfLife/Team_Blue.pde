class Blue{
Movement m;
 Blue(float x, float y){
   m = new Wander(x, y);
m.swag = color(0,0,255);
}
  boolean isHungry = true;

  void update() {
    if (!isHungry)
      m.run();
    else if (p.size() >0) {

      m.seek(findTarget());
      m.update();
      m.borders();
      m.display();
    }else{
    m.run();
    }
  }

  PVector findTarget() {
    int index = 0;
    float oldD = 1000;
    for (int i =0; i<p.size(); i++) {
      if (m.position.dist(p.get(i).pos) < oldD && p.get(i).isDead == false) {
        oldD = m.position.dist(p.get(i).pos);
        index = i;
        if (m.position.dist(p.get(i).pos)< 20) {
          p.get(i).kill(); // This kills the plants
          blue+=1;
        }
      }
    }
    PVector t = p.get(index).pos.copy();
    return t;
  }

}
  
