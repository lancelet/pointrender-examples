/** Bakes a point cloud. */
light bakelight (
  uniform string pointCloudFile = "";
  uniform string __category = "bakelight";
) {  
  bake3d(pointCloudFile, "", 
         Ps, normalize(Ns), "_area", area(Ps), "interpolate", 1);
}
