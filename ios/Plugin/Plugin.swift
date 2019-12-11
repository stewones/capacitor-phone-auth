import Foundation
import Capacitor
import FirebaseCore
import FirebaseAuth


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 *
 * Created by Stewan Silva on 11/22/19.
 */
@objc(FirebasePhoneAuth)
public class FirebasePhoneAuth: CAPPlugin {
  
  public override func load() {
    if (FirebaseApp.app() == nil) {
      FirebaseApp.configure();
    }
  }
  
  
  @objc func verify(_ call: CAPPluginCall) {
    let phoneNumber = call.getString("phone") ?? ""
    
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
      if let error = error {
        print(error.localizedDescription)
        call.error(error.localizedDescription)
        return
      }
      
      UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
      
      call.success()
    }
    
  }
  
  
  @objc func signIn(_ call: CAPPluginCall) {
    let verificationCode = call.getString("code") ?? ""
    let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") ?? "123456"
    let credential = PhoneAuthProvider.provider().credential(
      withVerificationID: verificationID,
      verificationCode: verificationCode)
    
    Auth.auth().signIn(with: credential) { (authResult, error) in
      if let error = error {
        // ...
        print(error)
        call.error("error while trying to sign in")
        return
      }
      
      call.success([
        "uid": authResult?.user.uid
//        "email": authResult?.user.email,
//        "displayName": authResult?.user.displayName,
//        "photoURL": authResult?.user.photoURL
      ])
      
    }
    
    
  }
  
}

