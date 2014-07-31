//
//  TMTableViewCell.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMTableViewCell.h"
@interface TMTableViewCell () <TMReactiveCell>
@property (weak, nonatomic) IBOutlet UIButton *buttonCell;
@end

@implementation TMTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight {
    return 50;
}

+ (NSString *)reuseIdentifier {
    return @"kTMCell";
}

- (void)bindViewModel:(id)viewModel {
    
    // set the viewmodel
    self.viewModel = viewModel;
    
    // set the text label
    self.textLabel.text = self.viewModel.title;
    
    // bind the button
    self.buttonCell.rac_command = self.viewModel.buttonCellCommand;
    
    // observe for completion
    [self.viewModel.buttonCellExecutionCompletionSignal subscribeNext:^(id x) {
        if ([self.viewModel.binderDelegate respondsToSelector:@selector(cellButtonTap:)]) {
            [self.viewModel.binderDelegate cellButtonTap:x];
        }
    }];
}

@end
