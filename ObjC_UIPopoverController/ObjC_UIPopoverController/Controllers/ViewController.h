//
//  ViewController.h
//  ObjC_UIPopoverController
//
//  Created by kluv on 02/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirthDayViewController.h"
#import "EducationViewController.h"

@interface ViewController : UITableViewController <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, BirthDayViewDelegate, EducationViewDelegate>

- (IBAction)actionAdd:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;


@end

