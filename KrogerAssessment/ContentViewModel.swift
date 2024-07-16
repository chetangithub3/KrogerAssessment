//
//  ContentViewModel.swift
//  KrogerAssessment
//[2:34 PM] Timothy Ayodele (External)
//timothy.ayodele@experis.com
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import Foundation
import Combine
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()
    @Published var loadingState: LoadingState = .none

    init() {
        loadUsers()
    }

    func loadUsers() {
        apiService.loadJSON(filename: "data", type: [User].self)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                        self.loadingState = .failure(error)
                        break
                }
            }, receiveValue: { [weak self] users in
                guard let self = self else { return }
                self.loadingState = .success
                self.users = users
            })
            .store(in: &cancellables)
    }
}
