//
//  main.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

void saveImage_png(NSImage *image,NSString *name){
    NSData *data = [image TIFFRepresentation];
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    CGImageRef cgimage = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithCGImage:cgimage];
    NSData *pngData = [rep representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
    [pngData writeToFile:name atomically:NO];
}
 
 
NSImage * zoom(NSImage *image,CGFloat width){
    NSImage *smallImage = [[NSImage alloc] initWithSize: CGSizeMake(width, width)];
    [smallImage lockFocus];
    [image setSize: CGSizeMake(width, width)];
    [[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
    [image drawAtPoint:NSZeroPoint fromRect:CGRectMake(0, 0, width, width) operation:NSCompositingOperationCopy fraction:1.0];
    [smallImage unlockFocus];
    return smallImage;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc!=2){
            printf("Just Need 1 argument: image_file_path\n");
            return -1;
        }
        NSString *toolpath = [NSString stringWithUTF8String:argv[0]];
        NSURL *toolURL = [NSURL URLWithString:toolpath];
        NSString *toolName = [toolURL lastPathComponent];
        NSString *file = [NSString stringWithUTF8String:argv[1]];
        if ([file isEqualToString:@"-h"]) {
            printf("Usage: %s Image_file_path\n",toolName.UTF8String);
            return 0;
        }
        if (![[NSFileManager defaultManager] fileExistsAtPath:file]) {
            printf("the file don't exists:%s\n",file.UTF8String);
            return -2;
        }
        NSURL *fileURL = [NSURL URLWithString:file];
        NSString *path = [fileURL URLByDeletingLastPathComponent].path;
        NSString *name=[[fileURL URLByDeletingPathExtension] lastPathComponent];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:file];
        NSArray *arr = @[@40, @60, @58, @87, @80, @120, @180, @20, @40, @29, @58, @76, @152, @167, @1024];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat size = [obj floatValue] / 2;
            NSImage *small = zoom(image, size);
            NSString *savePath = [NSString stringWithFormat:@"%@/%@_%.0fx%.0f.png",path,name,size*2,size*2];
            NSURL *saveURL = [NSURL URLWithString:savePath];
            printf("create: %s\n",saveURL.lastPathComponent.UTF8String);
            saveImage_png(small, savePath);
        }];
//        for (int i=8; i<1024; i=i*2) {
//            NSImage *small = zoom(image, i);
//            NSString *savePath = [NSString stringWithFormat:@"%@/%@_%dx%d.png",path,name,i*2,i*2];
//            NSURL *saveURL = [NSURL URLWithString:savePath];
//            printf("create: %s\n",saveURL.lastPathComponent.UTF8String);
//            saveImage_png(small, savePath);
//        }
    }
    return 0;
}
