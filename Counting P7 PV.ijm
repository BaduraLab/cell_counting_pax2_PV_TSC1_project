dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,lengthOf(files[i]));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
		            run("Set Scale...", "distance=0 known=0 unit=pixel");
		            run("Set Measurements...", "area display nan redirect=None decimal=3");		
					waitForUser("ROI definition","Use the freehand tool to draw a ROI around the cerebellum");
					run("Measure");	
					run("8-bit");
                    run("Threshold...");
		            setAutoThreshold("Moments");
		            setThreshold(10, 255);
                    run("Convert to Mask");  
                    run("Invert");
                    run("Set Measurements...", "area limit display nan redirect=None decimal=3");               
                    waitForUser("ROI definition","Use the freehand tool to draw a ROI around PV positive cells - exclude PC layer");
                    //run("Duplicate...", " ");
                    run("Measure");
                    
					saveAs(dir + "detected_PVarea_" + shortname + ".tif");
					close("*");
					
							}	
				

}
selectWindow("Results");
saveAs("Results" + "Results.csv");
run("Close All");


