//
//  workViewController.swift
//  repCount
//
//  Created by Anton Samuilov on 22/10/2020.
//

import UIKit
import CoreData

protocol exerxciseSelected {
    func selected (exercise: Exercise)
}

class addToworkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tebleViewView: UIView!
    var selectedDay: String!
    var selectedExersise : Exercise!
    var test : [Workout]?
    
    @IBOutlet weak var addToorkout: UIButton!
    @IBOutlet weak var AddToWorkout: UIButton!
    @IBOutlet weak var bottomTableViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    var curentWork : exerxciseSelected?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let days = ["Monday" , "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var items : [Exercise]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        fetchExersice ()
        observers()
        Utilities.styleFilledButton(AddToWorkout)
        
        
        
//        tableView.layer.shadowColor = UIColor.gray.cgColor
//        tableView.layer.shadowOpacity = 1
//        tableView.layer.shadowRadius = 3
//        tableView.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//        tableView.layer.cornerRadius = 10
//        tableView.layer.borderColor = UIColor.black.cgColor
//        tableView.layer.borderWidth = 0.2
        
        
        
        tableView.allowsSelection = true
        
        
        


        // Do any additional setup after loading the view.
    }
    @objc func addTapped(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setupTransparentNavigationBarWithWhiteText()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    
    
    
    func observers() {
        NotificationCenter.default.addObserver(self, selector: #selector(fetchNewData(notification:)), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
    }
    
    @objc  func fetchExersice () {
        do {
            self.items = try context.fetch(Exercise.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
             
        }
    }
    
    @objc func fetchNewData ( notification: NSNotification) {
        do {
            self.items = try context.fetch(Exercise.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
           cellToDeSelect.contentView.backgroundColor = UIColor.white
        let cell = tableView.cellForRow(at: indexPath) as! cellTableViewCell

        cell.cellView.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
        cell.label.textColor = .white
        cell.repsLabel.textColor = .white
        cell.setsLabel.textColor = .white
        cell.weightLabel.textColor = .white
        cell.cellView.layer.borderColor = UIColor.white.cgColor
        cell.cellView.layer.borderWidth = 0.7
       
        
        //add to array to be passed
      
       
        selectedExersise = items![indexPath.item]
      
      
        
        //workingCode
//        do{
//            //let moc = DataController().managedObjectContext
//            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "WorkoutDays")
//            _ =  [Workout]()
//                fetchReq.returnsObjectsAsFaults = false
//                do {
//                    let obj = try context.fetch(fetchReq) as!  [Workout]
//                    for details in obj {
//                        print(details.workoutName!)
//
//                        //array.append(details)
//                    }
//
//                } catch {
//                    print("Error in Fetching")
//
//                }
//
//
//    }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? selectDaysTableViewController else {return}
       //                                                let index = tableView.indexPathForSelectedRow?.row
        
        if selectedExersise != nil {
            vc.selectedExercise = selectedExersise.exerciseID
        }
        
    }
    
        
        
        
        //detailViewController.cameraModel = SharedArray.SharedImagaArray.imageArray[index].imageCameraMake
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
           cellToDeSelect.contentView.backgroundColor = UIColor.white
        
        let cell = tableView.cellForRow(at: indexPath) as! cellTableViewCell

        cell.cellView.backgroundColor = UIColor.white
        cell.label.textColor = .black
        cell.repsLabel.textColor = .systemGray
        cell.setsLabel.textColor = .systemGray
        cell.weightLabel.textColor = .systemGray
        cell.cellView.layer.borderColor  = UIColor.black.cgColor
        cell.cellView.layer.borderWidth = 0.2
        

    }
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! cellTableViewCell
        cell.cellView.layer.shadowColor = UIColor.gray.cgColor
        cell.cellView.layer.shadowOpacity = 0.4
        cell.cellView.layer.shadowRadius = 3
        cell.cellView.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        cell.cellView.layer.cornerRadius = 10
       // cell.cellView.layer.borderColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1).cgColor
        cell.cellView.layer.borderWidth = 0
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        
            
        
        let exersice = self.items![indexPath.row]
        cell.label.text = exersice.exerciseName
        cell.repsLabel.text = String(exersice.exerciseRep) + " Reps"
        cell.setsLabel.text = String(exersice.exerciseSet) + " Sets"
        cell.weightLabel.text = String(String(exersice.exerciseWeight) + " " + String(exersice.exerciseWeightType ?? "KG"))
        
            
            
        
        
        //print(String(exersice.exerciseWightType!))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        //cell.contentView.layer.masksToBounds = false
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler ) in
            
            
            let exersiseToRemove = self.items![indexPath.row]
            self.context.delete(exersiseToRemove)
            
            do {
                try self.context.save()
            }
            catch{
                
            }
            
            
            self.fetchExersice()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    

    
    
    @IBAction func addToWorkout(_ sender: Any) {
        
        
//        do{
//                    //let moc = DataController().managedObjectContext
//                    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
//                        //var array =  [WorkoutDays]()
//                        fetchReq.returnsObjectsAsFaults = false
//            fetchReq.predicate = NSPredicate(format:"exerciseID = %@", selectedExersise.exerciseID! as CVarArg)
//                        do {
//                            let obj = try context.fetch(fetchReq) as!  [Exercise]
//                            
//                            for details in obj {
//                                
//                                details.exerciseDay = selectedDay ?? "Monday"
//                                
//                                //array.append(details)
//                            }
//        
//                        } catch {
//                            print("Error in Fetching")
//        
//                        }
//        }
    }
}
extension addToworkoutViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
extension UIViewController {
    func setupTransparentNavigationBarWithBlackText() {
        setupTransparentNavigationBar()
        //Status bar text and back(item) tint to black
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .black
    }

    func setupTransparentNavigationBarWithWhiteText() {
        setupTransparentNavigationBar()
        //Status bar text and back(item) tint to white
       // self.navigationController?.navigationBar.barStyle = .blackTranslucent
        //self.navigationController?.navigationBar.tintColor = .white
    }

    func setupTransparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
    }
}

