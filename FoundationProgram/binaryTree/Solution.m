//
//  Solution.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import "Solution.h"

@implementation Solution
+ (TreeNode *)createBinaryTreeByPreorder:(NSMutableArray *)preorder andInorde:(NSMutableArray *)inorder {
    NSInteger len = preorder.count;
    return [Solution doCreateBinaryTreeByPreorder:preorder andInorde:inorder withPreLeft:0 andPreRight:len - 1 andInLeft:0 andInRight:len - 1];
}

/// 真正进行处理
/// @param preorder 前序
/// @param inorder 中序
/// @param preLeft 前序左下标
/// @param preRight 前序右下标
/// @param inLeft 中序左下标
/// @param inRight 中序右下标
+ (TreeNode *)doCreateBinaryTreeByPreorder:(NSMutableArray *)preorder andInorde:(NSMutableArray *)inorder withPreLeft:(NSInteger)preLeft andPreRight:(NSInteger)preRight andInLeft:(NSInteger)inLeft andInRight:(NSInteger)inRight {
    if (preLeft >= preorder.count) return NULL;
    NSInteger rootIdx = preLeft;
    NSInteger rootVal = [preorder[rootIdx] integerValue];
    TreeNode *root = [[TreeNode alloc] initWithVal:rootVal];
    if (preLeft >= preRight) {
        return root;
    }
    NSInteger findIdx = -1;
    // 找到中点在中序的位置
    for (NSInteger i = inLeft; i <= inRight; i++) {
        if (rootVal == [inorder[i] integerValue]) {
            findIdx = i;
            break;
        }
    }
    // 左子树的长度
    NSInteger leftLen = findIdx - inLeft;
    // 右子树的长度
    // NSInteger rightLen = inRight - findIdx;
    TreeNode *left = [Solution doCreateBinaryTreeByPreorder:preorder andInorde:inorder withPreLeft:preLeft + 1 andPreRight:preLeft + leftLen - 1 andInLeft:inLeft andInRight:inLeft + leftLen - 1];
    TreeNode *right = [Solution doCreateBinaryTreeByPreorder:preorder andInorde:inorder withPreLeft:preLeft + 1 + leftLen andPreRight:preRight andInLeft:findIdx + 1 andInRight:inRight];
    root.left = left;
    root.right = right;
    return root;
}
@end
