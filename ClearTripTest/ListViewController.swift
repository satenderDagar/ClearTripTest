//
//  ViewController.swift
//  ClearTripTest
//
//  Created by Satender Dagar on 30/09/23.
//

import UIKit
import AVKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let urlStr = "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = URL(string: urlStr) else {
            // TODO: HANDLE ERRORS
            return
        }
        play(from: url)
    }
    
    func play(from url:URL) {
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player

        present(playerController, animated: true) {
            playerController.player?.play()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

