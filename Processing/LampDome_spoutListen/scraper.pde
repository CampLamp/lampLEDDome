import java.util.List;

void scrape() {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();
    
    // yscale = how many pixels of y == one led strip.
    // xscale = how many pixels of x == one led pixel.
    float xscale = float(width) / float(strips.get(0).getLength());
    float yscale = float(height) / float(strips.size());
    
    // for each strip (y-direction)
    int stripy = 0;
    for (Strip strip : strips) {
      for (int stripx = 0; stripx < strip.getLength(); stripx++) {
        color c = get(int(float(stripx)*xscale),int(float(stripy)*yscale));
        strip.setPixel(c, stripx);
      }
      stripy++;
    }
  }
}