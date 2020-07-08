//
//  WinnersTableViewController.swift
//  CampeosDaCopa
//
//  Created by EPR Exatron on 08/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = [] //vai montar o json

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 144
        loadWorldCups()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorldCupViewController
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row] // devolve qual é o indexpath da linha selecionada da nossa tabela
        vc.worldCup = worldCup
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)
        let jsonData = try! Data(contentsOf: fileURL!)
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source

    //quantas secoes a tableview vai ter
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    
    //quantas linhas cada secao vai ter
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCups.count //quantidade de items do json
    }

    //metodo que apresenta uma celula na tabela. prepara uma celula e retorna o indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell

        // Configure the cell...
            let worldCup = worldCups[indexPath.row]
            cell.prepare(with: worldCup)
            
        /*
             List basic, imagem, titulo e subtitulo
        //acessa o titulo da celula
        cell.textLabel?.text = "Copa \(worldCup.year) - \(worldCup.country)"
       //acessa o subtitulo da celula
        cell.detailTextLabel?.text = "\(worldCup.winner) vs \(worldCup.vice)"
        // setar imagem
            cell.imageView?.image = UIImage(named: "\(worldCup.winner).png")
             */
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
