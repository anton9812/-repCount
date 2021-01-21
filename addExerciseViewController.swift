//
//  addExerciseViewController.swift
//  repCount
//
//  Created by Anton Samuilov on 19/10/2020.
//

import UIKit
import CoreData


class addExerciseViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var repCountTextField: UITextField!
    @IBOutlet weak var mainStackTop: NSLayoutConstraint!
    @IBOutlet weak var mainStackBottom: NSLayoutConstraint!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var exerciseName: UITextField!
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var weightTextfield: UITextField!
    @IBOutlet weak var kgLbs: UISegmentedControl!
   
    @IBOutlet weak var setsTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var weightType = ""
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        secondaryView.setRadius(radius: 20)
        Utilities.styleTextField(exerciseName)
        Utilities.styleTextField(repCountTextField)
        Utilities.styleTextField(weightTextField)
        Utilities.styleTextField(setsTxt)
        Utilities.styleFilledButton(saveButton)
        self.exerciseName.delegate = self
        self.weightTextField.delegate = self
        self.repCountTextField.delegate = self
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
      
        print(UIScreen.main.bounds.size.height)
        
    }
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -250 // Move view 150 points upward
    }
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
  
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == repCountTextField {
            if textField.text?.count == 2 {
                    print("2char")
                } else {
                    print("non")
                }
            }
    }
    
    
    @IBAction func selectWeighttype(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            weightType = "KG"
            print("KG")
        case 1:
            weightType = "LBS"

            print("LBS")
        default:
            break;
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

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        switch kgLbs.selectedSegmentIndex{
        case 0:
            weightType = "KG"
            print("KG")
        case 1:
            weightType = "LBS"

            print("LBS")
        default:
            break;
        }
        //print(weightType)
        
        let id = UUID.init()
        //print(id)
        let newExersise = Exercise(context: self.context)
        newExersise.exerciseName = exerciseName.text
        let weight = Int(weightTextfield.text ?? "na")
        newExersise.exerciseID = id
        newExersise.exerciseWeight = Int64(weight!)
        newExersise.exerciseRep = Int64(repCountTextField.text!)!
        newExersise.exerciseSet = Int64(setsTxt.text!)!
        newExersise.exerciseWeightType = weightType 
        
        do {
            try self.context.save()
        }
        catch {
            print("error saving data")
            
        }
        let  name = Notification.Name("reloadTable")
        NotificationCenter.default.post(name: name, object: nil)
        
    }
}

extension UIView {
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = true;
    }
}
