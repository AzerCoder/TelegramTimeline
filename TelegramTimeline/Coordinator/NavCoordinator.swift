//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by A'zamjon Abdumuxtorov on 24/06/25.
//

import SwiftUI
import Combine

class NavCoordinator<CoordinatorPage: Coordinatable>:ObservableObject {
    
    @Published var path:NavigationPath = NavigationPath()
    @Published var sheet:CoordinatorPage?
    @Published var fullScreen:CoordinatorPage?
    
    enum PushType{
        case link
        case sheet
        case fullScreen
    }
    
    enum PopType{
        case link(last: Int)
        case sheet
        case fullScreen
    }
    
    func push(_ page:CoordinatorPage, type:PushType = .link){
        switch type {
        case .link:
            path.append(page)
        case .sheet:
            sheet = page
        case .fullScreen:
            fullScreen = page
        }
    }
    
    func pop(_ type:PopType = .link(last: 1)){
        switch type {
        case .link(let last):
            path.removeLast(last)
        case .sheet:
            sheet = nil
        case .fullScreen:
            fullScreen = nil
        }
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
}
