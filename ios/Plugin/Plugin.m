#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(FirebasePhoneAuth, "FirebasePhoneAuth",
           CAP_PLUGIN_METHOD(verify, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(signIn, CAPPluginReturnPromise);
)
