#include <iostream>
#include "SharedOrStaticLib2Api.hpp"
#include "SharedOrStaticLib2.hpp"

// #include "SharedOrStaticLib3Api.hpp"

namespace Code::SharedOrStaticLib2
{

void SharedOrStaticLib2Api()
{
    std::cout << "Code::SharedOrStaticLib2::SharedOrStaticLib2Api\n";
    SharedOrStaticLib2();

    // SharedOrStaticLib3::SharedOrStaticLib3Api();
}

} // ~namespace Code::SharedOrStaticLib2
