

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

@interface ClothModelController : UIViewController
{
 
    
    IBOutlet SCNView *sceneModelClothes;
  
    IBOutlet UIButton *xsbtn;
    IBOutlet UIButton *sbtn;
    IBOutlet UIButton *mbtn;
    IBOutlet UIButton *lbtn;
    IBOutlet UIButton *xlbtn;
    IBOutlet UIScrollView *scrollView;

    NSString *clothesText;
    SCNMaterial *textureClothes;
    
    NSString *showModel;
    NSString *typeClothes;
    NSArray *shirt_type;
    
    NSString* result;
    
    int nNumShirt;
    
    SCNScene *sceneTemp;
    SCNScene *sceneTshirt;
    SCNNode *myShirtNode;
    NSString *clothModel;
    NSString *strShirtNameSelected;
    
    NSString *defaultShirt;
    
    NSMutableArray *myData;
    NSDictionary *dic;
    NSString *typeId;
    NSString *Image;
    NSString *Texture;
    
}

extern NSString *sizeClothes;


-(NSString *)fitCloth:(NSString *)clothSize;
-(NSString *)showHumanModel;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end
