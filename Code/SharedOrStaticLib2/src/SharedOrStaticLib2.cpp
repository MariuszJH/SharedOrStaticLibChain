#include <iostream>
#include "SharedOrStaticLib2.hpp"
#include "SharedOrStaticLib3Api.hpp"

namespace Code::SharedOrStaticLib2
{

void SharedOrStaticLib2()
{
    std::cout << "Code::SharedOrStaticLib2::SharedOrStaticLib2\n";
    SharedOrStaticLib3::SharedOrStaticLib3Api();
}

} // ~namespace Code::SharedOrStaticLib2
