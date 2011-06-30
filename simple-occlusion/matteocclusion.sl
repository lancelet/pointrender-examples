surface matteocclusion (
  uniform float Ka = 1;
  uniform float Kd = 1;
  uniform string ptCloudName = "";
  uniform float baking = 0;
  uniform float maxsolidangle = 0.05;
) {
  point Nn = normalize(N);
  
  /* compute ambient lighting if we're not baking */
  float aocc = 0;
  if (ptCloudName != "" && baking == 0) {
    aocc = 1 - occlusion(P, Nn, 0, "filename", ptCloudName, "maxsolidangle", maxsolidangle);
  }

  /* perform baking if baking flag is set */
  if (ptCloudName != "" && baking == 1) {
    bake3d(ptCloudName, "", P, Nn, "_area", area(P), "_radiosity", color(1), "interpolate", 1);
  }
  
  /* normal matte shading */
  Oi = Os;
  Ci = Os * Cs * (Ka * (ambient() + aocc) + Kd * diffuse(Nn));
}
