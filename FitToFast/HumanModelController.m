

#import "HumanModelController.h"
#import "ModelGenderController.h"
#import "ClothModelController.h"
#import "GenerateQrCodeController.h"
#import "LoginController.h"
#import "SQLClient.h"

NSString *modelText = @"";
NSString *qrData;

@interface HumanModelController ()
@end


@implementation HumanModelController
@synthesize resultQr;
@synthesize intShoulder;
@synthesize intBust;
@synthesize intHip;
@synthesize shoulderSize;
@synthesize hipSize;
@synthesize bustSize;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"GENDER HUMAN  %@",gender);
    if(!qrData){
    if([gender isEqualToString:@"Male"]){
        NSString *gendertext = @"Model Male";
        [self genderModel:gendertext];
    }else if([gender isEqualToString:@"Female"]){
        NSString *gendertext = @"Model Female";
        [self genderModel:gendertext];
    }
    }else{
        
    //ลองดูไม่เห็นได้ใช้
    qrData = [self.resultQr description];
    NSLog(@"qrData %@",qrData);
    [self createModelFromQR:qrData];
    }
}

- (IBAction)fitBtn:(id)sender {
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];
          }
    else{
        NSString *gofit= @"clohtesScene";
        ClothModelController *cs   = (ClothModelController *)[self.storyboard instantiateViewControllerWithIdentifier:gofit];
        [self presentViewController:cs animated:NO completion:nil];
    }
    
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)shoulderSize:(id)sender {
    [self checkShoulderTextfield];
}
- (IBAction)bustSize:(id)sender {
    [self checkBustTextfield];
}
- (IBAction)hipSize:(id)sender {
    [self checkHipTextfield];
}

-(int *)checkShoulderTextfield{
    
    NSInteger *resultSh;
    strShoulderSize = shoulderSize.text;
    intShoulder = [strShoulderSize intValue];

    if ((intShoulder<14)||(intShoulder>17)) {
        
        [self alertMessage:@"The shoulder size must be between 14 and 17" :@"Shoulder Size Error" :0];
    }
    
    NSLog(@"Allow the shoulder size in range 14-17: %d", intShoulder);
    return resultSh;
    
}
-(int *)checkBustTextfield{
    
    NSInteger *resultBust;
    strBustSize = bustSize.text;
    intBust = [strBustSize intValue];
    
    if ((intBust<32)||(intBust>40)) {
        
        [self alertMessage:@"The bust size must be between 32 and 40" :@"Bust Size Error" :0];
        
    }
    NSLog(@"Allow the bust size in range 32-40: %d", intBust);
    return resultBust;
}
-(int *)checkHipTextfield{

    NSInteger *resultHip;
    strHipSize = hipSize.text;
    intHip = [strHipSize intValue];
    
    if ((intHip<34)||(intHip>42)) {
        
        [self alertMessage:@"The hip size must be between 34 and 42" :@"Hip Size Error" :0];

    }
    NSLog(@"Allow the hip size in range 34-42: %d", intHip);
    return resultHip;
}
-(void)checkQrBtn{
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
       
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];

    }
    else{
        NSString *goQRscene = @"qrScene";
        GenerateQrCodeController *qs   = (GenerateQrCodeController *)[self.storyboard instantiateViewControllerWithIdentifier:goQRscene];
        [self presentViewController:qs animated:NO completion:nil];
    }
    
}

-(NSString *)genderModel:(NSString *)genderText{

    NSString *resultGender;
    
    modelLabel.text = genderText;
    if([genderText isEqualToString:@"Model Male"]){
    sceneModel.scene = [SCNScene sceneNamed:@"MXS1.dae"];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    resultGender = genderText;

    }else if([genderText isEqualToString:@"Model Female"]){
        
    modelLabel.text = genderText;
    sceneModel.scene = [SCNScene sceneNamed:@"FXS1.dae"];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    resultGender = genderText;
    }
    
    NSLog(@"modelLabel = %@",resultGender);
    return resultGender;
}

- (IBAction)generateBtn:(id)sender {
    NSLog(@"generateBtn");
    [self generateHumanModel];
}
- (IBAction)qrBtn:(id)sender {
    [self checkQrBtn];
}

-(NSString *)generateHumanModel{
    
    NSString *model;
    NSLog(@"generateHumanModel");

    strShoulderSize = shoulderSize.text;
    intShoulder = [strShoulderSize intValue];
    strBustSize = bustSize.text;
    intBust = [strBustSize intValue];
    strHipSize = hipSize.text;
    intHip = [strHipSize intValue];
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
        
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];
        
    }else if ((intShoulder<14)||(intShoulder>17)) {
        
        [self alertMessage:@"The shoulder size must be between 14 and 17" :@"Shoulder Size Error" :0];
    
    }else if ((intBust<32)||(intBust>40)) {
        
        [self alertMessage:@"The bust size must be between 32 and 40" :@"Bust Size Error" :0];
        
    }else if ((intHip<34)||(intHip>42)) {
        
        [self alertMessage:@"The hip size must be between 34 and 42" :@"Hip Size Error" :0];

    }
    
    else{
        
        [self model:gender intS:&(intShoulder) intH:&(intHip)];
    }
        return model;
    
}

