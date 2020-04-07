//
//  birthDayViewController.m
//  ObjC_UIPopoverController
//
//  Created by kluv on 06/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "BirthDayViewController.h"

@interface BirthDayViewController ()



@end

@implementation BirthDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.birthDayDate) {
        self.birthDatePicker.date = self.birthDayDate;
    } else {
        self.birthDayDate = self.birthDatePicker.date;
    }
    
}

#pragma mark - Actions

- (IBAction)datePickerChangeAction:(UIDatePicker *)sender {
    
    self.birthDayDate = sender.date;
    
}

- (IBAction)barItemDoneAction:(UIBarButtonItem *)sender {
        
    if ([self.delegate respondsToSelector:@selector(closeBirthDayDatePickerWithDate:)]) {
        [self.delegate closeBirthDayDatePickerWithDate:self.birthDayDate];
    }
        
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Delegate methods

- (void) closeBirthDayDatePickerWithDate:(NSDate*) birdtDay {
 
    
    
}

@end

