//
//  SoundboardViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "SoundboardViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <iAd/iAd.h>

@interface SoundboardViewController () <AVAudioPlayerDelegate, ADBannerViewDelegate>

@property AVAudioPlayer *player;
@property float volume;

- (IBAction)yaySound:(id)sender;
- (IBAction)airhornSound:(id)sender;
- (IBAction)knockSound:(id)sender;
- (IBAction)dingSound:(id)sender;
- (IBAction)buzzerSound:(id)sender;
- (IBAction)countdownSound:(id)sender;
- (IBAction)phone1Sound:(id)sender;
- (IBAction)phone2Sound:(id)sender;
- (IBAction)doorbellSound:(id)sender;
- (IBAction)beat1Sound:(id)sender;
- (IBAction)beat2Sound:(id)sender;
- (IBAction)beat3Sound:(id)sender;

@property (weak, nonatomic) IBOutlet ADBannerView *adView;
@property (nonatomic, strong) NSTimer *adTimer;
@property (nonatomic) int secondsElapsed;
@property (nonatomic) BOOL pauseTimeCounting;

@end

@implementation SoundboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set up the iAd, make this the delegate
    self.adView.delegate = self;
    // Initially hide the ad banner.
    self.adView.alpha = 0.0;
    
    // Start the timer for the ads to be changed
    self.adTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                  selector:@selector(showTimerMessage)
                                                  userInfo:nil
                                                   repeats:YES];
    
    // Set the initial value for the elapsed seconds.
    self.secondsElapsed = 0;
    
    //set up volume for the sounds
    //default 1.0
    self.volume = 1.0;
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    //stop the sound from playing
    [self.player stop];
}

#pragma mark - iAd methods

- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    NSLog(@"Ad Banner will load ad.");
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"Ad Banner did load ad.");
    
    // Show the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adView.alpha = 1.0;
    }];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    NSLog(@"Ad Banner action is about to begin.");
    
    self.pauseTimeCounting = YES;
    
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    NSLog(@"Ad Banner action did finish");
    
    self.pauseTimeCounting = NO;
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
    
    // failed to find an advertisement to display
    // hide the banner
    [UIView animateWithDuration:0.5 animations:^{
        self.adView.alpha = 0.0;
    }];
}

- (void)showTimerMessage {
    if (!self.pauseTimeCounting)
        self.secondsElapsed++;
}

#pragma mark - Sound playing methods

- (IBAction)yaySound:(id)sender {
    [self playSound:@"yay"];
}

- (IBAction)airhornSound:(id)sender {
    [self playSound:@"airhorn"];
}

- (IBAction)knockSound:(id)sender {
    [self playSound:@"knock"];
}

- (IBAction)dingSound:(id)sender {
    [self playSound:@"ding"];
}

- (IBAction)buzzerSound:(id)sender {
    [self playSound:@"buzzer"];
}

- (IBAction)countdownSound:(id)sender {
    [self playSound:@"countdown"];
}

- (IBAction)phone1Sound:(id)sender {
    [self playSound:@"phone1"];
}

- (IBAction)phone2Sound:(id)sender {
    [self playSound:@"phone2"];
}

- (IBAction)doorbellSound:(id)sender {
    [self playSound:@"doorbell"];
}

- (IBAction)beat1Sound:(id)sender {
    [self playSound:@"beat1"];
}

- (IBAction)beat2Sound:(id)sender {
    [self playSound:@"beat2"];
}

- (IBAction)beat3Sound:(id)sender {
    [self playSound:@"beat3"];
}

- (void)playSound:(NSString *)trackTitle
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:trackTitle ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:soundPath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    [self.player setDelegate:self];
    [self.player setVolume:1.0];
    [self.player play];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}
@end
