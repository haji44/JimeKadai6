//
//  ViewController.swift
//  JimeKadai6
//
//  Created by kitano hajime on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var slider: UISlider!
    private var targetValue = 0
    private var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

    @IBAction private func sliderValueChage(_ sender: UISlider) {
        currentValue = Int(sender.value * 100)
    }
    @IBAction private func judgeButtonTapped(_ sender: UIButton) {
        showAlert(isTrue: currentValue == targetValue, value: currentValue)
    }
    private func setupInitialState() {
        currentValue = Int(slider.value * 100)
        targetValue = Int.random(in: 1...100)
        resultLabel.text = "\(targetValue)"
    }
}

extension ViewController {
    func showAlert(isTrue: Bool, value: Int) {
        let message = "あなたの値: \(value)"
        let alert = UIAlertController(title: "結果",
                                      message: isTrue ? "あたり!\n\(message)" : "はずれ!\n\(message)",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "再挑戦", style: .default) { [weak self] value in
            guard let self = self else { return }
            self.targetValue = Int.random(in: 1...100)
            self.resultLabel.text = "\(self.targetValue)"
            self.slider.value = Float(0.5)
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
