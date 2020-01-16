SUBMITFAILED=['crab_singleMuon-16G-v1_new_new', 'crab_singleMuon-16D-v1_new_new', 'crab_singleMuon-16F-v1_new_new', 'crab_singleMuon-16H-v2_new_new', 'crab_singleElectron-16B-v1_new_new', 'crab_singleElectron-16C-v1_new_new', 'crab_singleElectron-16E-v1_new_new', 'crab_singleElectron-16F-v1_new_new', 'crab_singleElectron-16H-v1_new_new', 'crab_singleElectron-16H-v2_new_new', 'crab_MET-16B-v1_new_new', 'crab_MET-16C-v1_new_new', 'crab_MET-16E-v1_new_new', 'crab_MET-16G-v1_new_new', 'crab_MET-16H-v2_new_new']
for i in SUBMITFAILED:
        proc="";part="";ver=""
        if "MET" in i:proc="met";
        if "Electron" in i:proc="el";
        if i[len(i)-12:len(i)-11] !="B":part="_%s"%(i[len(i)-12:len(i)-11])     
        if "H_2" in i:ver="_2";
        print "crab submit -c crab3_analysisdata%s_v2%s%s.py"%(proc,part,ver)

