const int analogPin = A13; // A13 analog input on Teensy 4.1 is connected to pin A13

void setup() {
  pinMode(analogPin, INPUT); // Set analog pin as input
  Serial.begin(9600); // Initialize serial communication
}

void loop() {
  // Read value of analog pin
  int analogValue = analogRead(analogPin);

  // Print analog value to serial console
  Serial.print("Analog value: ");
  Serial.println(analogValue);

  delay(100); // Add a small delay before taking another reading
}