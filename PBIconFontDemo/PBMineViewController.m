//
//  PBMineViewController.m
//  PBIconFontDemo
//
//  Created by hu jiaju on 15/8/6.
//  Copyright (c) 2015年 hu jiaju. All rights reserved.
//

#import "PBMineViewController.h"
#import "UIImage+PBIconfont.h"

@interface PBMineViewController ()

@end

@implementation PBMineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //tabbar item image
        UIImage *image_n = [UIImage imageWithIconInfo:PBIconInfoMake(PBIconName_tabFounate, PBIconSize_tab, PBIconColor_tab_normal)];
        UIImage *image_s = [UIImage imageWithIconInfo:PBIconInfoMake(PBIconName_tabFounate, PBIconSize_tab, PBIconColor_tab_select)];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"second" image:image_n selectedImage:image_s];
        [self setTabBarItem:item];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
