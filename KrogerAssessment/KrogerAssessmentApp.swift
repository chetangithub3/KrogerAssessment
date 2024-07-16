//
//  KrogerAssessmentApp.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import SwiftUI

@main
struct KrogerAssessmentApp: App {
    @StateObject var viewModel = UserViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView().environmentObject(viewModel)
            }
         
        }
    }
}
