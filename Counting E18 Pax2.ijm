dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,lengthOf(files[i]));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
					run("8-bit");
					waitForUser("ROI definition","Use the freehand tool to draw a ROI around the cerebellum");
					run("Duplicate...", " ");
					run("Measure");
					//setAutoThreshold("Default");
					//run("Threshold...");
					//call("ij.plugin.frame.ThresholdAdjuster.setMode", "Red");
					setAutoThreshold("Yen dark");
					//setThreshold(80, 255);
					setOption("BlackBackground", false);
					run("Convert to Mask");
					run("Analyze Particles...", "size=20-200 pixel circularity=0.50-1.00 show=[Overlay] display exclude summarize composite");
					run("Flatten");
					saveAs(dir + "detected_cells_" + shortname + ".tif");
							}	

}

selectWindow("Results");
saveAs("Results" + "Results.csv");
run("Close All");
