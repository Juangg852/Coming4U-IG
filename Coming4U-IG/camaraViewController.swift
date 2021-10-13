//
//  camaraViewController.swift
//  Coming4U-IG
//
//  Created by Juan Gonzalez on 10/12/21.
//

import UIKit
import AlamofireImage
import Parse

class camaraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var CommentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
        
        let Post = PFObject(className:  "Post")
        
        Post["caption"] = CommentField.text!
        Post["owner"] = PFUser.current()!
        
        
        let imageData = ImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        Post["image"] = file
        
        Post.saveInBackground { success, error in
            if success{
                
                print ("saved!!!!")
                self.dismiss(animated: true, completion: nil)
            }else {
                print ("error!!!!!!")
            }
        }
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func Camarabutton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            
        }else  {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated:  true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size =  CGSize (width: 300, height: 300)
        
        let scaledImage = image.af_imageScaled(to: size)
        ImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
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
