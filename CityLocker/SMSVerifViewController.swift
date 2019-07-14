//
//  SMSVerifViewController.swift
//  CityLocker
//
//  Created by selim mouelhi on 7/4/19.
//  Copyright © 2019 selim mouelhi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SMSVerifViewController: UIViewController {
    
    @IBAction func verifyOtp(_ sender: Any) {
        
        guard  let otpnum = Otpnumb.text else {return}
        
        
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationId!,
            verificationCode: otpnum)
        Auth.auth().signInAndRetrieveData(with: credential) { (success, error) in
            if error == nil{
                print(success)
                self.performSegue(withIdentifier: "Home", sender: nil)
                
            }
            else{
                print("error verifying otp code ",error?.localizedDescription)
            }
        
    }
    }
        
    var verificationId:String?
    @IBOutlet weak var Otpnumb: UITextField!
    
    override func viewDidLoad() {
        print(verificationId)
        super.viewDidLoad()

    }
  
    
    //this is verify function
    
    
/*
     @IBAction func phoneAct(_ sender: Any) {
     guard  let otpnum = OTPnumb.text else {return}
     
     
     
     let credential = PhoneAuthProvider.provider().credential(
     withVerificationID: self.verifi!,
     verificationCode: otpnum)
     Auth.auth().signInAndRetrieveData(with: credential) { (success, error) in
     if error == nil{
     print(success)
     print("user signed in")
     
     }
     else{
     print("error verifying otp code ",error?.localizedDescription)
     }
     
     
     }
     
     }
     */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

