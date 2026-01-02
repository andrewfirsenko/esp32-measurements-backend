//
//  Measurement+Migration.swift
//  App
//
//  Created by Andrew on 01.01.2026.
//

import Fluent

extension Measurement {
    struct Migration: AsyncMigration {
        func prepare(on database: any Database) async throws {
            try await database.schema(Measurement.schema)
                .id()
                .field("device_id", .string, .required)
                .field("date", .double, .required)
                .field("temperature", .double)
                .field("humidity", .double)
                .field("pressure", .int)
                .create()
        }
        
        func revert(on database: any Database) async throws {
            try await database.schema(Measurement.schema).delete()
        }
    }
}
