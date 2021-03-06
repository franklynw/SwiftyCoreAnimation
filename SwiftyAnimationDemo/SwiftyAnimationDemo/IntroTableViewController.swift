//
//  IntroTableViewController.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 15/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit

class IntroTableViewController: UITableViewController {

    private struct Demo {
        let name: String
        let info: String
        let segueName: String
    }

    private let demos: [Demo] = [
        Demo(name: "Hello!", info: "Some fun animations using animation descriptors", segueName: "hello"),
        Demo(name: "Groups & Actions", info: "Adding animation groups & actions", segueName: "action"),
        Demo(name: "Begin & End Actions", info: "Using begin & end actions", segueName: "beginEnd"),
        Demo(name: "Random Stuff", info: "Other stuff of interest", segueName: "random")
    ]


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.demos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let demo = self.demos[indexPath.row]

        cell.textLabel?.text = demo.name
        cell.detailTextLabel?.text = demo.info

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let demo = self.demos[indexPath.row]
        let segueIdentifier = demo.segueName
        self.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
