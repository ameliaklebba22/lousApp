import UIKit

class secondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableViewOutlet: UITableView!
    var savee = ""
    var emps: [employeeCO] = []
    var select = 0
    @IBOutlet weak var addButtonOutlet: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       emps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
       
        cell.textLabel?.text = String(emps[indexPath.row].firstName)
        return cell
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "moving"{
        let nvc = segue.destination as! carryOutProfileViewController
            nvc.inc = emps
            nvc.incc = select
        }
        else{
        }
        }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           select = indexPath.row
           performSegue(withIdentifier: "moving", sender: nil)
        
       }

    
    

    
    
    
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
        
        
        


    }






    



    
    
    
    
    
    
    
    
    


