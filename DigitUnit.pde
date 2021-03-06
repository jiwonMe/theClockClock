class DigitUnit {
    //width: 180
    float x;
    float y;
    int digit=0;
    Clock[][] clocks = new Clock[3][2];

    DigitUnit(int digit_, float posX, float posY){
        digit=digit_;
        x = posX;
        y = posY;

        for(int i=0; i<3; i++ ){
            for(int j=0; j<2; j++) {
                clocks[i][j] = new Clock(hour(),minute(),second(),posX+j*90, posY+i*90, 40);
            }
        }
    }

    void display() {
        for(int i=0; i<3; i++)
            for(int j=0; j<2; j++)
                clocks[i][j].display();
    }

    //@change
    void update(int n, float percentages){
        JSONArray values = digitData.getJSONArray("digits");
        int k=0;
        for(int i=0; i<3; i++){
            for(int j=0; j<2; j++){
                String control = values.getJSONObject(n).getJSONArray("clocks").getString(k);
                float h = digitData.getJSONObject("controls").getJSONObject(control).getFloat("hours");
                float m = digitData.getJSONObject("controls").getJSONObject(control).getFloat("minutes");
                clocks[i][j].update(clocks[i][j], new Clock(h,m,0,0,0,0), percentages);

                if(percentages>=1) clocks[i][j].set(h,m);
                k++;
            }
        }
        
    }

}