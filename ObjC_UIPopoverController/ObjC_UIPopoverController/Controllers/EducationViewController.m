//
//  EducationViewController.m
//  ObjC_UIPopoverController
//
//  Created by kluv on 09/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@property (strong, nonatomic) NSString* selectDegree;

@end

@implementation EducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Methods

- (void)clearCheckBoxesOntableView {
    
    NSMutableArray* cells = [[NSMutableArray alloc] init];
    
    for (NSInteger n = 0; n < [self.tableView numberOfSections]; n++) {
        
        for (NSInteger i = 0; i < [self.tableView numberOfRowsInSection:n]; i++) {
            [cells addObject:[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:n]]];
        }
        
    }
    
    for (UITableViewCell* cell in cells) {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
}

- (NSString*)getDegreeInStringFromCell:(UITableViewCell*) cell {
    
    NSString* stringDegree = @"";
    
    if (cell.tag == 0) {
        stringDegree = @"Middle school";
    } else if (cell.tag == 1) {
        stringDegree = @"High school";
    } else if (cell.tag == 2) {
        stringDegree = @"Bachelor";
    } else if (cell.tag == 3) {
        stringDegree = @"Master";
    } else if (cell.tag == 4) {
        stringDegree = @"Doctor";
    }
    
    return stringDegree;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self clearCheckBoxesOntableView];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        self.selectDegree = [self getDegreeInStringFromCell:cell];
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.selectDegree = @"";
    }
    
    if ([self.delegate respondsToSelector:@selector(onSelectEducationDegree:)]) {
        [self.delegate onSelectEducationDegree:@""];
    }
    
    if ([self.delegate respondsToSelector:@selector(onSelectEducationDegree:)]) {
        [self.delegate onSelectEducationDegree:self.selectDegree];
    }
    
}

#pragma mark - Delegate methods

- (void)onSelectEducationDegree:(NSString*) educationDegree {
 
    
    
}

#pragma mark - Actions

- (IBAction)educationNavBarDoneAction:(UIBarButtonItem *)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}
@end
