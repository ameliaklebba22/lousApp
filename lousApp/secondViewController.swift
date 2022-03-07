import UIKit
import iPhoneNumberField

class secondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource  {
   
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    var savee = ""
    var emps: [employeeCO] = []
    static var presentt: [employeeCO] = []
    var fakePresent: [employeeCO] = []
    var stayNumbersOne: [Int] = []
    var stayNumbersTwo: [Int] = []
    var select = 0
    var numberOne = 0
    var numberTwo = 0
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["Any", "Phones", "Runner", "Bag", "Times", "Greet", "Host","Cash"]
   
        if let items = UserDefaults.standard.data(forKey: "theEmployees5"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([employeeCO].self, from: items){
                emps = decoded
                //self.tableViewOutlet.reloadData()
                secondViewController.presentt = emps
            }
        }
        print("this is the number")
        print(emps.count)
    
    }
    
    

    
    
   //picker view stuff
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
        return pickerData.count
        }
        else{
        return pickerData.count
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
        
        if component == 0{
        return pickerData[row]
        }
        else{
        return pickerData[row]
        }
        
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         secondViewController.presentt.removeAll()
        //stayNumbersTwo.removeAll()
        //stayNumbersOne.removeAll()
        //numberTwo = 0
        //numberOne = 0
        
        if component == 0 {
            numberOne = 0
            stayNumbersOne.removeAll()
              switch row{
              case 0:
              for blah in emps{
              stayNumbersOne.append(0)
              numberOne = 0
              }
    
              case 1:
              //phones
              for blah in emps{
              numberOne = 1
              if blah.ph == 1{
              stayNumbersOne.append(1)
              }
              else {
              stayNumbersOne.append(0)
              }
              }
      
             case 2:
             //runner
             for blah in emps{
             numberOne = 2
             if blah.ru == 1{
             stayNumbersOne.append(2)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 3:
             //bag
             for blah in emps{
             numberOne = 3
             if blah.ba == 1{
             stayNumbersOne.append(3)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 4:
             //times
             for blah in emps{
             numberOne = 4
             if blah.ti == 1{
             stayNumbersOne.append(4)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
             case 5:
             //greet
             for blah in emps{
             numberOne = 5
             if blah.gr == 1{
             stayNumbersOne.append(5)
             }
             else {
             stayNumbersOne.append(0)
             }
             }
                  
            case 6:
            //host
            for blah in emps{
            numberOne = 6
            if blah.ho == 1{
            stayNumbersOne.append(6)
            }
            else {
            stayNumbersOne.append(0)
            }
            }
            
            case 7:
            //cash
            for blah in emps{
            numberOne = 7
            if blah.ca == 1{
            stayNumbersOne.append(7)
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
            numberTwo = 0
            stayNumbersTwo.removeAll()
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
              if blah.ph == 1{
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
             if blah.ru == 1{
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
             if blah.ba == 1{
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
             if blah.ti == 1{
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
             if blah.gr == 1{
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
            if blah.ho == 1{
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
            if blah.ca == 1{
            stayNumbersTwo.append(7)
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
            secondViewController.presentt.append(blah)
            }
            u = u + 1
            }
        }
        
        else if stayNumbersTwo.count == 0{
            var u = 0
            for blah in emps{
               
            if stayNumbersOne[u] == numberOne{
            secondViewController.presentt.append(blah)
            }
            u = u + 1
            }
        }
        
        
        else{
        
            var u = 0
            print("using po")
            for blah in emps{
            if stayNumbersOne[u] + stayNumbersTwo[u] == numberTwo + numberOne {
            secondViewController.presentt.append(blah)
            print(blah)
            }
            u = u + 1
            }
        }
        

        secondViewController.presentt = secondViewController.presentt.sorted { (nameOne, nameTwo) -> Bool in
                    let nameOne = nameOne.lastName
            let nameTwo = nameTwo.lastName
                    return (nameOne.localizedCaseInsensitiveCompare(nameTwo) == .orderedAscending)
        }
        
        
        
        self.tableViewOutlet.reloadData()
    }
              


    


        

    //table view stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secondViewController.presentt.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200.0
    
    }
   // delete rows
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
         forRowAt indexPath: IndexPath) {
        
         if editingStyle == .delete {
             emps.remove(at: indexPath.row)
             secondViewController.presentt.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
         callSave()
     }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CrazyCell
        cell.nameOutlet?.text = String("\( secondViewController.presentt[indexPath.row].firstName) \( secondViewController.presentt[indexPath.row].lastName)")
        cell.numberOutlet?.text = String( secondViewController.presentt[indexPath.row].phone)
        
        
        
        
        if  secondViewController.presentt[indexPath.row].ph == 1{
            cell.phBox.backgroundColor = UIColor.green
        }
        else{
            print( secondViewController.presentt[indexPath.row].ph)
            cell.phBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].ru == 1{
            cell.ruBox.backgroundColor = UIColor.green
        }
        else{
            cell.ruBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].ba == 1{
            cell.baBox.backgroundColor = UIColor.green
        }
        else{
            cell.baBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].ti == 1{
            cell.tiBox.backgroundColor = UIColor.green
        }
        else{
            cell.tiBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].gr == 1{
            cell.grBox.backgroundColor = UIColor.green
        }
        else{
            cell.grBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].ho == 1{
            cell.hoBox.backgroundColor = UIColor.green
        }
        else{
            cell.hoBox.backgroundColor = UIColor.gray
        }
        
        if  secondViewController.presentt[indexPath.row].ca == 1{
            cell.caBox.backgroundColor = UIColor.green
        }
        else{
            cell.caBox.backgroundColor = UIColor.gray
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           select = indexPath.row
       
           performSegue(withIdentifier: "moving", sender: nil)
        
       }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "moving"{
        let nvc = segue.destination as! carryOutProfileViewController
        nvc.inc =  secondViewController.presentt
        nvc.incc = select
        nvc.tableView = tableViewOutlet
        nvc.myself = self
            
        }
        else{
        }
        }

  
    //add button
    @IBAction func addButton(_ sender: UIButton) {
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
            
            self.emps.append(employeeCO.init(f: firstField.text!, l: secondField.text!, numb: numberField.text!))
            secondViewController.presentt = self.emps
            
            secondViewController.presentt = secondViewController.presentt.sorted { (nameOne, nameTwo) -> Bool in
                        let nameOne = nameOne.lastName
                let nameTwo = nameTwo.lastName
                        return (nameOne.localizedCaseInsensitiveCompare(nameTwo) == .orderedAscending)
            }
            self.tableViewOutlet.reloadData()
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
        
        emps = emps.sorted { (nameOne, nameTwo) -> Bool in
        let nameOne = nameOne.lastName
        let nameTwo = nameTwo.lastName
        return (nameOne.localizedCaseInsensitiveCompare(nameTwo) == .orderedAscending)
        }
        
        
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(emps){
        print("in encoded")
        UserDefaults.standard.set(encoded, forKey: "theEmployees5")
        }
        print("saving...")
        print(emps.count)
    }

    
    
    
    
}
    

