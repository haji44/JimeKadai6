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

    private let minimumValue = 1
    private let maximumValue = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = Float(minimumValue)
        slider.maximumValue = Float(maximumValue)

        resetGame()
    }

    @IBAction private func judgeButtonTapped(_ sender: UIButton) {
        showAlert(isTrue: Int(slider.value) == targetValue, value: Int(slider.value))
    }

    private func resetGame() {
        targetValue = Int.random(in: minimumValue...maximumValue)
        resultLabel.text = "\(targetValue)"
        slider.value = Float((minimumValue + maximumValue) / 2)
    }
}

extension ViewController {
    func showAlert(isTrue: Bool, value: Int) {
        let message = "あなたの値: \(value)"
        let firstLine = isTrue ? "あたり!" : "はずれ!"
        let alert = UIAlertController(title: "結果",
                                      message: "\(firstLine)\n\(message)",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            self?.resetGame()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
