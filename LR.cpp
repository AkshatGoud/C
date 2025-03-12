#include <iostream>
#include <vector>
using namespace std;

void removeLR(char nt, vector<string> r) {
    vector<string> α, β;
    for (auto &x : r) (x[0] == nt ? α : β).push_back(x.substr(x[0] == nt));

    if (α.empty()) return void(cout << nt << " -> " << r[0] << "\n");

    cout << nt << " -> "; for (auto &b : β) cout << b << nt << "' | "; cout << "\n";
    cout << nt << "' -> "; for (auto &a : α) cout << a << nt << "' | "; cout << "ε\n";
}

int main() {
    char nt; int n; cout << "Non-terminal: "; cin >> nt;
    cout << "No. of rules: "; cin >> n; cin.ignore();
    
    vector<string> r(n); cout << "Rules:\n";
    for (auto &x : r) getline(cin, x);

    removeLR(nt, r);
}