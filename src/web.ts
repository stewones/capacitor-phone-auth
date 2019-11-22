import { WebPlugin } from '@capacitor/core';
import { FirebasePhoneAuthPlugin } from './definitions';

export class FirebasePhoneAuthWeb extends WebPlugin implements FirebasePhoneAuthPlugin {
  constructor() {
    super({
      name: 'FirebasePhoneAuth',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const FirebasePhoneAuth = new FirebasePhoneAuthWeb();

export { FirebasePhoneAuth };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(FirebasePhoneAuth);
