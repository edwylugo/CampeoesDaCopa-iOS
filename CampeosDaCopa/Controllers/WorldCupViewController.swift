//
//  WorldCupViewController.swift
//  CampeosDaCopa
//
//  Created by EPR Exatron on 08/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    var worldCup: WorldCup!
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WorldCup \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }

}

//Protocolo DataSource, responsavel por carregar os dados
extension WorldCupViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        //fase de grupos
        let match = worldCup.matches[indexPath.section]
        let game = match.games [indexPath.row]
            
        cell.prepare(with: game)
        
        return cell
    }
    
}

extension WorldCupViewController: UITableViewDelegate {
    
}
