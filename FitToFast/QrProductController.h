
#import <UIKit/UIKit.h>

@interface QrProductController : UIViewController
{
    NSMutableArray *myObject;
    NSDictionary *dictionary;
    
    NSString *pId;
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

    UIImageView *productImg;
    UILabel *productName;
    UITextView *productDetail;
    UILabel *productPrice;
    UILabel *xs;
    UILabel *s;
    UILabel *m;
    UILabel *l;
    UILabel *xl;
    
    NSString *pId_data;
    NSString *type_data;
    NSString *name_data;
    NSString *detail_data;
    NSString *price_data;
    NSString *img_data;
    NSString *tex_data;
    NSString *xs_data;
    NSString *s_data;
    NSString *m_data;
    NSString *l_data;
    NSString *xl_data;
    
}

@property (strong, nonatomic) id resultQrProduct;




@end
