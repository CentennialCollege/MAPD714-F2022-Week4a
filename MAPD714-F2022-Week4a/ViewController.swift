import UIKit

class ViewController: UIViewController {
    var leftOperand: Float = 0.0
    var rightOperand: Float = 0.0
    var haveLeftOperand: Bool = false
    var haveRightOperand: Bool = false
    var resultLabelReady: Bool = true
    
    
    //Result Label
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Event Handlers

    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
        var button = sender as UIButton
        var currentInput = button.titleLabel!.text
        var resultLabelText = ResultLabel.text
        
        if(!haveRightOperand)
        {
            haveLeftOperand = true
            leftOperand = Float(resultLabelText!)!
            resultLabelReady = false
            
        }
        else if (haveLeftOperand)
        {
         rightOperand = Float(resultLabelText!)!
        haveRightOperand = true
        }
        
        
        switch currentInput
        {
        case "+":
               if(haveLeftOperand && haveRightOperand)
            {
                   var result = leftOperand + rightOperand
                   ResultLabel.text = String(result)
                   leftOperand = result
                   rightOperand = 0.0
               }

        default:
            print("")
        }
        
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
        var button = sender as UIButton
        var currentInput = button.titleLabel!.text
        var resultLabelText = ResultLabel.text
        switch currentInput
        {
        case "0":
            if(resultLabelText != "0")
            {
                ResultLabel.text?.append("0")
            }
        case ".":
            if(!resultLabelText!.contains("."))
            {
                ResultLabel.text?.append(".")
            }
        default:
            if((resultLabelText == "0") || (haveLeftOperand))
            {
                ResultLabel.text = ""
                resultLabelReady = true
            }

            if(resultLabelReady)
            {
                ResultLabel.text?.append(currentInput!)
                
            }
            
            
            

            
        }
        
        
        
    }
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        var button = sender as UIButton
        var currentInput = button.titleLabel!.text
        switch currentInput {
        case "C":
            ResultLabel.text = "0"
        default:
            if(ResultLabel.text!.count > 1)
            {
                ResultLabel.text?.removeLast()
            }
            else
            {
                ResultLabel.text = "0"
            }
        }
    }
    
    
}

