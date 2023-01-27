import Foundation
import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: HomeView(model: memesVM))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    // MARK: Private
    
    private let memesVM = MemesVM(service: MemeService())
}


