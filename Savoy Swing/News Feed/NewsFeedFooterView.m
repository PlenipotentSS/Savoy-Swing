//
// DemoTableFooterView.m
//
// @author Shiki
//

#import "NewsFeedFooterView.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NewsFeedFooterView

@synthesize activityIndicator;
@synthesize infoLabel;

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) awakeFromNib
{
  self.backgroundColor = [UIColor clearColor];
  [super awakeFromNib];
}
@end
