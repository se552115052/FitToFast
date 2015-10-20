

#import "GenerateProductQrCodeController.h"
#import "UIImage+QRCodeGenerator.h"
#import "ProductController.h"

@interface GenerateProductQrCodeController ()

@end

@implementation GenerateProductQrCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateQR];

}

-(NSString *)generateQR{
    NSString *qrValue;
    showqr.image = [UIImage QRCodeGenerator:productID
                             andLightColour:[UIColor whiteColor]
                              andDarkColour:[UIColor blackColor]
                               andQuietZone:1
                                    andSize:300];
    qrValue = productID;
    NSLog(@"productId = %@",qrValue);
    return qrValue;
}
@end
