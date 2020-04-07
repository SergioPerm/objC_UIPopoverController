//
//  ViewController.h
//  ObjC_UIPopoverController
//
//  Created by kluv on 02/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirthDayViewController.h"

@interface ViewController : UITableViewController <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, BirthDayViewDelegate>

- (IBAction)actionAdd:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;


@end

