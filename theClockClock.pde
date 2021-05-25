ClockClock clockClock;

DigitUnit[] digits = new DigitUnit[4];
static final int INTERVAL = 500;

JSONObject digitData;

int percentages = 0;

void setup() {
    size(730, 280);
    clockClock = new ClockClock(20,43);
    clockClock.run();
}

void draw() {
    smooth();
    clockClock.run();
}