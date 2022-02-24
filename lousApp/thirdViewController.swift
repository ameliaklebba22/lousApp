//SCALABILITY


import UIKit
import iPhoneNumberField

class thirdViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource  {
   
    
    @IBOutlet weak var anotherTableView: UITableView!
    var savee = ""
    var emps: [employeeKitchen] = []
    static var anotherPresent: [employeeKitchen] = []
    var fakePresent: [employeeKitchen] = []
    var stayNumbersOne: [Int] = []
    var stayNumbersTwo: [Int] = []
    var select = 0
    var numberOne = 0
    var numberTwo = 0
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var addButtonOutlet: UIButton!
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anotherTableView.delegate = self
        anotherTableView.dataSource = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["All", "Dish", "Pantry", "Appetizers", "Steam", "Ovens", "Saucing","Toppings","Prep"]
   
        if let items = UserDefaults.standard.data(forKey: "theEmployees4"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([employeeKitchen].self, from: items){
                emps = decoded
                thirdViewController.anotherPresent = emps
    }
    }
    }
    
    

    
    
   //picker view component
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    2
    }
    
    //picker view rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0{
    return pickerData.count
    }
    else{
    return pickerData.count
    }
    }
    
    //picker view text
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    if component == 0{
    return pickerData[row]
    }
    else{
    return pickerData[row]
    }
    }
    
    //picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("this is emps")
        print(emps.count)
        thirdViewController.anotherPresent.removeAll()
        stayNumbersTwo.removeAll()
        stayNumbersOne.removeAll()
        numberTwo = 0
        numberOne = 0
        
        if component == 0 {
              switch row{
              case 0:
              for blah in emps{
              stayNumbersOne.append(0)
              numberOne = 0
              }
    
              case 1:
              for blah in emps{
              numberOne = 1
              if blah.di == 1{
              stayNumbersOne.append(1)
              }
              else {
              stayNumbersOne.append(0)
              }
              }
      
             case 2:
             for blah in emps{
             numberOne = 2
             if blah.pa == 1{
             stayNumbersOne.append(2)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 3:
             for blah in emps{
             numberOne = 3
             if blah.ap == 1{
             stayNumbersOne.append(3)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 4:
             for blah in emps{
             numberOne = 4
             if blah.st == 1{
             stayNumbersOne.append(4)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 5:
             for blah in emps{
             numberOne = 5
             if blah.ov == 1{
             stayNumbersOne.append(5)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
            case 6:
            for blah in emps{
            numberOne = 6
            if blah.sa == 1{
            stayNumbersOne.append(6)
            }
            else {
            stayNumbersOne.append(0)
            }
            }
            
            case 7:
            for blah in emps{
            numberOne = 7
            if blah.to == 1{
            stayNumbersOne.append(7)
            }
            else {
            stayNumbersOne.append(0)
            }
            }
            case 8:
            for blah in emps{
            numberOne = 8
            if blah.pr == 1{
            stayNumbersOne.append(8)
            }
            else {
            stayNumbersOne.append(0)
            }
            }
            default:
            print("5")
    }
    }
        
        if component == 1 {
              switch row{
              case 0:
              for blah in emps{
              stayNumbersTwo.append(0)
              numberOne = 0
              }
    
              case 1:
              //phones
              for blah in emps{
              numberTwo = 1
              if blah.di == 1{
              stayNumbersTwo.append(1)
              }
              else {
              stayNumbersTwo.append(0)
              }
              }
      
             case 2:
             //runner
             for blah in emps{
             numberTwo = 2
             if blah.pa == 1{
             stayNumbersTwo.append(2)
             }
             else {
             stayNumbersTwo.append(0)
             }
             }
                  
             case 3:
             //bag
             for blah in emps{
             numberTwo = 3
             if blah.ap == 1{
             stayNumbersTwo.append(3)
             }
             else {
             stayNumbersTwo.append(0)
             }
             }
                  
             case 4:
             //times
             for blah in emps{
             numberTwo = 4
             if blah.st == 1{
             stayNumbersTwo.append(4)
             }
             else {
             stayNumbersTwo.append(0)
             }
             }
                  
             case 5:
             //greet
             for blah in emps{
             numberTwo = 5
             if blah.ov == 1{
             stayNumbersTwo.append(5)
             }
             else {
             stayNumbersTwo.append(0)
             }
             }
                  
            case 6:
            //host
            for blah in emps{
            numberTwo = 6
            if blah.sa == 1{
            stayNumbersTwo.append(6)
            }
            else {
            stayNumbersTwo.append(0)
            }
            }
            
            case 7:
            //cash
            for blah in emps{
            numberTwo = 7
            if blah.to == 1{
            stayNumbersTwo.append(7)
            }
            else {
            stayNumbersTwo.append(0)
            }
            }
             
            case 8:
            //cash
            for blah in emps{
            numberTwo = 8
            if blah.pr == 1{
            stayNumbersTwo.append(8)
            }
            else {
            stayNumbersTwo.append(0)
            }
            }
            default:
            print("5")
    }
    }
        
        
        if stayNumbersOne.count == 0{
            var u = 0
            for blah in emps{
               
            if stayNumbersTwo[u] == numberTwo{
            thirdViewController.anotherPresent.append(blah)
            u = u + 1
            }
            }
        }
        
        else if stayNumbersTwo.count == 0{
            var u = 0
            for blah in emps{
               
            if stayNumbersOne[u] == numberOne{
        thirdViewController.anotherPresent.append(blah)
            u = u + 1
            }
            }
        }
        
        
        else{
        
            var u = 0
            for blah in emps{
            if stayNumbersOne[u] + stayNumbersTwo[u] == numberTwo + numberOne {
            thirdViewController.anotherPresent.append(blah)
            u = u + 1
            }
            }
        }
        
        
       self.anotherTableView.reloadData()

        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
              


    


        

    //table view stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        thirdViewController.anotherPresent.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200.0
    
    }
   // delete rows
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
         forRowAt indexPath: IndexPath) {
        
         if editingStyle == .delete {
             emps.remove(at: indexPath.row)
             thirdViewController.anotherPresent.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
         callSave()
     }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath) as! CrazyCell2
        cell.nameLabel?.text = String("\( thirdViewController.anotherPresent[indexPath.row].firstName) \(thirdViewController.anotherPresent[indexPath.row].lastName)")
        cell.numberLabel?.text = String( thirdViewController.anotherPresent[indexPath.row].phone)
        
        
        
        
    if thirdViewController.anotherPresent[indexPath.row].di == 1{
        cell.diLabel.backgroundColor = UIColor.systemYellow
        }
        else{
        cell.diLabel.backgroundColor = UIColor.gray
        }
        
    if thirdViewController.anotherPresent[indexPath.row].pa == 1{
        cell.paLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.paLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].ap == 1{
            cell.apLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.apLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].st == 1{
            cell.stLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.saLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].ov == 1{
            cell.ovLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.toLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].sa == 1{
            cell.saLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.saLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].to == 1{
            cell.toLabel.backgroundColor = UIColor.systemYellow
        }
        else{
            cell.toLabel.backgroundColor = UIColor.gray
        }
        
    if  thirdViewController.anotherPresent[indexPath.row].pr == 1{
            cell.prLabel.backgroundColor = UIColor.systemYellow
            }
        else{
            cell.prLabel.backgroundColor = UIColor.gray
            }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           select = indexPath.row
       
           performSegue(withIdentifier: "moving2", sender: nil)
        
       }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "moving2"{
        let nvc = segue.destination as! kitchenProfileViewController
        nvc.inc =  thirdViewController.anotherPresent
        nvc.incc = select
        nvc.tableView = anotherTableView
        nvc.myself = self
            
        }
        else{
        }
        }

  
    //add button
    @IBAction func addButton(_ sender: Any) {
        showAlert()
    }
    

    func showAlert(){
    let alertt = UIAlertController(title: "Add a New Employee", message: "Enter the employee information.", preferredStyle: .alert)
        
        //adding options
        alertt.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertt.addAction(UIAlertAction(title: "Continue", style: .default, handler: { ale in
         
            guard let fields = alertt.textFields, fields.count == 3 else{
                return
            }
            
            let firstField = fields[0]
            let secondField = fields[1]
            let numberField = fields[2]
            
            self.emps.append(employeeKitchen.init(f: firstField.text!, l: secondField.text!, numb: numberField.text!))
            thirdViewController.anotherPresent = self.emps
            self.anotherTableView.reloadData()
            self.callSave()
        }))
        
        
                         
        //adding fields
       alertt.addTextField { field in
            field.placeholder = "First Name"
            field.returnKeyType = .next
            field.keyboardType = .default
        }
        alertt.addTextField { field in
            field.placeholder = "Last Name"
            field.returnKeyType = .continue
            field.keyboardType = .default
        }
        
            alertt.addTextField{ field in
            field.placeholder = "Phone Number"
            field.returnKeyType = .continue
            field.keyboardType = .numberPad
        }
            present(alertt, animated: true)
            callSave()
        }
        
  

    func callSave(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(emps){
        print("in encoded")
        UserDefaults.standard.set(encoded, forKey: "theEmployees4")
        }
        print("saving...")
        print(emps.count)
    }

    
    
    
    
}
    



