class Clock {
    float h,m,s;
    float x;
    float y;
    float radius=110.0;
    ClockHand hourHand;
    ClockHand minuteHand;
    boolean power=false;
    float speed_h=0.0;
    float speed_m=0.0;

    Clock(float hour_, float minute_, float second_, float posX, float posY, float radius_) {
        h=hour_;
        m=minute_;
        s=second_;
        
        x=posX;
        y=posY;

        radius = radius_;

        hourHand = new ClockHand(posX, posY, hour_/12*TWO_PI-PI/2, radius);
        minuteHand = new ClockHand(posX, posY, minute_/60*TWO_PI-PI/2, radius);
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

    void powerSwitch(String state){
        if(state.equals("ON")) power=true;
        if(state.equals("OFF")) power=false;
        println(state);
    }

    int compare(float a, float b){
        float EPSILON = 0.005;
        
        if(abs(a-b)<EPSILON) return 0;
        println("abs(a-b): "+abs(a-b));
        return 1;
    }

    void update(float hour_, float minute_){
        if(!power && (compare((hour_%12)/12,(h%12)/12)==0 && compare((minute_%60)/60,(m%60)/60)==0)) return;

        if(compare((hour_%12)/12,(h%12)/12)==0 && compare((minute_%60)/60,(m%60)/60)==0){
            speed_h=0;
            speed_m=0;
            powerSwitch("OFF");
            return;
        }


        
        if(!power){
            speed_h = (hour_ - h +12)/INTERVAL;
            speed_m = (minute_ - m +120)/INTERVAL;
            powerSwitch("ON");
            return;
        }

        if(power) {
            hourHand.update(speed_h/12*TWO_PI);
            minuteHand.update(speed_m/60*TWO_PI);

            h = (h+speed_h)%12;
            m = (m+speed_m)%60;
        }
        // println("h-hour_: "+(h-hour_));
    }
}