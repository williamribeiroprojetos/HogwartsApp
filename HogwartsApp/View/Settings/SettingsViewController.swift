//
//  SettingsViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 11/10/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeProfileImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseView: UIView!
    @IBOutlet weak var houseLogoImageView: UIImageView!
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var settingsTableView: UITableView!
    
    var imagePicker: UIImagePickerController!
    var buttonName = ["Dados Pessoais", "E-mail", "Senha", "Sair"]
    
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
    
    @objc func openImagePicker(_ sender:Any) {
        
        self.present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func tappedChangeProfileImageButton(_ sender: UIButton) {
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
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
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func setupUserInfo() {
        
    }
    
    func uploadImage(imageUrl: URL) {
        do {
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let fileExtension = imageUrl.pathExtension
            let fileName = "user/\(uid)/profileImages/\(fileExtension)"
            let metaData = StorageMetadata()
            
            let storageReference = Storage.storage().reference().child(fileName)
            let currentUploadTask = storageReference.putFile(from: imageUrl, metadata: metaData) { (storageMetaData, error) in
                
                if let error = error {
                    print("Upload error: \(error.localizedDescription)")
                    return
                }
                
                print("Image file: \(fileName) is uploaded! View it at Firebase console!")
                
                storageReference.downloadURL { (url, error) in
                    if let error = error  {
                        print("Error on getting download url: \(error.localizedDescription)")
                        return
                    }
                    print("Download url of \(fileName) is \(url!.absoluteString)")
                }
            }
        } catch {
            print("Error on extracting data from url: \(error.localizedDescription)")
        }
    }
//    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
//
//
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let storageRef = Storage.storage().reference().child("user/\(uid)/profileImages/")
//
//        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
//
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpg"
//        storageRef.putFile(from: <#T##NSURL#>, metadata: <#T##FIRStorageMetadata?#>, completion: <#T##((FIRStorageMetadata?, Error?) -> Void)?#>) putData(imageData, metadata: metaData) { metaData, error in
//
//            if error == nil, metaData != nil {
//                if let url = URL(string: "")
//                {
//                    completion(url)
//                } else {
//                    completion(nil)
//                }
//            } else {
//                completion(nil)
//            }
//        }
//    }
}

//MARK: - ImagePicker Delegate
extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - TableView DataSource and Delegate
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
        } else if buttons == "E-mail" {
            let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
            let email = storyboard.instantiateViewController(withIdentifier: "EmailEditorViewController") as! EmailEditorViewController
            email.providesPresentationContextTransitionStyle = true
            email.definesPresentationContext = true
            email.modalPresentationStyle = .automatic
            self.present(email, animated: true)
        } else if buttons == "Senha" {
            let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
            let password = storyboard.instantiateViewController(withIdentifier: "PasswordEditorViewController") as! PasswordEditorViewController
            password.providesPresentationContextTransitionStyle = true
            password.definesPresentationContext = true
            password.modalPresentationStyle = .automatic
            self.present(password, animated: true)
        } else if buttons == "Sair" {
            self.alertLogOut()
        }
    }
}
