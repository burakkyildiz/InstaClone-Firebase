//
//  UploadVC.swift
//  InstaClone-Firebase
//
//  Created by Burak Yıldız on 20.01.2024.
//

import UIKit
//import FirebaseFirestore
import FirebaseStorage
class UploadVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGesture)
    }
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    @IBAction func uploadClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFile = storageReferance.child("media")
        
        if let imageData = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReferance = mediaFile.child("\(uuid).jpg")
            imageReferance.putData(imageData, metadata: nil) { metadata, error in
                if error != nil{
                    self.showAlert(title: "ERROR", message: error?.localizedDescription ?? "Error")
                }else{
                    imageReferance.downloadURL { url, error in
                        if error != nil{
                            let imageURL = url?.absoluteString
                            print(imageURL)
                        }
                    }
                }
            }
        }
        
    }
    func showAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
