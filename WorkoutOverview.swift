//
//  AddToWorkOutProgramViewController.swift
//  repCount
//
//  Created by Anton Samuilov on 23/10/2020.
//

import UIKit
import Foundation
import CoreData

class WorkoutOverview: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var count : Int?
    var workoutArray : [Workout] = []
    var workoutTwoDimentions : [[Workout]] = [[],[],[],[],[],[],[]]
    
    
    
    
    @IBOutlet weak var refresh: UIButton!
    private var corner: CGFloat = 10.0
    
    //var exersiseArray : Exercise?
    var sda : String = ""
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    let days = ["Monday" , "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    
    //delete
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        
        //fetchData()
        // print(exersiseArray)
        // navigationItem.title = "Workout"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.backgroundColor = UIColor.lightGray
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        
        
    }
    //
    
    //
    @IBAction func refreshbtn(_ sender: Any) {
        //fetchData()
        self.tableView.reloadData()
        // navigationController?.popToRootViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        workoutTwoDimentions = [[],[],[],[],[],[],[]]
        fetchData()
    }
    
    
    func fetchData(){
        workoutArray.removeAll()
        do {
            self.workoutArray = try context.fetch(Workout.fetchRequest())
            print ("workout amount \(workoutArray.count)")
            //DispatchQueue.main.async {
            
            for workout in self.workoutArray {
                if workout.workoutDay == "Monday" {
                    self.workoutTwoDimentions[0].append(workout)
                }else
                if workout.workoutDay == "Tuesday" {
                    
                    self.workoutTwoDimentions[1].append(workout)
                }else
                
                if workout.workoutDay == "Wednesday" {
                    
                    self.workoutTwoDimentions[2].append(workout)
                }else
                
                if workout.workoutDay == "Thursday" {
                    
                    self.workoutTwoDimentions[3].append(workout)
                }else
                
                if workout.workoutDay == "Friday" {
                    
                    self.workoutTwoDimentions[4].append(workout)
                }else
                
                if workout.workoutDay == "Saturday" {
                    
                    self.workoutTwoDimentions[5].append(workout)
                }
                else
                if workout.workoutDay == "Sunday" {
                    
                    self.workoutTwoDimentions[6].append(workout)
                    
                }
                // }
                
                //self.arrays()
                self.tableView.reloadData()
                
                
            }
        }
        catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cell = tableView.cellForRow(at: indexPath) as!  daysCell
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("count in section \(section) is \(workoutTwoDimentions[section].count)")
        if workoutTwoDimentions[section].count == 0{
             return 1
            
        }else{
            return workoutTwoDimentions[section].count
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell         {
        //let exercise = self.workoutArray![indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! daysCell

        
        if self.workoutTwoDimentions[indexPath.section].isEmpty {
            
            cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2.0
            cell.layer.cornerRadius = 10.0
            cell.layer.shadowRadius = 4.0
            //cell.layer.borderWidth = 0.1
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:corner).cgPath
            cell.isSelected = false
            
            cell.lable.text = "No Workouts Available"
            cell.exerciseName.text = "No exercise"
            cell.exerciseReps.text = " available to display w"
            cell.exerciseSets.text = ""
            
            
            
        }
        else
        {
            let workout = self.workoutTwoDimentions[indexPath.section][indexPath.row]
            
            cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2.0
            cell.layer.cornerRadius = 10.0
            cell.layer.shadowRadius = 4.0
            //cell.layer.borderWidth = 0.1
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:corner).cgPath
            cell.isSelected = false
            //print(workout.workoutName)
            
            cell.lable.text = workout.workoutName
            let exercisesArray  = workout.has as! Set<Exercise>
            if exercisesArray.count != 0 {
                for i in exercisesArray {
                    cell.exerciseName.text = i.exerciseName ?? "No exercise"
                    cell.exerciseReps.text = String(String(i.exerciseRep) + " Reps")
                    cell.exerciseSets.text = String(String(i.exerciseSet) + " Sets")
                    //print(i.exerciseName ?? "NON")
                }
            }
        }
        
        
        return cell
    }
    
    
    func userSelectedContact(day: String) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let fetchRequest : NSFetchRequest<Workout> = Workout.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "workoutDay == %@", day)
            let fetchedResults = try context.fetch(fetchRequest)
            if let aContact = fetchedResults.first {
                print(aContact.workoutName ?? "empty core data")
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return days.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        if (section == 0) {
            view.frame =  CGRect(x: 10, y: 0, width: 0 , height: 40)
        }else{
            view.frame =  CGRect(x: 10, y: 0, width: 0, height: 22)
        }
        
        view.layer.cornerRadius = 4
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width, height: 22))
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = days[section].description
        label.textColor = .gray
        view.addSubview(label)
        //view.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)// Set
        
        return view
    }
    
    
    
    
}




