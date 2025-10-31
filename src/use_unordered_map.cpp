#include <iostream>
#include <map>
#include <string>
#include <unordered_map>

int main()
{
#ifndef NO_UNORDERED_MAP
  std::unordered_map<std::string, int> ageMap;
#else
  std::map<std::string, int> ageMap;
#endif
  ageMap.insert({"Taro", 10});
  ageMap.insert({"Hanako", 12});
  ageMap.insert({"Jiro", 8});

  for (const auto& [name, age] : ageMap) {
    std::cout << name << " is " << age << " years old.\n";
  }
}