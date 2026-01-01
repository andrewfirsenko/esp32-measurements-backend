//
//  Configure.swift
//  App
//
//  Created by Andrew on 01.01.2026.
//

import Vapor
import FluentSQLiteDriver

public func configure(_ app: Application) async throws {
    app.databases.use(
        .sqlite(
            .file("esp32-measurements-db.sqlite")
        ),
        as: .sqlite
    )
    
    app.migrations.add(Measurement.Migration())
    try await app.autoMigrate()
    
    try await routes(app)
}
