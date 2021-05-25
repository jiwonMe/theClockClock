class Clock {
    float h,m,s;
    float x;
    float y;
    float radius=110.0;
    ClockHand hourHand;
    ClockHand minuteHand;

    Clock(float hour_, float minute_, float second_, float posX, float posY, float radius_) {
        h=hour_;
        m=minute_;
        s=second_;
        
        x=posX;
        y=posY;

        radius = radius_;

        hourHand = new ClockHand(posX, posY, 30.0, radius);
        minuteHand = new ClockHand(posX, posY, 0.0, radius);
    }

    void realtime() {
        h=hour();
        m=minute();
        s=second();

        hourHand.update(((hour()%12)/12.0+minute()/720.0)*TWO_PI -PI/2);
        minuteHand.update((minute()/60.0 + second()/3600.0)*TWO_PI -PI/2);
    }

    void display() {
        fill(256);
        stroke(200);
        ellipse(x,y,2*radius,2*radius);
        fill(0);
        noStroke();
        ellipse(x,y,10,10);
        
        hourHand.display();
        minuteHand.display();
    }

    void set(float hour_, float minute_){
        h=hour_;
        m=minute_;
        hourHand.update(((hour_%12)/12.0)*TWO_PI -PI/2);
        minuteHand.update((minute_/60.0)*TWO_PI -PI/2);
    }

    void update(Clock prevState, Clock nextState, float percentages){
        float minute_ = prevState.m + (nextState.m - prevState.m)*percentages;
        float hour_ = prevState.h + (nextState.h - prevState.h)*percentages;
        hourHand.update(((hour_%12)/12.0)*TWO_PI -PI/2);
        minuteHand.update((minute_/60.0)*TWO_PI -PI/2);
    }
}