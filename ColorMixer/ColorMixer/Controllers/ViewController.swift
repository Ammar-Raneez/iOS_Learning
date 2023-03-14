//
//  ViewController.swift
//  ColorMixer
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets + Variables
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var valuesLabel: UILabel!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    var red: Float = 0
    var green: Float = 0
    var blue: Float = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting the initial value of the sliders in the storyboard as the current value
        red = redSlider.value
        green = greenSlider.value
        blue = blueSlider.value

        // Setting the color of the UIView
        valuesLabel.text = "Red: \(Int(red)), Green: \(Int(green)), Blue: \(Int(blue))"
        let color = UIColor(
            red: CGFloat(red/255),
            green: CGFloat(green/255),
            blue: CGFloat(blue/255),
            alpha: 1
        )

        colorView.backgroundColor = color
    }


    /// Using `Tags` of a UIView to identify the slider and change the color of the UIView accordingly
    /// - Parameter sender: UISlider invoking the action
    @IBAction func didChangeSlider(_ sender: UISlider) {
        let tag = sender.tag // Getting the tag from the UISlider
        if tag == 1 {
            self.red = sender.value
        } else if tag == 2 {
            self.green = sender.value
        } else {
            self.blue = sender.value
        }

        let color = UIColor(
            red: CGFloat(self.red/255),
            green: CGFloat(self.green/255),
            blue: CGFloat(self.blue/255),
            alpha: 1
        )

        colorView.backgroundColor = color
        print("Color: \(color)")
        valuesLabel.text = "Red: \(Int(red)), Green: \(Int(green)), Blue: \(Int(blue))"
    }
}

