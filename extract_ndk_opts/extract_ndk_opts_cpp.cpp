#include <iostream>

extern "C" int fuInClang (void);

int main()
{
    std::cout << "Hello C++ World! " << fuInClang () << std::endl;
    return 0;
}
