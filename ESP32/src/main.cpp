#include <Arduino.h>

#define LED_PIN 2


//// --- OPTION 1:
const int delayTime = 300;
const String uartMessage = "Version 1: LED blinks every 300ms";

//// --- OPTION 2:
// const int delayTime = 1000;
// const String uartMessage = "Version 2: LED blinks every 1000ms";


void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  Serial.println("Starting ESP32...");
}

void loop() {
  digitalWrite(LED_PIN, HIGH);
  Serial.println(uartMessage);
  delay(delayTime);
  
  digitalWrite(LED_PIN, LOW);
  delay(delayTime);
}