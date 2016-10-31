enum Player{
    case Black
    case White
    case Empty
}

class SpaceOccupied : Error {
    
}

class BadLocation : Error {
    
}

typealias Intersection = (row: Int, column: Int)

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(intersection: Intersection, player: Player) throws {
        let loc = try makeLocation(intersection: intersection)
        if (placedStones[loc] != nil){
            throw SpaceOccupied()
        }
        placedStones[loc] = player
    }
    
    func makeLocation(intersection: Intersection) throws -> Int {
        if (intersection.row < 0 || intersection.row  >= WIDTH || intersection.column < 0 || intersection.column >= HEIGHT){
            throw BadLocation()
        }
        return intersection.column * WIDTH + intersection.row
    }
    
    func get(intersection: Intersection) throws -> Player{
        let loc = try makeLocation(intersection: intersection)
        if let stone = placedStones[loc]{
            return stone
        }
        else {
            return .Empty
        }
    }
    
}
