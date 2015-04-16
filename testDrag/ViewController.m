
#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacing;
@property float oldValue;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor blackColor];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.frame = CGRectMake(0, 0, 320, 50);
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double delta =  scrollView.contentOffset.y - self.oldValue;
    
    

    [UIView animateWithDuration:0
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^
     {
         
         self.spacing.constant -= delta;
         [self.view layoutIfNeeded];
     }completion:nil];
    NSLog(@"delta = %f",delta);
    self.oldValue =scrollView.contentOffset.y;
}







@end
