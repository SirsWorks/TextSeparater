//
//  ViewController.m
//  TF
//
//  Created by pangpangpig-Mac on 2017/10/24.
//  Copyright © 2017年 _Doctor. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+TextSeparater.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *testTF;
@property (weak, nonatomic) IBOutlet UITextField *tf1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testTF.separatedInterval = 6;
    self.testTF.text = @"sadfsldnadjidflk";
    self.tf1.separatedInterval = 3;
    
//    self.testTF.text= @"12345654242";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
