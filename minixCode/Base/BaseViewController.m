//
//  BaseViewController.m
//  Leisure
//
//  Created by hl on 16/3/28.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [_leftButton setImage:[UIImage imageNamed:@"399-list1"] forState:(UIControlStateNormal)];
    self.leftButton.frame = CGRectMake(0, 0, 40, 70);
    
//    [_leftButton setBackgroundColor:[UIColor blueColor]];
//    self.leftButton.
  
    
    // Do any additional setup after loading the view from its nib.
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
