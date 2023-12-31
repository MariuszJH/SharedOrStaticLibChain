
#ifndef AUTO_GENERATED_SHARED_OR_STATIC_LIB3_EXPORTS_HPP
#define AUTO_GENERATED_SHARED_OR_STATIC_LIB3_EXPORTS_HPP

#ifdef TARGETSHAREDORSTATICLIB3_STATIC_DEFINE
#  define SHARED_OR_STATIC_LIB3_API
#  define TARGETSHAREDORSTATICLIB3_NO_EXPORT
#else
#  ifndef SHARED_OR_STATIC_LIB3_API
#    ifdef targetSharedOrStaticLib3_EXPORTS
        /* We are building this library */
#      define SHARED_OR_STATIC_LIB3_API __declspec(dllexport)
#    else
        /* We are using this library */
#      define SHARED_OR_STATIC_LIB3_API __declspec(dllimport)
#    endif
#  endif

#  ifndef TARGETSHAREDORSTATICLIB3_NO_EXPORT
#    define TARGETSHAREDORSTATICLIB3_NO_EXPORT 
#  endif
#endif

#ifndef TARGETSHAREDORSTATICLIB3_DEPRECATED
#  define TARGETSHAREDORSTATICLIB3_DEPRECATED __declspec(deprecated)
#endif

#ifndef TARGETSHAREDORSTATICLIB3_DEPRECATED_EXPORT
#  define TARGETSHAREDORSTATICLIB3_DEPRECATED_EXPORT SHARED_OR_STATIC_LIB3_API TARGETSHAREDORSTATICLIB3_DEPRECATED
#endif

#ifndef TARGETSHAREDORSTATICLIB3_DEPRECATED_NO_EXPORT
#  define TARGETSHAREDORSTATICLIB3_DEPRECATED_NO_EXPORT TARGETSHAREDORSTATICLIB3_NO_EXPORT TARGETSHAREDORSTATICLIB3_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef TARGETSHAREDORSTATICLIB3_NO_DEPRECATED
#    define TARGETSHAREDORSTATICLIB3_NO_DEPRECATED
#  endif
#endif

#endif /* AUTO_GENERATED_SHARED_OR_STATIC_LIB3_EXPORTS_HPP */
