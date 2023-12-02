import Foundation
import Combine

protocol NotesRepository {
    func fetchNotes() async -> [Note]
    func persist(notes: [Note]) async
}

class NotesRepositoryImpl: NotesRepository {
    init() {}
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
            .appendingPathComponent("notes.data")
    }

    func load() async throws -> [Note] {
        let fileURL = try Self.fileURL()
        let data = try Data(contentsOf: fileURL)
        let decodedNotes = try JSONDecoder().decode([Note].self, from: data)
        return decodedNotes
    }

    func save(notes: [Note]) async throws {
        let fileURL = try Self.fileURL()
        let data = try JSONEncoder().encode(notes)
        try data.write(to: fileURL)
        print("SAVE SUCCESS")
    }

    func persist(notes: [Note]) async {
        try? await save(notes: notes)
    }

    func fetchNotes() async -> [Note] {
        do {
            return try await load()
        }
        catch {
            return []
        }
    }
}
