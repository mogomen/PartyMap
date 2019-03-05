//
//  CreateEventListViewController.swift
//  partyMap
//
//  Created by Sergey  Nedorezov on 03/02/2019.
//  Copyright © 2019 Sergey  Nedorezov. All rights reserved.
//

import UIKit

class CreateEventListViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
  
    @IBOutlet weak var profileImageOutlet: UIButton!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeAdress: UITextField!
    @IBOutlet weak var imageCollectionButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    // links outlets
    @IBOutlet weak var twitterTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var instagramTextField: UITextField!
    @IBOutlet weak var vkontakteTextField: UITextField!
    @IBOutlet weak var facebookTextField: UITextField!
    
    // picker outlets
    @IBOutlet weak var pickerDateLabel: UITextField!
    @IBOutlet weak var pickerCategoryLabel: UITextField!
    
    // textField aboutevent, two buttons cancel and save
    @IBOutlet weak var aboutEventTextField: UITextField!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var saveEventButtonOutlet: UIButton!
    
    // using array from categoriesDataViewController
    var categoriesList:[Categories] = []
    var categoriesArray = CategoriesDataViewController()

    // Actions
    @IBAction func profileImageButton(_ sender: Any) {
        alertButtons()
    }
    
    @IBAction func setCollectionImage(_ sender: Any) {
        print("have touched album image")
    }
 
    @IBAction func cancelButton(_ sender: Any) {
        print("cancel button has been touched")
    }
    
    @IBAction func saveEventButton(_ sender: Any) {
        print("Save button has been touched")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         if let setImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImage.image = setImage
        }
        self.dismiss(animated: true, completion: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray()
        // left image
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        
        // photoLibraryImage
       imageCollectionButton.layer.cornerRadius = 15.0
    
        // big textField
        aboutEventTextField.layer.cornerRadius = 15.0
        
        // call methods
        createToolBar()
        createPicker()
        createDatePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createPicker() {  // categories picker
        var categoryPicker = UIPickerView()
         categoryPicker.delegate = self
        pickerCategoryLabel.inputView = categoryPicker
    }
    
    func createDatePicker() {
        var datePicker = UIDatePicker()
        pickerDateLabel.inputView = datePicker
        datePicker.addTarget(self, action: #selector(CreateEventListViewController.datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker)  {
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
        pickerDateLabel.text = selectedDate
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CreateEventListViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        pickerCategoryLabel.inputAccessoryView = toolBar
        pickerDateLabel.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func createArray() {
        categoriesList = categoriesArray.createArray()
    }
}
// set round image
extension CreateEventListViewController {

    func alertButtons() {
        var imagePickerController =   UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        let actionSheet = UIAlertController(title: "PhotoSource", message: "Choose source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension CreateEventListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return categoriesList[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCategoryLabel.text = categoriesList[row].title
    }
}












