dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,lengthOf(files[i]));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
		            run("Set Scale...", "distance=0 known=0 unit=pixel");
					run("8-bit");
					waitForUser("ROI definition","Use the freehand tool to draw a ROI around the cerebellum");
					run("Duplicate...", " ");
					run("Auto Local Threshold", "method=Phansalkar radius=15 parameter_1=0 parameter_2=0 white");
					run("Analyze Particles...", "size=50-3000 pixel circularity=0.50-1.00 show=Masks display include summarize add");
					roiManager("Show All without labels");    
					saveAs(dir + "detected_cells_" + shortname + ".tif");
					close("*");
					
							}	
				

}

selectWindow("Results");
saveAs("Results" + "Results.csv");
run("Close All");

