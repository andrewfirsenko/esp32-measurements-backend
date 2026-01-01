//
//  Run.swift
//  Run
//
//  Created by Andrew on 01.01.2026.
//

import App
import Vapor

@main
struct Run {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        
        let app = try await Application.make(env)
        app.directory.workingDirectory = DirectoryConfiguration.detect().workingDirectory
        
        try await configure(app)
        try await app.execute()
        
        try await app.asyncShutdown()
    }
}
