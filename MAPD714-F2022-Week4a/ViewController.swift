import UIKit

class ViewController: UIViewController {
    var leftOperand: Float = 0.0
    var rightOperand: Float = 0.0
    var haveLeftOperand: Bool = false
    var haveRightOperand: Bool = false
    var resultLabelReady: Bool = true
    var result: Float = 0.0
    var activeOperator: String = ""
    
    
    //Result Label
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Operator Functions
    func Add(lhs: Float, rhs: Float)->Float
    {
        return lhs + rhs
    }
    
    func Subtract(lhs: Float, rhs: Float) -> Float
    {
        return lhs - rhs
    }
    
    func Multiply(lhs: Float, rhs: Float) -> Float
    {
        return lhs * rhs
    }
    
    func Divide(lhs: Float, rhs: Float)->Float
    {
        return lhs / rhs
    }
    
    func Evaluate()
    {
        switch activeOperator
        {
        case "+":
            result = Add(lhs: leftOperand, rhs: rightOperand)
        case "-":
            result = Subtract(lhs: leftOperand, rhs: rightOperand)
        case "X":
            result = Multiply(lhs: leftOperand, rhs: rightOperand)
        case "/":
            result = Divide(lhs: leftOperand, rhs: rightOperand)
        default:
            result = 0.0
        }
        
        ResultLabel.text = String(result)
    }
    
    // Event Handlers

    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        let resultLabelText = ResultLabel.text
        
        if(!haveLeftOperand)
        {
            haveLeftOperand = true
            leftOperand = Float(resultLabelText!)!
            resultLabelReady = false
        }
        else
        {
         rightOperand = Float(resultLabelText!)!
        haveRightOperand = true
        }
        
        if(haveLeftOperand && haveRightOperand)
        {
             Evaluate()
             leftOperand = result
             rightOperand = 0.0
             resultLabelReady = false
        }
        
        switch currentInput
        {
        case "+":
            activeOperator = "+"
        case "-":
            activeOperator = "-"
        case "X":
            activeOperator = "X"
        case "/":
            activeOperator = "/"
        case "=":
            Evaluate()
        default:
            print("")
        }
        
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        let resultLabelText = ResultLabel.text
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
            if((resultLabelText == "0") || (!resultLabelReady))
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
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        switch currentInput {
        case "C":
            ResultLabel.text = "0"
            result = 0.0
            leftOperand = 0.0
            rightOperand = 0.0
            haveLeftOperand = false
            haveRightOperand = false
            activeOperator = ""
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

