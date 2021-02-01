//
//  selectDays.swift
//  repCount
//
//  Created by Anton Samuilov on 11/11/2020.
//

import UIKit
import CoreData


class selectDaysTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var workout : [Workout] = []
    var workoutTest : [Workout] = []
    
    var selectedDay : String = ""

    //var selectedExercise : [Exercise] = []
    let days = ["Monday" , "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var rowsWhichAreChecked = [NSIndexPath]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchExersice ()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.layer.borderWidth = 0.3
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.backgroundColor = .white
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        //deleteAllData()
        

       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func deleteAllData() {
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")

        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false

        do {
            let items = try context.fetch(fetchRequest) as! [NSManagedObject]

            for item in items {
                context.delete(item)
            }

            // Save Changes
            try context.save()

        } catch {
            // Error Handling
            // ...
        }
    }
    
    @objc  func fetchExersice () {
        do {
            self.workout = try context.fetch(Workout.fetchRequest())
            DispatchQueue.main.async {
                //print(self.workout)
                
            }
        }
        catch{
             
        }
    }
    @objc  func fetchExersiceTEST () {
        do {
            self.workoutTest = try context.fetch(Workout.fetchRequest())
            DispatchQueue.main.async {
                for test in self.workoutTest{
                       print(test.workoutName ?? "non",test.canBe ?? "nil")
                }
                
            }
        }
        catch{
             
        }
    }

    // MARK: - Table view data source

    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daysC", for: indexPath) as! daysCellSelect
        cell.label.text = days[indexPath.item]
       // cell.tickButton.tag = indexPath.item
        
        cell.cellBackground.layer.shadowColor = UIColor.gray.cgColor
        cell.cellBackground.layer.shadowOpacity = 0.4
        cell.cellBackground.layer.shadowRadius = 3
        cell.cellBackground.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        cell.cellBackground.layer.cornerRadius = 10
       // cell.cellView.layer.borderColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1).cgColor
        cell.cellBackground.layer.borderWidth = 0
        
       // cell.cellView.layer.borderColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1).cgColor
        cell.cellBackground.layer.borderWidth = 0
        
        
        
        
     
        //cell.tickButton.isHidden = true
        
        return cell
    }

     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
        //cell.tickButton.isHidden = true

        cell.cellBackground.backgroundColor = UIColor.white
        cell.label.textColor = .black
        cell.cellBackground.layer.borderColor  = UIColor.black.cgColor
        cell.cellBackground.layer.borderWidth = 0.2
            }
     func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
      
        cell.backgroundColor = .white
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
        //cell.tickButton.isHidden = false
        
        cell.cellBackground.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
        cell.label.textColor = .white
        
        cell.cellBackground.layer.borderColor = UIColor.white.cgColor
        cell.cellBackground.layer.borderWidth = 0.7
        
        selectedDay = days[indexPath.row]
        //print(selectedDay)
        
        
//        for workout in workout{
//            workout.workoutDay = days[indexPath.item]
//        }
//        do {
//            try self.context.save()
//        }
//        catch {
//            print("error saving data")
//
//        }
     }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc  = segue.destination as? selectWorkoutViewController else {return}
        
        vc.selectedDays = selectedDay 
    }
        
    @IBAction func selectDayButtonPressed(_ sender: Any) {
        //fetchExersiceTEST ()
        
        if selectedDay == "" {
            let alert = UIAlertController(title: "No selection", message: "Please select at least one day", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //performSegue(withIdentifier: "toDaysSelect", sender: nil)
        }else{
            performSegue(withIdentifier: "toSelectWorkout", sender: nil)
        }
        
    }
    
        
        
        
        
//        cell.cellBackground.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
//        cell.label.textColor = .white
//
//        cell.cellBackground.layer.borderColor = UIColor.white.cgColor
//        cell.cellBackground.layer.borderWidth = 0.7
        
        
        
        
//        for exercice in selectedExercise{
//
//        do{
//                            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
//                                fetchReq.returnsObjectsAsFaults = false
//            fetchReq.predicate = NSPredicate(format:"exerciseID = %@", exercice.exerciseID! as CVarArg)
//                                do {
//                                    let obj = try context.fetch(fetchReq) as!  [Exercise]
//
//                                    for details in obj {
//                                        print(details)
//                                        //details.addToIsIn(<#T##value: Workout##Workout#>)
//
//
//                                        //details.exerciseDay = selectedDay ?? "Monday"
//
//                                        //array.append(details)
//                                    }
//
//                                } catch {
//                                    print("Error in Fetching")
//
//                                }
//                }
//        }
        


}
