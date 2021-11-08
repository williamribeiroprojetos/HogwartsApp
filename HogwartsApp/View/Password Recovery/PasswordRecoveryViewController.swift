//
//  PasswordRecoveryViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 11/10/21.
//

import UIKit
import FirebaseAuth

class PasswordRecoveryViewController: UIViewController {

    @IBOutlet var viewMain: GradientView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var recoverPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var viewSuccess: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var confirmationRecoveryEmail: UILabel!
    
    var email = ""
    
      override func viewDidLoad() {
          super.viewDidLoad()
          
          setupView()
      }
      
      open override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
      }
      
      @IBAction func recoverPasswordButton(_ sender: UIButton) {
          if validateForm() {
              self.view.endEditing(true)
              let emailUser = emailTextField.text!.trimmingCharacters(in: .whitespaces)
              
              let parameters = [
                  "email": emailUser
              ]
              
              self.resetPassword(parameters: parameters) { (success) in
                  if success {
                      self.emailTextField.isHidden = true
                      self.textLabel.isHidden = true
                      self.viewSuccess.isHidden = false
                      self.emailLabel.text = self.emailTextField.text?.trimmingCharacters(in: .whitespaces)
                      self.recoverPasswordButton.titleLabel?.text = "REENVIAR E-MAIL"
                  }
              }
          }
      }
      
    func resetPassword(parameters: [String : String], completion: @escaping (Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
      @IBAction func loginButton(_ sender: Any) {
          let storyboard = UIStoryboard(name: "User", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
          vc.providesPresentationContextTransitionStyle = true
          vc.definesPresentationContext = true
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
      }
      
      @IBAction func createAccountButton(_ sender: Any) {
          let storyboard = UIStoryboard(name: "User", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
          vc.providesPresentationContextTransitionStyle = true
          vc.definesPresentationContext = true
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
      }
      
      fileprivate func validateForm() -> Bool {
          let status = emailTextField.text!.isEmpty ||
              !emailTextField.text!.contains(".") ||
              !emailTextField.text!.contains("@") ||
              emailTextField.text!.count <= 5
          
          if status {
              emailTextField.setErrorColor()
              textLabel.textColor = .systemRed
              textLabel.text = "Verifique o e-mail informado"
              return false
          }
          
          return true
      }
  }

  // MARK: - Comportamentos de layout
  extension PasswordRecoveryViewController {
      
      fileprivate func setupView() {
          recoverPasswordButton.layer.cornerRadius = recoverPasswordButton.bounds.height / 2
          
          loginButton.backgroundColor = .clear
          loginButton.layer.cornerRadius = createAccountButton.frame.height / 2
          loginButton.layer.borderWidth = 1
          loginButton.layer.borderColor = UIColor.systemYellow.cgColor
          
          createAccountButton.backgroundColor = .clear
          createAccountButton.layer.cornerRadius = createAccountButton.frame.height / 2
          createAccountButton.layer.borderWidth = 1
          createAccountButton.layer.borderColor = UIColor.systemYellow.cgColor
          
          emailTextField.setEditingColor()
          
          if !email.isEmpty {
              emailTextField.text = email
              emailTextField.isEnabled = false
          }
          validateButton()
      }
      
      //email
      @IBAction func emailBeginEditing(_ sender: Any) {
          emailTextField.setEditingColor()
          textLabel.textColor = .gray
          textLabel.text = "Informe o e-mail associado à sua conta"
      }
      
      @IBAction func emailEditing(_ sender: Any) {
          emailTextField.setEditingColor()
          
          textLabel.textColor = .gray
          textLabel.text = "Informe o e-mail associado à sua conta"
          
          validateButton()
      }
      
      @IBAction func emailEndEditing(_ sender: Any) {
          emailTextField.setEditingColor()
      }
      
  }

  extension PasswordRecoveryViewController {
      
      fileprivate func validateButton() {
          if !emailTextField.text!.isEmpty {
              enableCreateButton()
          } else {
              disableCreateButton()
          }
      }
      
      fileprivate func disableCreateButton() {
          recoverPasswordButton.backgroundColor = .gray
          recoverPasswordButton.setTitleColor(.black, for: .normal)
          recoverPasswordButton.isEnabled = false
      }
      
      fileprivate func enableCreateButton() {
          recoverPasswordButton.setTitleColor(.white, for: .normal)
          recoverPasswordButton.isEnabled = true
      }

}
