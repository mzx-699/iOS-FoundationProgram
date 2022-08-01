//
//  ByteDancer.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import "ByteDancer.h"
@interface ByteDancer ()
@property (nonatomic, assign) int age;
@end

@implementation ByteDancer
+ (void)sayHello {
    NSLog(@"hello");
}
- (instancetype)initWithAge:(int)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}
- (int)add:(int)num {
    return self.age + num;
}
@end
