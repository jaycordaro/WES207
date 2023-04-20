// Tests the serial connection with the Teensy board.
// Note that the teensy doesn't function as a serial
// device by default, you'll only be able to add it
// on the serial monitor after you load a program
// with Serial.begin()

void setup() {
  // this is the recommended serial rate for Teensy
  // others can cause the board to become unresponsive...
  Serial.begin(9600);
}

void loop() {
  Serial.println("Running...");
  delay(5000);
}

