//
//  ViewController.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class ViewController: UIViewController {
    
    
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
               
                
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
               
                
                
            }
        }
        
        let signUpPage = UIBarButtonItem(title: "Sign Up", style: .plain, target: self, action: #selector(onSignUpPage))
        
        loginView.btnLogin.addTarget(self, action: #selector(triggerLogin), for: .touchUpInside)
        navigationItem.rightBarButtonItem = signUpPage
    }
    
    
    @objc func triggerLogin() {
        if let email = loginView.email.text {
            if let password = loginView.password.text {
                signIn(email:email, password:password)
            }
        }
        
    }

    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password, completion: {result, error in
            if error == nil{
                //MARK: the user creation is successful...
                print("Successfully Signed in!")
                
                
                let alert = UIAlertController(title: "Login Alert", message: "Successfully Logged in! You may proeceed to the messenger page", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                    
                    let messengerController = MessengerViewController()
                    self.navigationController?.pushViewController(messengerController,animated: true)
                }))

                    // show the alert
                    self.present(alert, animated: true)
                //Push the Controller here
            }else{
                //MARK: there is a error creating the user...
                
                
                let alert = UIAlertController(title: "Login Alert", message: "Email/Password is incorrect", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true)
               // print(error ?? "N/A")
            }
        })
    }
    @objc func onSignUpPage() {
        let registerController = RegisterViewController()
        navigationController?.pushViewController(registerController, animated: true)
    }

}

    
    




