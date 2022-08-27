//
//  Son.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/8/25.
//

#import "Father.h"

NS_ASSUME_NONNULL_BEGIN

@interface Son : Father {
    NSUInteger age;
}
- (void) setName:(NSString*) yourName;
- (void) setAge:(NSUInteger) a;
- (void) setName:(NSString*) yourName andAge:(NSUInteger) age;  
@end

NS_ASSUME_NONNULL_END
