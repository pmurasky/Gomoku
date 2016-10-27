import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    
    func verifyBoardCanBeCreated(){
        var board = Board()
        let stones = board.stonesPlaced()
        XCTAssertEqual(0,stones)
    }
    
    func testCanAddOneStone() {
        var board = Board()
        let row = 1
        let col = 1
        let player = Player.White
        board.add(row: row, column: col, player: player)
        
        XCTAssertEqual(1, board.stonesPlaced())
    }
    

}
