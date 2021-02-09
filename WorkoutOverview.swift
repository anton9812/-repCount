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
        self.tableView.backgroundColor = UIColor.clear
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        
        
    }
    
    
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
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         print("count in section \(section) is \(workoutTwoDimentions[section].count)")

        return workoutTwoDimentions[section].count
      
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell         {
        //let exercise = self.workoutArray![indexPath.row]
        let workout = self.workoutTwoDimentions[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! daysCell
        
        
        cell.lable.text = workout.workoutName
        let b  = workout.has as! Set<Exercise>
        if b.count != 0 {
            for i in b{
                cell.label2.text = i.exerciseName ?? "No exercise"
                //print(i.exerciseName ?? "NON")
            }
        }
        //cell.label2.text = workout.has
        
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
        
        view.layer.cornerRadius = 8
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width, height: 22))
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = days[section].description
        label.textColor = .white
        view.addSubview(label)
        view.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)// Set
        
        return view
    }
    
    
    
    
}




