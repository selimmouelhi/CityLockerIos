//
//  ViewController.swift
//  CityLocker
//
//  Created by selim mouelhi on 7/3/19.
//  Copyright © 2019 selim mouelhi. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import CountryPicker

class ViewController: UIViewController  {
    
    

    @IBOutlet weak var picker: CountryPicker!
    @IBOutlet weak var OTPnumb: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    var verifi:String?
    
    override func viewDidLoad() {
        
        
      super.viewDidLoad()
        
    }

  
    @IBAction func verify(_ sender: Any) {
        
        
       guard  let phonenumb = phoneNumber.text else {return}
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phonenumb, uiDelegate: nil) { (verificationId, error) in
            if  error ==  nil  {
                print(verificationId)
                guard let verifi = verificationId else {return}
                self.verifi = verificationId!
                self.performSegue(withIdentifier: "smsverification", sender: nil)
                    
                }
            else
            {print("no secret verification",error?.localizedDescription)}
        }
    }
    
    
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
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "smsverification") {
    
            if let  destination = segue.destination as? SMSVerifViewController{
                destination.verificationId = verifi
                
            }
            
        }    }

    }



