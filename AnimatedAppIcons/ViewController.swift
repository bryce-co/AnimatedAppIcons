//
//  ViewController.swift
//  AnimatedAppIcons
//
//  Created by Bryce Bostwick on 5/25/24.
//

import UIKit

class ViewController: UIViewController {

    // An `IconAnimator` that runs at 30fps on the main thread
    let iconAnimator = IconAnimator(
        numberOfFrames: 30,
        numberOfLoops: 5,
        targetFramesPerSecond: 30,
        shouldRunOnMainThread: true
    )

    // A button to start the animation
    lazy var startButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        button.setTitle("Start Animation (in 3 seconds)", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // A background task to keep our app alive while we're animating
    var backgroundTask: UIBackgroundTaskIdentifier? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc
    private func buttonTapped() {
        backgroundTask = UIApplication.shared.beginBackgroundTask()

        DispatchQueue.main.asyncAfter(deadline: .now () + .seconds(3)) {
            self.startAnimation()
        }
    }

    private func startAnimation() {
        // Start the animation
        iconAnimator.startAnimation() { [weak self] in
            // Once the animation is complete,
            // end our background task so that iOS knows
            // that our app has finished its work
            if let backgroundTask = self?.backgroundTask {
                UIApplication.shared.endBackgroundTask(backgroundTask)
            }
            self?.backgroundTask = nil
        }

    }

}

