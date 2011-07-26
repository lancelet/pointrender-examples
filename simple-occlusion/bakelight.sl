/** Bakes a point cloud. */
light bakelight (
  uniform string pointCloudFile = "";
  uniform string __category = "bakelight";
) {
  uniform color radColor = 1;
  bake3d(pointCloudFile, "", 
         Ps, normalize(Ns), 
         "_area", area(Ps),
         "_radiosity", radColor,
         "interpolate", 1);
}
