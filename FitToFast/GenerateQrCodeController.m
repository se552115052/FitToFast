

#import "GenerateQrCodeController.h"
#import "UIImage+QRCodeGenerator.h"
#import "HumanModelController.h"

@interface GenerateQrCodeController ()

@end

@implementation GenerateQrCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateQR];
}

-(NSString *)generateQR{
    NSString *qrValue;
    showqr.image = [UIImage QRCodeGenerator:modelText
                             andLightColour:[UIColor whiteColor]
                              andDarkColour:[UIColor blackColor]
                               andQuietZone:1
                                    andSize:300];
    qrValue = modelText;
    NSLog(@"modelText = %@",qrValue);
    return qrValue;
}


@end
