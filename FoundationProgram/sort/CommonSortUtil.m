//
//  CommonSortUtil.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/24.
//

#import "CommonSortUtil.h"

@implementation CommonSortUtil

/// 堆排序
/// @param arr 数组
+ (void)heapSort:(NSMutableArray *)arr {
    [CommonSortUtil doHeapSort:arr];
}
+ (void)doHeapSort:(NSMutableArray *)arr {
    NSInteger len = arr.count;
    NSInteger begin = len / 2 - 1;
    for (NSInteger i = begin; i >= 0; i--) {
        // 从第一个叶子节点开始进行大顶堆化
        [CommonSortUtil maxHeapify:arr withIdx:begin withRight:len - 1];
    }
    // 将根节点，也就是最大的放到最后
    for (NSInteger i = len - 1; i > 0; i--) {
        [CommonSortUtil swap:arr x:0 y:i];
        // 再次进行堆化
        [CommonSortUtil maxHeapify:arr withIdx:0 withRight:i - 1];
    }
}
+ (void)maxHeapify:(NSMutableArray *)arr withIdx:(NSInteger)idx withRight:(NSInteger)right {
    NSInteger lidx = idx * 2 + 1;
    NSInteger ridx = idx * 2 + 2;
    // 假设lidx此时是最大的
    NSInteger maxIdx = lidx;
    // 越界
    if (lidx > right) return;
    // 要保证ridx也不越界才能处理
    if (ridx < right && [arr[ridx] integerValue] > [arr[lidx] integerValue]) {
        maxIdx = ridx;
    }
    if ([arr[maxIdx] integerValue] > [arr[idx] integerValue]) {
        // 与最大的下标交换位置
        [CommonSortUtil swap:arr x:maxIdx y:idx];
        // 此时maxIdx的值换了，需要继续递归处理，检查被替换的节点是否在子树中需要被替换
        [CommonSortUtil maxHeapify:arr withIdx:maxIdx withRight:right];
    }
}
+ (void)swap:(NSMutableArray *)arr x:(NSInteger)x y:(NSInteger)y {
    NSInteger c = [arr[x] integerValue];
    arr[x] = arr[y];
    arr[y] = @(c);
}

/// 选择排序
/// @param arr 数组
+ (void)selectSort:(NSMutableArray *)arr {
    [CommonSortUtil doSelectSort:arr];
}
+ (void)doSelectSort:(NSMutableArray *)arr {
    NSInteger index = 0;
    NSInteger min = 0;
    for (NSInteger i = 0; i < arr.count - 1; i++) {
        // 假设当前i是最小的
        index = i;
        min = [arr[i] integerValue];
        for (NSInteger j = i; j < arr.count; j++) {
            // 找到实际上最小的，放在i的位置
            if (min > [arr[j] integerValue]) {
                min = [arr[j] integerValue];
                index = j;
            }
        }
        if (index != i) {
            arr[index] = arr[i];
            arr[i] = @(min);
        }
    }
}

/// 快排
/// @param arr 数组
+ (void)quickSort:(NSMutableArray *)arr {
    [CommonSortUtil doQuickSelect:arr withLeft:0 andRight:arr.count - 1];
}
+ (void)doQuickSelect:(NSMutableArray *)arr withLeft:(NSInteger)left andRight:(NSInteger)right {
    if (left >= right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [arr[i] integerValue];
    while (i < j) {
        // 从右边开始找比key小的数，最开始的时候i的位置放的是key
        while (i < j && [arr[j] integerValue] >= key) {
            j--;
        }
        arr[i] = arr[j];
        // 从左边开始找比key大的数，放到j的位置，此时的j是比key小的数
        while (i < j && [arr[i] integerValue] <= key) {
            i++;
        }
        arr[j] = arr[i];
    }
    arr[i] = @(key);
    [CommonSortUtil doQuickSelect:arr withLeft:left andRight:i - 1];
    [CommonSortUtil doQuickSelect:arr withLeft:i + 1 andRight:right];
}

@end
