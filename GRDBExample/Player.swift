//
//  Player.swift
//  GRDBExample
//
//  Created by Prof. Dr. Nunkesser, Robin on 03.07.23.
//

import Foundation
import GRDB

struct Player: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var score: Int
}
