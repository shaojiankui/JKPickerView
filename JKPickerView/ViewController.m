//
//  ViewController.m
//  JKPickerView
//
//  Created by Jakey on 14/11/18.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "ViewController.h"
#import "JKPickerView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    JKPickerView *picker = [[JKPickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-260, self.view.frame.size.width,260)];

    [self.input setLableTouched:^(UILabel *lable) {
        picker.items = @[@"1",@"2",@"3",@"4",@"5",@"6"];
        
        [picker setOnCompletionBlock:^(id item) {
            self.input.text  = [item description];
        }];
        [picker setTitleBlock:^NSString *(id item) {
            return [item description];
        }];
        self.input.inputView = picker;
        
        [self.input  becomeFirstResponder];
        
    }];
    
    [self.input2 setLableTouched:^(UILabel *lable) {
        picker.items = @[@{@"title":@"11",@"data":@[@"2133",@"2133",@"2133",]},@{@"title":@"22",@"data":@[]},@{@"title":@"33",@"data":@[]},@{@"title":@"44",@"data":@[]}];
        [picker setOnCompletionBlock:^(id item) {
            self.input2.text = [item objectForKey:@"title"];
            __unused NSArray *data = [item objectForKey:@"data"];
            NSLog(@"item%@",[item description]);
        }];
        [picker setTitleBlock:^NSString *(id item) {
            return [item objectForKey:@"title"];
        }];
        self.input2.inputView = picker;
        
        [self.input2  becomeFirstResponder];
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
