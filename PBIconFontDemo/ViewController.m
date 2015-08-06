//
//  ViewController.m
//  PBIconFontDemo
//
//  Created by hu jiaju on 15/8/5.
//  Copyright (c) 2015年 hu jiaju. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+PBIconfont.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //tabbar item image
        UIImage *image_n = [UIImage imageWithIconInfo:PBIconInfoMake(PBIconName_tabIndex, PBIconSize_tab, PBIconColor_tab_normal)];
        UIImage *image_s = [UIImage imageWithIconInfo:PBIconInfoMake(PBIconName_tabIndex, PBIconSize_tab, PBIconColor_tab_select)];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"first" image:image_n selectedImage:image_s];;
        [self setTabBarItem:item];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect infoRect = CGRectMake(100, 100, 100, 50);
    UILabel *label = [[UILabel alloc] initWithFrame:infoRect];
    //label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont fontWithName:@"iconfont" size:35];
    label.text = @"\U00003432";
    [self.view addSubview:label];
    
    infoRect = CGRectMake(100, 200, PBIconSize_tab, PBIconSize_tab);
    UIImage *image = [UIImage imageWithIconInfo:PBIconInfoMake(PBIconName_tabIndex, PBIconSize_tab, PBIconColor_tab_select)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:infoRect];
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
