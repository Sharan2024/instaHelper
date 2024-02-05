#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "Cleaner" asset catalog image resource.
static NSString * const ACImageNameCleaner AC_SWIFT_PRIVATE = @"Cleaner";

/// The "Cook" asset catalog image resource.
static NSString * const ACImageNameCook AC_SWIFT_PRIVATE = @"Cook";

/// The "Driver" asset catalog image resource.
static NSString * const ACImageNameDriver AC_SWIFT_PRIVATE = @"Driver";

/// The "rajni" asset catalog image resource.
static NSString * const ACImageNameRajni AC_SWIFT_PRIVATE = @"rajni";

/// The "rajni1" asset catalog image resource.
static NSString * const ACImageNameRajni1 AC_SWIFT_PRIVATE = @"rajni1";

/// The "shabham" asset catalog image resource.
static NSString * const ACImageNameShabham AC_SWIFT_PRIVATE = @"shabham";

#undef AC_SWIFT_PRIVATE