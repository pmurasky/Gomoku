enum Player{
    case Black
    case White
    case Empty
}

class SpaceOccupied : Error {
    
}

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    
    var stones = 0
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return stones
    }
    
    func place(row: Int, column: Int, player: Player) throws {
        stones += 1
        let loc = makeLocation(row: row, column: column)
        if (placedStones[loc] != nil){
            throw SpaceOccupied()
        }
        placedStones[loc] = player
    }
    
    func makeLocation(row: Int, column: Int) -> Int {
        return column * WIDTH + row
    }
    
    func get(row: Int, column: Int) -> Player {
        let loc = makeLocation(row: row, column: column)
        if let stone = placedStones[loc]{
            return stone
        }
        else {
            return .Empty
        }
    }
    
}
