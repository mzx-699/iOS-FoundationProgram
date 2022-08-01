//
//  TreeNode.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import "TreeNode.h"

@implementation TreeNode
- (instancetype)initWithVal:(NSInteger)val andLeft:(TreeNode *)left andRight:(TreeNode *)right {
    if (self = [super init]) {
        _val = val;
        _left = left;
        _right = right;
    }
    return self;
}
- (instancetype)initWithVal:(NSInteger)val {
    if (self = [super init]) {
        _val = val;
    }
    return self;
}
- (void)description
{
    NSLog(@"%ld", self.val);
    if (self.left != NULL) {
        [self.left description];
    }
    if (self.right != NULL) {
        [self.right description];
    }
}
@end
