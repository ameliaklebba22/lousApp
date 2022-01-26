import UIKit

class secondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource  {
   
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    var savee = ""
    var emps: [employeeCO] = []
    static var presentt: [employeeCO] = []

    var select = 0
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["All", "Phones", "Runner", "Bag", "Times", "Greet", "Host","Cash"]
   
        if let items = UserDefaults.standard.data(forKey: "theEmployees2"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([employeeCO].self, from: items){
                emps = decoded
                secondViewController.presentt = emps
            }
        }
    
    
    }
    
    
    

    @IBAction func save(_ sender: Any) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(emps){
            UserDefaults.standard.set(encoded, forKey: "theEmployees2")
        }
    }
    
    
    
    
   //picker view stuff
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        secondViewController.presentt.removeAll()
        switch row{
        case 0:
            for blah in emps{
            secondViewController.presentt.append(blah)
            self.tableViewOutlet.reloadData()
            }
            
        case 1:
            //phones
            for blah in emps{
                if blah.ph == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }
                    
            case 2:
                //runner
                for blah in emps{
                    if blah.ru == 1{
                        secondViewController.presentt.append(blah)
                        self.tableViewOutlet.reloadData()
                    }
                    self.tableViewOutlet.reloadData()
                }
        case 3:
            //bag
            for blah in emps{
                if blah.ba == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }
        case 4:
            //times
            for blah in emps{
                if blah.ti == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }
        case 5:
            //greet
            for blah in emps{
                if blah.gr == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }
        case 6:
            //host
            for blah in emps{
                if blah.ho == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }
        case 7:
            //cash
            for blah in emps{
                if blah.ca == 1{
                    secondViewController.presentt.append(blah)
                    self.tableViewOutlet.reloadData()
                }
                self.tableViewOutlet.reloadData()
            }

        default:
            print("5")



        }
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
        //nvc.modalPresentationStyle = .fullScreen
        nvc.inc =  secondViewController.presentt
        nvc.incc = select
        nvc.tableView = tableViewOutlet
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
            //why do i need self
            secondViewController.presentt = self.emps
            self.tableViewOutlet.reloadData()
            
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
        alertt.addTextField { field in
            field.placeholder = "Phone Number"
            field.returnKeyType = .continue
            field.keyboardType = .numberPad
            
        }
            present(alertt, animated: true)
        }
        
    
    
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableViewOutlet.reloadData()
    }
    
    
    
    
    
    






    



    
    
    
    
    
    
}
    


