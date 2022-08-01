//
//  ByteDancer.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ByteDancer : NSObject
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithAge: (int)age;
+ (void)sayHello;
- (int)add: (int)num;
@end

NS_ASSUME_NONNULL_END
