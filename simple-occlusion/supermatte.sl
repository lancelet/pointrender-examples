/** A matte shader which doesn't flip N. */
surface supermatte (
  uniform float Ka = 1;
  uniform float Kd = 1;
) {
  normal Nn = normalize(N); /* <-- this is why it's "super" */
  
  /* normal matte shading */
  Oi = Os;
  Ci = Os * Cs * (Ka * ambient() + Kd * diffuse(Nn));
}
