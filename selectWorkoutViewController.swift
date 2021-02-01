//
//  selectWorkoutViewController.swift
//  repCount
//
//  Created by Anton Samuilov on 17/11/2020.
//

import UIKit

class selectWorkoutViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var selectedExercise : [Exercise] = []
    var workoutTest : [Workout] = []
    var selectWorkType : String = ""
    
    var selectedDays : String?
    var workoutToPass : Workout?
    var count : Int = 0
    @IBOutlet weak var selectWorkoutButton: UIButton!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "workoutCellDisplay" // also enter this string as the cell identifier in the storyboard
    var workoutType = ["Legs", "Push", "Pull", "Hyp", "Upper Body", "Full body"]
    //var daySelected : String = ""
    
    
    
    override func viewDidLoad() {
        Utilities.styleFilledButton(selectWorkoutButton)
        // deleteAllData()
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.allowsMultipleSelection = true
        collectionView.allowsMultipleSelection = false
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let width  = (view.frame.width-40)
        return CGSize(width: width, height: 50.0)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? workoutCollectionViewCell {
            cell.backgroundColor = cell.isSelected ? .white: .white
            cell.label.textColor = .black
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.workoutType.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! workoutCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.label.text = self.workoutType[indexPath.row]
        cell.label.textColor = .black
        cell.layer.cornerRadius = 10
        
        cell.backgroundColor = UIColor.white
        // make cell more visible in our example project
        
        return cell
    }
    
    
    
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        if let cell = collectionView.cellForItem(at: indexPath) as? workoutCollectionViewCell {
            cell.backgroundColor = cell.isSelected ? UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1) : .white
            cell.label.textColor = .white
        }
        // selectedDays.append(items[indexPath.item])
        
        
        selectWorkType = workoutType[indexPath.row]
        
       
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc1 = segue.destination as? addToworkoutViewController else {return}
        
        //vc1.workoutToReceive = workoutToPass
        vc1.day = selectedDays!
        vc1.name = selectWorkType
    }
    
    
    
    @IBAction func selectWorkoutTapped(_ sender: Any) {
        
        //fetchExersice ()
        if selectWorkType == "" {
            let alert = UIAlertController(title: "No selection", message: "Please select at least one Workout", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //performSegue(withIdentifier: "toDaysSelect", sender: nil)
        }else{
            performSegue(withIdentifier: "toExerciseSelection", sender: nil)
        }
        
        
        
        
    }
    
    
}
