import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    
    override func setUp(){
        super.setUp()
        board = Board()
    }
    
    func testBoardCanBeCreated(){
        let stones = board.stonesPlaced()
        XCTAssertEqual(0,stones)
    }
    
    func testOneWhiteStoneCanBeAddedToBoard() throws {
        let row = 1
        let col = 1
        let player = Player.White
        try board.place(row: row, column: col, player: player)
        
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = board.get(row: row, column: col)
        XCTAssertEqual(Player.White, placedStone)
        
    }
    
    func testKnowsAboutEmptyIntersections() throws{
        XCTAssertEqual(Player.Empty, board.get(row: 0, column: 1))
        try board.place(row: 0, column: 1, player: Player.White)
         XCTAssertEqual(Player.White, board.get(row: 0, column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(row: 0, column: 0, player: Player.White)
        XCTAssertThrowsError(try board.place(row: 0, column: 0, player: Player.Black))
        
    }
}

