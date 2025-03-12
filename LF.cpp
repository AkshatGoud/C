#include <iostream>
#include <vector>
using namespace std;

void removeLF(char nt, vector<string> r) {
    string pre = r[0];  // Assume first rule has the prefix
    for (auto &x : r) while (x.find(pre) != 0) pre = pre.substr(0, pre.size() - 1);

    if (pre.empty()) return void(cout << nt << " -> " << r[0] << " | " << r[1] << "\n");

    cout << nt << " -> " << pre << nt << "'\n" << nt << "' -> ";
    for (auto &x : r) cout << x.substr(pre.size()) << " | "; cout << "ε\n";
}

int main() {
    char nt; int n; cout << "Non-terminal: "; cin >> nt;
    cout << "No. of rules: "; cin >> n; cin.ignore();

    vector<string> r(n); cout << "Rules:\n";
    for (auto &x : r) getline(cin, x);

    removeLF(nt, r);
}