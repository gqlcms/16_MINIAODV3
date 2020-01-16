from ROOT import TTree,TFile
a="Triboson_M3000_R0.12"
print len(a)
for i in range(1,len(a)): print i-1,a[i-1],a[i-1]>='0' and a[i-1]<='9'
'''
f=TFile("a.root","RECREATE")
t=TTree("hh","t")
t.Branch("a",a,"a/S");
f.cd();
t.Write();
import os
for i in range(1,30):
	print "'file:/eos/cms/store/group/dpg_trigger/comm_trigger/TriggerStudiesGroup/STEAM/xulyu/WWW/multi_sim_new/crab_multi_MAOD/190514_101036/0000/B2G-RunIISummer16MiniAODv2-02551_%s.root'"%(i)
'''
