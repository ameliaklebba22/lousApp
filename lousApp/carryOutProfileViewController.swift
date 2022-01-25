import UIKit

class carryOutProfileViewController: UIViewController {
    var inc: [employeeCO] = []
    var incc = 0
    
    @IBOutlet weak var phonesSwitch: UISwitch!
    @IBOutlet weak var runnerSwitch: UISwitch!
    @IBOutlet weak var bagSwitch: UISwitch!
    @IBOutlet weak var timesSwicth: UISwitch!
    @IBOutlet weak var greetSwitch: UISwitch!
    @IBOutlet weak var hostSwitch: UISwitch!
    @IBOutlet weak var cashSwitch: UISwitch!
    
    
    @IBOutlet weak var lastOutlet: UILabel!
    @IBOutlet weak var numberOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameOutlet.text! = inc[incc].firstName
        lastOutlet.text! = inc[incc].lastName
        numberOutlet.text! = inc[incc].phone
    
    setAllSkills()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        setAllSkills()
    }
    
    
    
    
    
    @IBAction func phonesChange(_ sender: UISwitch) {
        if phonesSwitch.isOn == true{
            inc[incc].ph = 1
        }
        else {
            inc[incc].ph = 0
        }
    }
    
    
    @IBAction func runnerChange(_ sender: UISwitch) {
        if runnerSwitch.isOn == true{
            inc[incc].ru = 1
        }
        else {
            inc[incc].ru = 0
        }
        
    }
    
    @IBAction func bagChange(_ sender: UISwitch) {
        if bagSwitch.isOn == true{
            inc[incc].ba = 1
        }
        else {
            inc[incc].ba = 0
        }
    }
    
    
    @IBAction func timesChange(_ sender: UISwitch) {
        if timesSwicth.isOn == true{
            inc[incc].ti = 1
        }
        else {
            inc[incc].ti = 0
        }
    }
    
    
    @IBAction func greetChange(_ sender: UISwitch) {
        if greetSwitch.isOn == true{
            inc[incc].gr = 1
        }
        else {
            inc[incc].gr = 0
        }
    }
    

    @IBAction func hostChange(_ sender: UISwitch) {
        if hostSwitch.isOn == true{
            inc[incc].ho = 1
        }
        else {
            inc[incc].ho = 0
        }
    }
    
    
    
    
    @IBAction func cashChange(_ sender: UISwitch) {
        if cashSwitch.isOn == true{
            inc[incc].ca = 1
        }
        else {
            inc[incc].ca = 0
        }
    }
    
    
    func setAllSkills(){
        if inc[incc].ph == 1{
            phonesSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ru == 1{
            runnerSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ba == 1{
            bagSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ti == 1{
            timesSwicth.setOn(true, animated: true)
        }
        
        if inc[incc].gr == 1{
            greetSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ho == 1{
            hostSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ca == 1{
            cashSwitch.setOn(true, animated: true)
        }
    }
    
    
    
   
    
   
    @IBAction func pooo(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
}
