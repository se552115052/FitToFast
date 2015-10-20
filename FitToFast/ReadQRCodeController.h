@class APLEvent;

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ReadQRCodeController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    UIImagePickerController *picker1;
    UIImagePickerController *picker2;
    UIImage *image;
//gallery
    IBOutlet UIImageView *imageView;
    UIImageView *imgQR;
}
//<AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;


- (IBAction)startStopReading:(id)sender;
-(NSString *)resultQR:(NSString *)result;

@property (nonatomic) APLEvent *event;
extern NSString *productQr;

@end
