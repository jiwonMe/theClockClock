class ClockHand {
    float x, y, l;
    float angle;
    ClockHand(float posX, float posY, float deg, float length) {
        x=posX;
        y=posY;
        angle=deg;
        l=length;
    }

    void update(float speed){
        angle+=speed;
    }

    void display() {
        strokeWeight(10);
        stroke(0);
        pushMatrix();
        translate(x, y);
        // angle += speed;
        rotate(angle);
        strokeCap(SQUARE);
        line(0, 0, l, 0);
        popMatrix();
        strokeWeight(1);
    }
}