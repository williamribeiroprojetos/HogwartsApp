//
//  SettingsViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 11/10/21.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeProfileImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseView: UIView!
    @IBOutlet weak var houseLogoImageView: UIImageView!
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var settingsTableView: UITableView!
    
    var buttonName = ["Dados Pessoais", "E-mail e Senha", "Sair"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        houseView.layer.cornerRadius = 5
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.frame = view.bounds
        settingsTableView.register(UINib(nibName: "ButtonTableCell", bundle: nil), forCellReuseIdentifier: "ButtonTableCell")
        setupUserInfo()
    }

    @IBAction func tappedChangeProfileImageButton(_ sender: UIButton) {
        
    }
    
    private func alertLogOut() {
        let alert = UIAlertController(title: "ATENÇÃO!", message: "Deseja realmente deslogar de sua conta?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Continuar", style: .default) { _ in
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                print("Usuário deslogado")
                self.continueToLogin()
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func continueToLogin() {
        let storyboard = UIStoryboard(name: "User", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func setupUserInfo() {
        let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]
        nameLabel.text = userInfo?.providerID
        // Provider-specific UID
        cell?.detailTextLabel?.text = userInfo?.uid
        
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          var multiFactorString = "MultiFactor: "
            
          for info in user.multiFactor.enrolledFactors {
            multiFactorString += info.displayName ?? "[DispayName]"
            multiFactorString += " "
          }
          
            if user != nil {
                let name = user.displayName?.split(separator: " ")
                nameLabel.text = "\(name?[0] ?? "")"
                
//                if (user.photoURL == nil) {
//                    let url = URL(string: "\(user.photoURL)")
//                    photoURL.contentMode = .scaleAspectFill
//                    photoURL?.provideImageData(<#T##void#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, size: <#T##Int#>, userInfo: <#T##Any?#>)
//                    imgProfile.kf.setImage(with: url,
//                                           placeholder: UIImage(named: "profile_icon"),
//                                           options: [
//                                            .scaleFactor(UIScreen.main.scale),
//                                            .transition(.fade(1)),
//                                            .cacheOriginalImage
//                                           ]
//                    )
            }
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ButtonTableCell? = tableView.dequeueReusableCell(withIdentifier: "ButtonTableCell", for: indexPath) as? ButtonTableCell
        
        cell?.buttonName.text = buttonName[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let buttons = buttonName[indexPath.row]
        
        if buttons == "Dados Pessoais" {
            let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
            let personalData = storyboard.instantiateViewController(withIdentifier: "PersonalDataViewController") as! PersonalDataViewController
            personalData.providesPresentationContextTransitionStyle = true
            personalData.definesPresentationContext = true
            personalData.modalPresentationStyle = .automatic
            self.present(personalData, animated: true)
        } else if buttons == "E-mail e Senha" {
            let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
            let email = storyboard.instantiateViewController(withIdentifier: "EmailEditorViewController") as! EmailEditorViewController
            email.providesPresentationContextTransitionStyle = true
            email.definesPresentationContext = true
            email.modalPresentationStyle = .automatic
            self.present(email, animated: true)
        } else if buttons == "Sair" {
            self.alertLogOut()
        }
    }
    
    
}
