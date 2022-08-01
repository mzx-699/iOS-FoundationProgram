//
//  TreeNode.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property (nonatomic, strong)TreeNode *left;
@property (nonatomic, strong)TreeNode *right;
@property (nonatomic, assign)NSInteger val;
- (instancetype)initWithVal:(NSInteger)val andLeft:(TreeNode *)left andRight:(TreeNode *)right;
- (instancetype)initWithVal:(NSInteger)val;
- (void)description;
@end

NS_ASSUME_NONNULL_END
