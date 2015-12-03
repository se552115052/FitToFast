

#import <UIKit/UIKit.h>

@interface ViewListProduct : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *myObject;
    NSDictionary *dictionary;
    NSString *typeId;
    NSString *Name;
    NSString *Details;
    NSString *Price;
    NSString *Image;
    NSString *Texture;
    NSString *XS;
    NSString *S;
    NSString *M;
    NSString *L;
    NSString *XL;
    
    
    NSArray *product;
    
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
-(NSString *)reteiveProduct;

@end
