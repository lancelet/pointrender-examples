/** Provides ambient occlusion lighting from a point cloud file.
 *
 *  The shader responds to two attributes, which may be set in a RIB file:
 *    Attribute "user" "float maxsolidangle" [ 0.05 ]
 *  If "bake" is set to [ 1 ] then no ambient light will be generated.  The
 *  "maxsolidangle" parameter is a speed / quality tradeoff control for the
 *  light, which can be set on a per-surface basis.
 *
 *  @param pointCloudFile name of the point cloud file
 *  @param intensity intensity of the light source 
 *  @param lightcolor color of the light */
#ifndef PI
#define PI 3.14159265359
#endif
light occlight (
  uniform string pointCloudFile = "";
  float intensity = 1;
  color lightcolor = 1;
) {
  uniform float maxsolidangle = 0.04;
  attribute("user:maxsolidangle", maxsolidangle);
  
  /* compute ambient lighting if we're not baking */
  float aocc = 0;
  if (pointCloudFile != "") {
    aocc = 1 - occlusion(Ps, Ns, 0, "filename", pointCloudFile,
                         "maxsolidangle", maxsolidangle,
                         "microbufres", 8,
                         "pointbased", 1);
  }
  
  Cl = intensity * aocc * lightcolor;
}
