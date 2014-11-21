//
//  SuggestionatorViewController.m
//  Improv Toolbox
//
//  Created by Sydney Richardson on 11/20/14.
//  Copyright (c) 2014 Gainesville Improv Festival. All rights reserved.
//

#import "SuggestionatorViewController.h"
#import "SuggestionatorHelper.h"

@interface SuggestionatorViewController ()

@property (strong, nonatomic) SuggestionatorHelper *helper;
@property (weak, nonatomic) IBOutlet UILabel *suggestionLabel;
- (IBAction)objectButton:(id)sender;
- (IBAction)relationshipButton:(id)sender;
- (IBAction)locationButton:(id)sender;
- (IBAction)occupationButton:(id)sender;
- (IBAction)eventButton:(id)sender;
- (IBAction)genreButton:(id)sender;
- (IBAction)personButton:(id)sender;
- (IBAction)emotionButton:(id)sender;
- (IBAction)oddballButton:(id)sender;

@end

@implementation SuggestionatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //parse the JSON suggestionator stuff
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"suggestionator" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    self.helper = [[SuggestionatorHelper alloc] init];
    [self.helper parseJsonData:jsonData];
}

- (IBAction)objectButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getObject]];
}

- (IBAction)relationshipButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getRelationship]];
}

- (IBAction)locationButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getLocation]];
}

- (IBAction)occupationButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getOccupation]];
}

- (IBAction)eventButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getEvent]];
}

- (IBAction)genreButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getGenre]];
}

- (IBAction)personButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getPerson]];
}

- (IBAction)emotionButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getEmotion]];
}

- (IBAction)oddballButton:(id)sender {
    [self.suggestionLabel setText:[self.helper getOddball]];
}
@end
