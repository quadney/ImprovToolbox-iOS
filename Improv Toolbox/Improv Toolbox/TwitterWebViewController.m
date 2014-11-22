//
//  TwitterWebViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "TwitterWebViewController.h"

@interface TwitterWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *twitterPageWebView;

@end

@implementation TwitterWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *twitterURL = @"https://twitter.com/gvilleimprov";
    NSURL *url = [NSURL URLWithString:twitterURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.twitterPageWebView loadRequest:request];
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
