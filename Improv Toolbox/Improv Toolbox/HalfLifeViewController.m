//
//  HalfLifeViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "HalfLifeViewController.h"
#import <iAd/iAd.h>

@interface HalfLifeViewController () <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)startTimer:(id)sender;
- (IBAction)halfTimer:(id)sender;
- (IBAction)resetButton:(id)sender;

@property (strong, nonatomic) NSTimer *timer;
@property float timerValue;
@property int timerCursor;
@property (nonatomic) BOOL pauseTimeCounting;
@property (strong, nonatomic) NSArray *timerValues;

@property (weak, nonatomic) IBOutlet ADBannerView *adView;

@end

@implementation HalfLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timerValues = @[ @60.0f, @30.0f, @15.0f, @7.5f, @3.0f, @1.5f];
    self.timerCursor = 0;
    self.timerValue = [[self.timerValues objectAtIndex:self.timerCursor] floatValue];
    
    //set up the iAd, make this the delegate
    self.adView.delegate = self;
    // Initially hide the ad banner.
    self.adView.alpha = 0.0;
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
    self.pauseTimeCounting = NO;
}

- (IBAction)halfTimer:(id)sender {
    [self killTimer];
    self.timerValue /= 2;
    [self updateTimerLabel];
}

- (IBAction)resetButton:(id)sender {
    [self killTimer];
    [self resetTimerValue];
    [self updateTimerLabel];
}

- (void)resetTimerValue
{
    [self killTimer];
    self.timerValue = 60.0;
    
}

- (void)updateTimerLabel:(id)sender
{
    if (!self.pauseTimeCounting) {
        self.timerValue++;
        [self updateTimerLabel];
    }
    
    
}

- (void)killTimer{
    if(self.timer){
        [self.timer invalidate];
        self.timer = nil;
        self.pauseTimeCounting = YES;
    }
}

- (void)updateTimerLabel
{
    [self.timeLabel setText:[NSString stringWithFormat:@"%f", self.timerValue]];
}

@end
