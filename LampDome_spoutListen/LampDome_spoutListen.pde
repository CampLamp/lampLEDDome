// pixelpusher spout sketch.
// takes pixels from spout, puts 'em on the pixelpusher array.
// includes code from Spout - http://spout.zeal.co
// *** WINDOWS ONLY.  This sketch won't work on Mac or Linux. ***
// jas strong, 13th oct 2014.

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;

Spout client;
PImage img;

boolean ready_to_go = true;
int lastPosition;
int canvasW = 640;
int canvasH = 480;
TestObserver testObserver;

void setup() {
  size(canvasW, canvasH, P2D);
  img = createImage(width, height, ARGB);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  client = new Spout();
  client.initReceiver("", img);
}

void draw() {
  img = client.receiveTexture(img);
  image(img, 0, 0, width, height);
  scrape();
}

void mousePressed() {
  // SELECT A SPOUT SENDER HERE
  if (mouseButton == RIGHT) {
    // Bring up a dialog to select a sender from
    // the list of all senders running.
    JSpout.SenderDialog();
  }
}

// over-ride exit to release sharing
void exit() {
  // CLOSE THE SPOUT RECEIVER HERE
  client.closeReceiver();
  super.exit();
} 

void stop()
{
  client.closeReceiver();
  super.stop();
}