#include <fstream>
#include <new>
#include <stdlib.h>

template class std::basic_ofstream<char>;

extern "C" {
    void _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev(void* obj) {
        new (obj) std::basic_filebuf<char, std::char_traits<char>>();
    }

    void* _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj(void* obj, const char* s, unsigned int mode) {
        return reinterpret_cast<std::basic_filebuf<char, std::char_traits<char>>*>(obj)->open(s, static_cast<std::ios_base::openmode>(mode));
    }

    void _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev(void* obj) {
        reinterpret_cast<std::basic_filebuf<char, std::char_traits<char>>*>(obj)->~basic_filebuf();
    }

    void _ZNSt3__122__libcpp_verbose_abortEPKcz(const char* format, ...) {
        abort();
    }
}
