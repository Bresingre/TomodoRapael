//
//  TOMODARAPAELApp.swift
//  TOMODARAPAEL
//
//  Created by vieux-melchior victor on 06/03/2024.
//

import SwiftUI

@main
struct TOMODARAPAELApp: App {
    var body: some Scene {
        WindowGroup {
            TomodoRapael()
                .environmentObject(TaskViewModel())
        }
    }
}
