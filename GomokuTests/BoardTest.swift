import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    
    override func setUp(){
        super.setUp()
        board = Board()
    }
    
    func testBoardCanBeCreatedWithZeroStones(){
        let stones = board.stonesPlaced()
        XCTAssertEqual(0,stones)
    }
    
    func testStonesCanBeAddedToBoard() throws {
        try board.place(intersection: Intersection(1,1), player: Player.White)
        
        XCTAssertEqual(1, board.stonesPlaced())
        
        var placedStone = try board.get(row: 1, column: 1)
        XCTAssertEqual(Player.White, placedStone)
        
        try board.place(intersection: Intersection(board.WIDTH-1,board.HEIGHT-1), player: Player.Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        
        placedStone = try board.get(row: board.WIDTH-1, column: board.HEIGHT-1)
        XCTAssertEqual(Player.Black, placedStone)
        
    }
    
    func testKnowsAboutEmptyIntersections() throws{
        XCTAssertEqual(Player.Empty, try board.get(row: 0, column: 1))
        try board.place(intersection: Intersection(0,1), player: Player.White)
         XCTAssertEqual(Player.White, try board.get(row: 0, column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(intersection: Intersection(0,0), player: Player.White)
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.White))
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,-1), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH,board.HEIGHT), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,-1), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,board.WIDTH), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,0), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH,0), player: Player.White))
        
        XCTAssertEqual(0, board.stonesPlaced())
        
    }
}

