# Sauna Temperature Monitor

A simple sauna temperature monitor, created in Qt/QML.

Inside the demo app, there is a function to demonstrate accessing Raspberry Pi GPIO through Qt using libgpiod library. The idea is, during the HEATING state, an LED is set to active. To see this in action, you need:

- A breadboard
- An LED
- 220 Ohm Resistor
- A few jumper cables (at least 2 male-to-female jumper cables to connect Raspberry Pi to the external board)

By default, you have to connect two jumper cables from the Raspberry Pi to the breadboard, one connected to pin 8 (GPIO 14) and the other connected to pin 6 (GND). Arrange the LED in serial connection with the 220 Ohm resistor. For information on the Raspberry Pi GPIO pinout, check out https://pinout.xyz/
