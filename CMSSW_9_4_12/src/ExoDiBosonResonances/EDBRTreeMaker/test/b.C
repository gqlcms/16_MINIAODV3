void b(){
TFile *a=new TFile("a.root","RECREATE");
TTree *t=new TTree("hh","t");
string b="aaaaaa";
t->Branch("b",&b,"b/C");
a->cd();
t->Write();
}
