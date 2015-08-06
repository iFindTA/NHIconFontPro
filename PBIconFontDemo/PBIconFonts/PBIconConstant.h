//
//  PBIconConstant.h
//  PBIconFontDemo
//
//  Created by hu jiaju on 15/8/6.
//  Copyright (c) 2015年 hu jiaju. All rights reserved.
//

#ifndef PBIconFontDemo_PBIconConstant_h
#define PBIconFontDemo_PBIconConstant_h

#define HEXCOLORA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define HEXCOLOR(rgbValue) HEXCOLORA(rgbValue, 1.0)

/**
 *	@brief	iconfont image names define
 */
#define PBIconName_tabIndex         @"\U00003432"
#define PBIconName_tabFounate       @"\U0000f005"

/**
 *	@brief	iconfont image sizes define
 */
#define PBIconSize_tab              30

/**
 *	@brief	iconfont image colors define
 */
#define PBIconColor_tab_normal      HEXCOLOR(0x333333)
#define PBIconColor_tab_select      HEXCOLOR(0x56abe4)

/**
 *	@brief	iconfont appreciate info maker
 */
#define PBIconAppreciate(name,size,color) PBIconInfoMake(name,size,color)

#endif
