//
//  Father.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/8/25.
//

#import "Father.h"

@implementation Father
- (void) setName:(NSString*) yourName {
    name = yourName;
    NSLog(@"Father - setName");
    NSLog(@"super ' class is %@", [super class]);
}

@end
