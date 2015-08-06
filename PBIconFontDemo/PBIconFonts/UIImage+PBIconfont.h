//
//  UIImage+PBIconfont.h
//  PBIconFontDemo
//
//  Created by hu jiaju on 15/8/6.
//  Copyright (c) 2015年 hu jiaju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBIconConstant.h"

#define PBIconInfoMake(x,y,z) [PBIconInfo iconInfoWithName:x size:y color:z]

@interface PBIconFont : NSObject

/**
 *	@brief	make font with name
 *
 *	@return	Font instance
 */
+ (UIFont *)fontWithSize: (CGFloat)size;

/**
 *	@brief	set font with name
 *
 *	@param 	fontName 	the font's name
 */
+ (void)setFontName:(NSString *)fontName;


@end

@interface PBIconInfo : NSObject

/**
 *	@brief	make the font info struct
 *
 *	@param 	name 	font's name
 *	@param 	size 	font's size
 *	@param 	color 	font's color
 *
 *	@return	the font's instance
 */
+ (instancetype)iconInfoWithName:(NSString *)name size:(CGFloat )size color:(UIColor *)color;


@end

@interface UIImage (PBIconfont)

/**
 *	@brief	generate UIImage instance by iconinfo
 *
 *	@param 	info 	the icon's info
 *
 *	@return	UIImage instance
 */
+ (UIImage *)imageWithIconInfo:(PBIconInfo *)info;


@end
