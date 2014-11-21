//
//  SoundboardViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "SoundboardViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SoundboardViewController ()
- (IBAction)volumeSlider:(id)sender;
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

@end

@implementation SoundboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set up volume to current volume control? is this even possible with iOS?
}

- (IBAction)volumeSlider:(id)sender {
}

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
    NSURL *url = [NSURL fileURLWithPath:path];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    [player play];
}
@end
