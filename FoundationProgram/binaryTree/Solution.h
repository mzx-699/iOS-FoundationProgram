//
//  Solution.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
NS_ASSUME_NONNULL_BEGIN
/**
 NSMutableArray *preorder = [NSMutableArray arrayWithArray:@[@2, @1, @4, @6]];
 NSMutableArray *inorder = [NSMutableArray arrayWithArray:@[@4, @1, @6, @2]];
 TreeNode *root = [Solution createBinaryTreeByPreorder:preorder andInorde:inorder];
 [root description];
 */
@interface Solution : NSObject
+ (TreeNode *)createBinaryTreeByPreorder:(NSMutableArray *)preorder andInorde:(NSMutableArray *)inorder;
@end

NS_ASSUME_NONNULL_END
