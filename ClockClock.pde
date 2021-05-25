class ClockClock {
    String time;
    int h=20;
    int m=34;

    ClockClock(int hour_, int minute_){
        h = hour_;
        m = minute_;

        for(int i=0; i<4; i++)
            digits[i]= new DigitUnit(0,180*i+50.0,50.0);
        digitData = loadJSONObject("digitData.json");
    }

    void run() {
        background(255);
        time = String.format("%02d",hour()) + String.format("%02d",minute());
        // println(time);
        for(int i=0; i<4; i++){
            digits[i].display();
            digits[i].update(time.charAt(i)-'0');
        }
    }
}