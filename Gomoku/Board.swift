enum Player{
    case Black
    case White
    case Empty
}

class SpaceOccupied : Error {
    
}

class BadLocation : Error {
    
}

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(row: Int, column: Int, player: Player) throws {
        let loc = try makeLocation(row: row, column: column)
        if (placedStones[loc] != nil){
            throw SpaceOccupied()
        }
        placedStones[loc] = player
    }
    
    func makeLocation(row: Int, column: Int) throws -> Int {
        if (row < 0 || row  >= WIDTH || column < 0 || column >= HEIGHT){
            throw BadLocation()
        }
        return column * WIDTH + row
    }
    
    func get(row: Int, column: Int) throws -> Player {
        let loc = try makeLocation(row: row, column: column)
        if let stone = placedStones[loc]{
            return stone
        }
        else {
            return .Empty
        }
    }
    
}
