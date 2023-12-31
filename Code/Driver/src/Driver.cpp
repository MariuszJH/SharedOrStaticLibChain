#include <iostream>
#include "Driver.hpp"
#include "SharedOrStaticLib1Api.hpp"

namespace Code::Driver
{

void Driver()
{
    std::cout << "Code::Driver::Driver\n";
    SharedOrStaticLib1::SharedOrStaticLib1Api();
}

} // ~namespace Code::Driver
