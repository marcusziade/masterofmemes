import Combine
import Foundation

@MainActor final class MemesVM: ObservableObject {
    
    enum State {
        case loading
        case result(memes: [Meme])
        case error(message: String)
    }
    
    @Published private(set) var state: State = .loading
    @Published var searchQuery: String = ""
    
    init(service: MemeService) {
        self.service = service
        
        Task { await memes() }
        
        $searchQuery
            .dropFirst()
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { [unowned self] query -> [Meme] in
                return query.isEmpty ? memes : memes.filter { $0.name.contains(query) }
            }
            .sink { [unowned self] memes in
                state = .result(memes: memes)
            }
            .store(in: &cancellables)
    }
    
    // MARK: Private
    
    private let service: MemeService
    
    private var memes: [Meme] = []

    private var cancellables = Set<AnyCancellable>()
    
    @MainActor private func memes() async {
        state = .loading
        do {
            memes = try await service.memes()
            state = .result(memes: memes)
        } catch let error as HTTPError {
            state = .error(message: error.caption)
        } catch {
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: MemesVM {
        let vm = MemesVM(service: MemeService())
        vm.state = .result(memes: MemeService().memesResponseMock.memes)
        return vm
    }
}


