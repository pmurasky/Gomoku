enum Player{
    case White
}

class Board {
    var stones = 0
    
    func stonesPlaced() -> Int {
        return stones
    }
    
    func add(row: Int, column: Int, player: Player){
        stones += 1
    }
}
