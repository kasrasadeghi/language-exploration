#include <iostream>
#include <string>
#include <unordered_map>
#include <sstream>
#include <vector>

using namespace std;

vector<string> split(const string& s) {
  string buf;
  stringstream ss{s};
  vector<string> result;
  while (ss >> buf) result.push_back(buf);
  return result;
}

int to_int(const string& s) {
  stringstream ss{s};
  int result;
  ss >> result;
  return result;
}

int main() {
  unordered_map<string, int> map;
  for (string line; getline(cin, line);) {
    auto parts = split(line);
    const string& key = parts[0];
    const int value = to_int(parts[2]);
    map[key] = value;
  }

  for (const auto& pair : map) {
    cout << pair.first << " : " << pair.second << endl;
  }
}
