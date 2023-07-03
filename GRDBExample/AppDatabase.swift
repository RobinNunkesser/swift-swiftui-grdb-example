//
//  AppDatabase.swift
//  GRDBExample
//
//  Created by Prof. Dr. Nunkesser, Robin on 03.07.23.
//

import Foundation
import GRDB

struct AppDatabase {
    
    static let shared = makeShared()
    
    private static func makeShared() -> AppDatabase {
        do {
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(
                for: .applicationSupportDirectory, in: .userDomainMask,
                appropriateFor: nil, create: true)
            let databaseURL = appSupportURL.appendingPathComponent("db.sqlite")
            NSLog("Database stored at \(databaseURL.path)")
            let dbQueue = try DatabaseQueue(path: databaseURL.path)
            
            try dbQueue.write { db in
                try db.create(table: "player") { t in
                    t.primaryKey("id", .text)
                    t.column("name", .text).notNull()
                    t.column("score", .integer).notNull()
                }
            }
                        
            let appDatabase = try AppDatabase(dbQueue)
            return appDatabase
        } catch {
            fatalError("Unresolved error \(error)")
        }
    }
    
    init(_ dbWriter: any DatabaseWriter) throws {
        self.dbWriter = dbWriter        
    }
    
    private let dbWriter: any DatabaseWriter
    
    func savePlayer(_ player: Player)  throws {        
        try dbWriter.write { db in
            try player.insert(db)
        }
    }
    
    func fetchAllPlayers() throws -> [Player] {
        return try dbWriter.read { db in
            try Player.fetchAll(db)
        }        
    }
}
