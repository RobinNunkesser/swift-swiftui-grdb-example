//
//  GRDBExampleApp.swift
//  GRDBExample
//
//  Created by Prof. Dr. Nunkesser, Robin on 03.07.23.
//

import SwiftUI

@main
struct GRDBExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.appDatabase, .shared)
        }
    }
}

private struct AppDatabaseKey: EnvironmentKey {
    static var defaultValue: AppDatabase { .shared }
}

extension EnvironmentValues {
    var appDatabase: AppDatabase {
        get { self[AppDatabaseKey.self] }
        set { self[AppDatabaseKey.self] = newValue }
    }
}
