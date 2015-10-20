//
//  FitToFastTests.m
//  FitToFastTests
//
//  Created by Pimpaporn Chaichompoo on 5/29/2558 BE.
//  Copyright (c) 2558 Pimpaporn Chaichompoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LoginController.h"

@interface FitToFastTests : XCTestCase
@end

@implementation FitToFastTests
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testlogin
{
    LoginController *login = [LoginController alloc];
    Boolean *boolean = [login login:@"552115052" password:@"552115052"];
    XCTAssertTrue(boolean, @"Pass");
}

@end
