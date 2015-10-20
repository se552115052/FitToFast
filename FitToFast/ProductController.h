

#import <UIKit/UIKit.h>

@interface ProductController : UIViewController

@property (strong, nonatomic) NSDictionary *productDetail;
@property (weak, nonatomic) IBOutlet UILabel *dataName;
@property (weak, nonatomic) IBOutlet UITextView *dataDetail;
@property (weak, nonatomic) IBOutlet UILabel *dataPrice;
@property (strong, nonatomic) IBOutlet UIImageView *dataImage;
@property (weak, nonatomic) IBOutlet UILabel *dataXs;
@property (weak, nonatomic) IBOutlet UILabel *dataS;
@property (weak, nonatomic) IBOutlet UILabel *dataM;
@property (weak, nonatomic) IBOutlet UILabel *dataL;
@property (weak, nonatomic) IBOutlet UILabel *dataXl;

extern NSString *productID;

-(NSString *)receiveData;

@end
