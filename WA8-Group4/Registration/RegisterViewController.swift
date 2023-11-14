//
//  RegisterViewController.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class RegisterViewController: UIViewController {

    let registerView = RegisterView()
    
    
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messaging App"
        navigationItem.hidesBackButton = true
        let loginPage = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(onLoginPage))
        registerView.btnCreateProfile.addTarget(self, action: #selector(triggerRegistration), for: .touchUpInside)
        navigationItem.rightBarButtonItem = loginPage
    }
    
    @objc func triggerRegistration() {
        if let email = registerView.email.text{
            if isValidEmail(email) {
                registerNewAccount()
            } else {
                let alert = UIAlertController(title: "Registration Alert", message: "Please enter a valid email!", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true)
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        print(email)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func onLoginPage() {
        let loginController = ViewController()
        navigationController?.popViewController(animated: true)
    }

    
    func registerNewAccount(){

        if let name = registerView.name.text,
           let email = registerView.email.text,
           let password = registerView.password.text{
            //Validations....
            
            if password.count < 6 {
                let alert = UIAlertController(title: "Registration Alert", message: "Password must be greater then 6 characters", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil))
                
                self.present(alert, animated:true)
            }
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    
                    let alert = UIAlertController(title: "Registration Alert", message: "Successfully Registered", preferredStyle: UIAlertController.Style.alert)

                    self.database.collection("users").document(email).setData([
                      "name": name,
                      "email": email,
                    ]) { err in
                      if let err = err {
                        print("Error writing document: \(err)")
                      } else {
                        print("Document successfully written!")
                      }
                    }
                        // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                        
                        let messengerController = MessengerViewController()
                        self.navigationController?.pushViewController(messengerController,animated: true)
                    }))

                        // show the alert
                        self.present(alert, animated: true)
                }else{
                    //MARK: there is a error creating the user...
                    print(error ?? "N/A")
                    
                    let alert = UIAlertController(title: "Registration Alert", message: "Please enter a valid email address", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil))
                }
            })
        } else {
            let alert = UIAlertController(title: "Registration Alert", message: "Please fill all fields", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil))
            
            self.present(alert, animated:true)
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                //self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



