//
//  Son.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/8/25.
//

#import "Son.h"

@implementation Son
- (void) setAge:(NSUInteger) a {
    age = a;
}
- (void) setName:(NSString*) yourName {
    name = yourName;
    NSLog(@"Son - setName");
    NSLog(@"self ' class is %@", [self class]);
}
- (void) setName:(NSString*) yourName andAge:(NSUInteger) age {
    [self setAge:age];
    [self setName:yourName];
    [super setName:yourName];
    NSLog(@"self ' class is %@", [self class]);
    NSLog(@"super' class is %@", [super class]);  
}
@end
