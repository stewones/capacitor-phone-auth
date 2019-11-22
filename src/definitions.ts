declare module "@capacitor/core" {
  interface PluginRegistry {
    FirebasePhoneAuth: FirebasePhoneAuthPlugin;
  }
}

export interface FirebasePhoneAuthPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
