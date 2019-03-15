//
//  PhotoViewController.swift
//  PhotoChallenge
//
//  Created by Robert Graman on 3/14/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("here")
        picker.dismiss(animated: true)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picture.image = image
    }
    
    @IBAction func camera(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("camera not available")
            return
        }
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
    }
    
    
    @IBAction func library(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else{
            print("Failed to open photos")
            return
        }
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
