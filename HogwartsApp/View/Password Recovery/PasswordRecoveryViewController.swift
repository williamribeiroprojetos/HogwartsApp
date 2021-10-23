//
//  PasswordRecoveryViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 11/10/21.
//

import UIKit

class PasswordRecoveryViewController: UIViewController {

    @IBOutlet var viewMain: GradientView!
    @IBOutlet weak var emailTextfield: UITextField!
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
      
      @IBAction func recoverPasswordButton(_ sender: Any) {
          if validateForm() {
              self.view.endEditing(true)
              let emailUser = emailTextfield.text!.trimmingCharacters(in: .whitespaces)
              
              let parameters = [
                  "email": emailUser
              ]
              
//              let network = Network(self)
//              network.resetPassword(self, parameters: parameters) { (success) in
//                  if success {
//                      self.view.hideLoadingIndicator()
//                      self.emailTextfield.isHidden = true
//                      self.textLabel.isHidden = true
//                      self.viewSuccess.isHidden = false
//                      self.emailLabel.text = self.emailTextfield.text?.trimmingCharacters(in: .whitespaces)
//                      self.recoverPasswordButton.titleLabel?.text = "REENVIAR E-MAIL"
//                  }
//              }
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
          let status = emailTextfield.text!.isEmpty ||
              !emailTextfield.text!.contains(".") ||
              !emailTextfield.text!.contains("@") ||
              emailTextfield.text!.count <= 5
          
          if status {
              emailTextfield.setErrorColor()
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
          
          emailTextfield.setEditingColor()
          
          if !email.isEmpty {
              emailTextfield.text = email
              emailTextfield.isEnabled = false
          }
          validateButton()
      }
      
      //email
      @IBAction func emailBeginEditing(_ sender: Any) {
          emailTextfield.setEditingColor()
          textLabel.textColor = .gray
          textLabel.text = "Informe o e-mail associado à sua conta"
      }
      
      @IBAction func emailEditing(_ sender: Any) {
          emailTextfield.setEditingColor()
          
          textLabel.textColor = .gray
          textLabel.text = "Informe o e-mail associado à sua conta"
          
          validateButton()
      }
      
      @IBAction func emailEndEditing(_ sender: Any) {
          emailTextfield.setEditingColor()
      }
      
  }

  extension PasswordRecoveryViewController {
      
      fileprivate func validateButton() {
          if !emailTextfield.text!.isEmpty {
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
