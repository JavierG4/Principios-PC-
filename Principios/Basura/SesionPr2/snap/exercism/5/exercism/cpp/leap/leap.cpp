#include "leap.h"

namespace leap {
    bool is_leap_year(const int year) {   
    if ((year % 4 == 0) and (year % 100 != 0 ) or (year % 400 == 0)) {
        return true;
    }
    else {
        return false;
    }
 }
}  // namespace leap
