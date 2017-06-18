//
//  ViewController.m
//  runtime学习
//
//  Created by qwkj on 2017/6/1.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "ViewController.h"
#import "GrandFather.h"
#import "Son+Swizzle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Son *son = [Son new];
    [son cry];
//    [son work];
//    Father *aFather = [Father new];
//    [aFather work];
 

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
