#include <iostream>
#include "SharedOrStaticLib1Api.hpp"
#include "SharedOrStaticLib1.hpp"

// #include "SharedOrStaticLib2Api.hpp"

namespace Code::SharedOrStaticLib1
{

void SharedOrStaticLib1Api()
{
    std::cout << "Code::SharedOrStaticLib1::SharedOrStaticLib1Api\n";
    SharedOrStaticLib1();

    // SharedOrStaticLib2::SharedOrStaticLib2Api();
}

} // ~namespace Code::SharedOrStaticLib1
