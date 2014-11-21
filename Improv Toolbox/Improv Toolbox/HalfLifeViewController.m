//
//  HalfLifeViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "HalfLifeViewController.h"

@interface HalfLifeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)startTimer:(id)sender;
- (IBAction)halfTimer:(id)sender;
- (IBAction)resetButton:(id)sender;

@property (strong, nonatomic) NSTimer *timer;
@property double timerValue;

@end

@implementation HalfLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timerValue = 60.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimer:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateTimerLabel:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (IBAction)halfTimer:(id)sender {
    [self killTimer];
    self.timerValue /= 2;
    [self.timeLabel setText:[NSString stringWithFormat:@"%f", self.timerValue]];
}

- (IBAction)resetButton:(id)sender {
    [self killTimer];
    [self resetTimerValue];
    [self.timeLabel setText:[NSString stringWithFormat:@"%f", self.timerValue]];
}

- (void)resetTimerValue
{
    [self killTimer];
    self.timerValue = 60.0;
    [self.timeLabel setText:[NSString stringWithFormat:@"%f", self.timerValue]];
}

- (void)updateTimerLabel:(id)sender
{
    [self.timeLabel setText:[NSString stringWithFormat:@"%f", self.timerValue]];
}

- (void)killTimer{
    if(self.timer){
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
