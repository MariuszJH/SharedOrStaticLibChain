#include <iostream>
#include "SharedOrStaticLib1.hpp"
#include "SharedOrStaticLib2Api.hpp"

namespace Code::SharedOrStaticLib1
{

void SharedOrStaticLib1()
{
    std::cout << "Code::SharedOrStaticLib1::SharedOrStaticLib1\n";
    SharedOrStaticLib2::SharedOrStaticLib2Api();
}

} // ~namespace Code::SharedOrStaticLib1
