import os
file=os.listdir("./")
filetmp=os.listdir("./")
wrong=[]
failed=[]
SUBMITFAILED=[]
for f in filetmp:
	if "crab_" not in f or ".sh" in f or "new" in f: file.remove(f);
	if "crab_M2000_R0-6_off" in f: file.remove(f);
print file
iff=0
for f in file:
	os.system("crab status "+f +"> tmp.log")
	lines=[]
	filelog=open("tmp.log")
	for line in filelog:
		lines.append(line);
	#for i in range(0,12):	print i,lines[i]
	#if "SUBMITFAILED" in lines[3]:wrong.append(f)
	print f
	if "100.0%" not in lines[10] or "finished" not in lines[10]:wrong.append(f)
	if "failed"  in lines[10] :failed.append(f)
        if "SUBMITFAILED" in lines[3]:SUBMITFAILED.append(f)
	#l=lines[8].split(" ")
	#print l
	#tag=l[21]
	tag=lines
	os.system("rm tmp.log")
	#print f,tag
	if tag=='': wrong.append(f)
	if tag=="idle":
		iff=iff+1
		print "\n\n",iff,f,l
		if "ST_tW" in f: continue;
		oldf=f[5:len(f)]
		oldfstr=f[5:12]+"_"+f[12:len(f)-4]
		print oldf,oldfstr
		'''
		newf="crab3_analysisnew"+oldfstr+".py"
		os.system("cp crab3_analysis"+oldfstr+".py "+newf)	
		os.system("sed -i '7s/%s/new%s/' %s"%(oldf,oldf,newf))
		os.system("sed -i '31s/%s/new%s/' %s"%(oldf,oldf,newf))
		os.system("sed -i '2s/WWW/idle/' %s"%(newf))
		os.system("crab submit -c "+newf)
		txt=open("status_idle.sh","a+")
		txt.write("crab status crab_new"+oldf)
                '''
print wrong
print "failed",failed
print "SUBMITFAILED",SUBMITFAILED

'''
for i in SUBMITFAILED:
        os.system("crab kill "+i);
        os.system("rm -r "+i);
        submitf=i.replace("crab_","");
        submitf=submitf.replace("_off","");
        submitf=submitf.replace("R","R_");
        print "crab submit -c crab3_analysis"+submitf+".py"
        os.system("crab submit -c crab3_analysis"+submitf+".py");
'''
