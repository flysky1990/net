//
//  ViewController.m
//  轮播器
//
//  Created by 陈曦 on 16/4/14.
//  Copyright © 2016年 xi chen. All rights reserved.
//

#import "ViewController.h"
#import "ShufflingView.h"

@interface ViewController ()<ShufflingViewDelegate>

@property(nonatomic,strong)NSMutableArray *imageNameArray;

@property(nonatomic,strong)ShufflingView *shuffling;

@end

@implementation ViewController


-(NSMutableArray *)imageNameArray{
    
    if (_imageNameArray == nil){
        
        _imageNameArray = [NSMutableArray array];
        
    }
    
    return _imageNameArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ShufflingView *shuffling = [[ShufflingView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    shuffling.delegate = self;
    
    self.shuffling = shuffling;
    
    shuffling.animateDelay = 3.0;
    
    self.imageNameArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"].copy;
    
    shuffling.imageNameArray = self.imageNameArray;
    
    [self.view addSubview:shuffling];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 30, 30, 30)];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)clickButton{

    
    int rag = arc4random()%5;
    NSLog(@"随机%d",rag);
    
    self.shuffling.presentIndex = rag;
    


}


-(void)ClickImageView:(ShufflingView *)shufflingView imageNameArrayIndex:(int)Index{
    
//    NSLog(@"现在的图片名为:%@",self.imageNameArray[Index]);
    
}

-(void)shufflingView:(ShufflingView *)shufflingView presentImageNameArrayindex:(int)index{
    NSLog(@"当前轮播的图片名:%@",self.imageNameArray[index]);
}

@end