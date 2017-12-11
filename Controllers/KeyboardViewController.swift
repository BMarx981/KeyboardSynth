//
//  KeyboardViewController.swift
//  KeyboardSynth
//
//  Created by Marx, Brian on 12/7/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit
import AudioKit

class KeyboardViewController: UITableViewController, SynthModelDelegate {
    
    var attack = 0.0
    var decay = 0.0
    var sustain = 0.0
    var release = 0.0

    var synthModel = SynthModel()

    func didHitKey(_ synthModel: SynthModel, at index: IndexPath) {
        synthModel.playKey(noteNum: getFrequencyForKey(with: index))
        print(synthModel.attack)
    }
    
    func didStopKey(_ synthModel :SynthModel, at index: IndexPath) {
        synthModel.stopKey()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        synthModel.attack = attack
        synthModel.decay = decay
        synthModel.sustain = sustain
        synthModel.release = release
        print(synthModel.attack)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 16
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "key", for: indexPath)
        cell.backgroundColor = getKeyColor(for: indexPath.row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        didHitKey(synthModel, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        didStopKey(synthModel, at: indexPath)
    }
    
    func getKeyColor(for index: Int) -> UIColor {
        var color = UIColor()
        switch index {
        case 0: color = UIColor.white //c
        case 1: color = UIColor.white //b
        case 2: color = UIColor.black //b flat
        case 3: color = UIColor.white //a
        case 4: color = UIColor.black //a flat
        case 5: color = UIColor.white //g
        case 6: color = UIColor.black //g flat
        case 7: color = UIColor.white //f
        case 8: color = UIColor.white //e
        case 9: color = UIColor.black //e flat
        case 10: color = UIColor.white //d
        case 11: color = UIColor.black //d flat
        case 12: color = UIColor.white //c
        case 13: color = UIColor.white //b
        case 14: color = UIColor.black //b flat
        case 15: color = UIColor.white //a
        default: color = UIColor.white
        }
        return color
    }
    
    func getFrequencyForKey(with indexPath: IndexPath) -> Double {
        var freq = 0.0
        switch indexPath.row {
        case 0: freq = 277.182
        case 1: freq = 261.626
        case 2: freq = 246.942
        case 3: freq = 233.082
        case 4: freq = 220.000
        case 5: freq = 207.652
        case 6: freq = 195.998
        case 7: freq = 184.997
        case 8: freq = 174.614
        case 9: freq = 164.814
        case 10: freq = 155.563
        case 11: freq = 146.832
        case 12: freq = 138.591
        case 13: freq = 130.813
        case 14: freq = 123.471
        case 15: freq = 116.541
        default: freq = 0
        }
        return freq
    }
    
    func getNoteNum(with indexPath: IndexPath) -> Int {
        var freq = 0
        switch indexPath.row {
        case 0: freq = 61
        case 1: freq = 60
        case 2: freq = 59
        case 3: freq = 58
        case 4: freq = 57
        case 5: freq = 56
        case 6: freq = 55
        case 7: freq = 54
        case 8: freq = 53
        case 9: freq = 52
        case 10: freq = 51
        case 11: freq = 50
        case 12: freq = 49
        case 13: freq = 48
        case 14: freq = 47
        case 15: freq = 46
        default: freq = 0
        }
        return freq
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
