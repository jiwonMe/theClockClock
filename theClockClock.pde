ClockClock clockClock;

DigitUnit[] digits = new DigitUnit[4];
static final int INTERVAL = 3;

JSONObject digitData;

int percentages = 0;

void setup() {
    size(730, 280);
    clockClock = new ClockClock(hour(),minute());
    clockClock.run();
}

void draw() {
    smooth();
    clockClock.run();
}