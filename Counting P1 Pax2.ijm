dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,lengthOf(files[i]));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
					run("8-bit");
					//run("Brightness/Contrast...");
					setMinAndMax(-51, 204);
					run("Apply LUT");
					run("Smooth");
					waitForUser("ROI definition","Use the freehand tool to draw a ROI around the cerebellum");
					run("Duplicate...", " ");
					run("Measure");
					setAutoThreshold("Default");
					//run("Threshold...");
					call("ij.plugin.frame.ThresholdAdjuster.setMode", "Red");
					setAutoThreshold("Yen dark");
					setThreshold(100, 255);
					setThreshold(80, 255);
					//setThreshold(80, 255);
					setOption("BlackBackground", false);
					run("Convert to Mask");
					run("Analyze Particles...", "size=50-500 pixel circularity=0.50-1.00 show=[Overlay] display exclude summarize composite");
					run("Flatten");
					saveAs(dir + "detected_cells_" + shortname + ".tif");
							}	
}
selectWindow("Results");
saveAs("Results" + "Results.csv");
waitForUser("Allert!!","Save the SUMMARY table");
run("Close All");