-(void)createModelFromQR:(NSString *)modeldata{

    NSLog(@"result จาก createModelFromQR %@",modeldata);
    
    
    NSArray* modelSplit = [modeldata componentsSeparatedByString: @"Hip"];
    NSString *result = [modelSplit objectAtIndex: 1];
    
    NSLog(@"modelSplit =%@",result);
    
    NSString *showModel = [NSString stringWithFormat:@"%@.dae",result];
    
    sceneModel.scene = [SCNScene sceneNamed:showModel];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableArray *array = [NSMutableArray array];
    NSString *ch = [result substringWithRange:NSMakeRange(1, 2)];
    [array addObject:ch];
    NSLog(@"ch  %@",ch);
    
    if([gender isEqualToString:@"Male"]){
        if([ch isEqualToString:@"XL"]){
            sizeClothes = @"XLM";
        }else{
            sizeClothes = @"SMM";
        }
    }else{
        if([ch isEqualToString:@"M"]||[ch isEqualToString:@"X"]){
            sizeClothes = @"XLF";
        }else{
            sizeClothes = @"SMF";
        }
    }

    

}

-(void)model:(NSString *)modelGen intS:(NSInteger *)intSh intH:(NSInteger *)intH{
    
    NSString *model;
    
    NSLog(@"session username %@",session_username);
    
    NSLog(@"int shoulder  %d",intShoulder);
    NSLog(@"int hip  %d",intHip);
    NSLog(@"modelGen  %@", modelGen);
    
    
    //Male
    
    if([modelGen isEqual: @"Male"]){
        if(14<=intShoulder&&intShoulder<=15){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder14-15 HipMXS1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder14-15 HipMXS2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder14-15 HipMXS3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder14-15 HipMXS4";
            }
            else if (intHip==42){
                modelText = @"Shoulder14-15 HipMXS5";
            }
            
        }
        
        if(15<=intShoulder&&intShoulder<=16){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder15-16 HipMM1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder15-16 HipMM2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder15-16 HipMM3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder15-16 HipMM4";
            }
            else if (intHip==42){
                modelText = @"Shoulder15-16 HipMM5";
            }
            
        }
        
        if(16<=intShoulder&&intShoulder<=17){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder16-17 HipMXL1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder16-17 HipMXL2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder16-17 HipMXL3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder16-17 HipMXL4";
            }
            else if (intHip==42){
                modelText = @"Shoulder16-17 HipMXL5";
            }
            
        }
    }
    //Female
    else if([modelGen isEqual:@"Female"]){
        
        if(14<=intShoulder&&intShoulder<=15){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder14-15 HipFXS1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder14-15 HipFXSF2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder14-15 HipFXS3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder14-15 HipFXS4";
            }
            else if (intHip==42){
                modelText = @"Shoulder14-15 HipFXS5";
            }
            
        }
        
        if(15<=intShoulder&&intShoulder<=16){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder15-16 HipFM1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder15-16 HipFM2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder15-16 HipFM3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder15-16 HipFM4";
            }
            else if (intHip==42){
                modelText = @"Shoulder15-16 HipFM5";
            }
            
        }
        
        if(16<=intShoulder&&intShoulder<=17){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder16-17 HipFXL1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder16-17 HipFXL2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder16-17 HipFXL3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder16-17 HipFXL4";
            }
            else if (intHip==42){
                modelText = @"Shoulder16-17 HipFXL5";
            }
            
        }
    }
    NSArray* modelSplit = [modelText componentsSeparatedByString: @"Hip"];
    NSString* result = [modelSplit objectAtIndex: 1];
    
    sceneModel.scene = [SCNScene sceneNamed:result];
    NSLog(@" test %@",result);
    
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
            
        {
            NSString *account = [NSString stringWithFormat:@"SELECT * FROM models WHERE username = '%@'",session_username];
            
            NSLog(@" account %@",account);
            
            [client execute:account completion:^(NSArray* results) {
                
                NSString *status;
                // array ทั้งหมด
                
                //มากกว่าคือ มี

                if([[results objectAtIndex:0] count]>0){

                    [self updateModel:username gender:gender shoulderSize:intShoulder bustSize:intBust hipSize:intHip];
                    
                }else{
                    [self insertModel:session_username gender:gender shoulderSize:intShoulder bustSize:intBust hipSize:intHip];
                }
                
                
                
                [client disconnect];
                
            }];
            
        }else{
            [self alertMessage:@"Sign in Failed." :@"Error!" :0];
            
        }    [NSThread sleepForTimeInterval: 3];
        
        
    }];
    
    
}

-(NSString *)insertModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize{
  
    NSString *test;
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    NSString *account = [NSString stringWithFormat:@"insert into models (username,gender,shoulderSize,bustSize,hipSize) values ('%@','%@','%d','%d','%d') ",session_username,gender,shoulderSize,bustSize,hipSize];
    
    
    NSLog(@" account %@",account);
    
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            [client execute:account completion:^(NSArray* results) {
                
                [client disconnect];
                
            }];
        }
    }];

    
    return test;
}

-(NSString *)updateModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize{
    NSString *update;
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    NSString *account = [NSString stringWithFormat:@"update models set (gender,shoulderSize,bustSize,hipSize) values ('%@','%d','%d','%d') where username = '%@'" ,gender,shoulderSize,bustSize,hipSize,session_username];
    
    
    NSLog(@" account %@",account);
    
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            [client execute:account completion:^(NSArray* results) {
                
                [client disconnect];
                
            }];
        }
    }];
    

    return update;
}

- (void) alertMessage:(NSString *)msg :(NSString *)title :(int) tag
{
    alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alert.tag = tag;
    [alert show];
}

@end
