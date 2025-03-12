#include <iostream>
#include <vector>
using namespace std;

void removeLR(char nt, vector<string> r) {
    vector<string> m, n;
    for(auto&x :r)(x[0]==nt ? m : n).push_back(x.substr(x[0]==nt));
    if(m.empty()) return void(cout<<"-->"<<r[0]<<"\n");

    cout << nt << "-->";for(auto &b : n)cout<<b<<nt<<"' | "; cout<<"\n";
    cout << nt << "'-->";for(auto &a : m)cout<<a<<nt<<"' | ";cout<<"E\n";
}
int main(){
    char nt; int n;
    cout<<"Non-terminal:";cin >> nt;
    cout<<"Number of rules;";cin >>n;

    vector<string> r(n);
    cout<<"Rules:\n";
    for(auto&x:r) getline(cin,x);
    removeLR(nt,r);
}