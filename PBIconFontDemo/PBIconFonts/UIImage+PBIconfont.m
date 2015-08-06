//
//  UIImage+PBIconfont.m
//  PBIconFontDemo
//
//  Created by hu jiaju on 15/8/6.
//  Copyright (c) 2015年 hu jiaju. All rights reserved.
//

#import "UIImage+PBIconfont.h"
#import <CoreText/CoreText.h>

#pragma mark -- PBIconFont --

@interface PBIconFont ()

@end

static NSString *_fontName;

@implementation PBIconFont

/**
 *	@brief	register font into the system draw system
 *
 *	@param 	url 	font's file url
 */
+ (void)registerFontWithURL:(NSURL *)url {

    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

+ (UIFont *)fontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:[self fontName] size:size];
    if (font == nil) {
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:[self fontName] withExtension:@"ttf"];
        [self registerFontWithURL: fontFileUrl];
        font = [UIFont fontWithName:[self fontName] size:size];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
}

+ (void)setFontName:(NSString *)fontName {
    _fontName = fontName;
}

+ (NSString *)fontName {
    return _fontName ? : @"iconfont";
}

@end

#pragma mark -- PBIconInfo --

@interface PBIconInfo ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, strong) UIColor *color;

@end

@implementation PBIconInfo

- (instancetype)initWithName:(NSString *)name size:(NSInteger)size color:(UIColor *)color {
    if (self = [super init]) {
        self.name = name;
        self.size = size;
        self.color = color;
    }
    return self;
}

+ (instancetype)iconInfoWithName:(NSString *)name size:(CGFloat )size color:(UIColor *)color {
    return [[PBIconInfo alloc] initWithName:name size:size color:color];
}

@end

#pragma mark -- UIImage IconFont Helper --

@implementation UIImage (PBIconfont)

+ (UIImage *)imageWithIconInfo:(PBIconInfo *)info {
    CGFloat size = info.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = [PBIconFont fontWithSize:realSize];
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ([info.name respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [info.name drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: info.color}];
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, info.color.CGColor);
        [info.name drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
