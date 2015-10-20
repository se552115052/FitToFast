

#import "ViewController.h"
#import "LoginController.h"
#import "ModelGenderController.h"
#import "HumanController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self alertLogin:@"You're now logged in." :@"Welcome!" :0];
    
    // session
    
    NSUserDefaults *get_session = [NSUserDefaults standardUserDefaults];
    session_username = [get_session stringForKey:@"session_username"];
    NSLog(@"username from login scene= %@",session_username);
    
}

- (IBAction)generateBtn:(id)sender {
    
    //check username with size
    userId = @"userId";
    username = @"username";
    gender = @"gender";
    shoulderSize = @"shoulderSize";
    bustSize = @"bustSize";
    hipSize = @"hipSize";
    
    NSLog(@" username  %@ ",session_username);
    
    myObject=[[NSMutableArray alloc]init];
    NSString *urlUser = [NSString stringWithFormat:@"http://fittofast.mrrkh.com/viewUserModel.php?uu=%@",session_username];
    
    NSData *jsonSource =[NSData dataWithContentsOfURL:[NSURL URLWithString:urlUser]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for(NSDictionary *dataDict in jsonObjects){
        
        userid_data = [dataDict objectForKey:@"userId"];
        username_data = [dataDict objectForKey:@"username"];
        gender_data = [dataDict objectForKey:@"gender"];
        shoulderSize_data = [dataDict objectForKey:@"shoulderSize"];
        bustSize_data = [dataDict objectForKey:@"bustSize"];
        hipSize_data = [dataDict objectForKey:@"hipSize"];
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:userid_data,userId,username_data,username,gender_data,gender,shoulderSize_data,shoulderSize,bustSize_data,bustSize,hipSize_data,hipSize,nil];
        
        [myObject addObject:dictionary];
        
    }
    
    NSLog(@"userId: %@",userid_data);
    NSLog(@"username: %@",username_data);
    NSLog(@"gender: %@",gender_data);
    NSLog(@"shoulder: %@",shoulderSize_data);
    NSLog(@"bust: %@",bustSize_data);
    NSLog(@"hip: %@",hipSize_data);
    

    if(!gender_data){
        
        ModelGenderController *modelGender= [self.storyboard instantiateViewControllerWithIdentifier:@"genderModel"];
        [self presentModalViewController:modelGender animated:NO];
        

    }else{
        
        HumanController *humanController= [self.storyboard instantiateViewControllerWithIdentifier:@"qrHuman"];
        [self presentModalViewController:humanController animated:NO];
        
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutBtn:(id)sender {
    
    [self alertLogout:@"You're now logged out." :@"" :0];
    
    

}


- (void) alertLogin:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    
    alertView.tag = tag;
    [alertView show];
    
    
    
}


- (void) alertLogout:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
  
    LoginController *loginscene= [self.storyboard instantiateViewControllerWithIdentifier:@"loginscene"];
    [self presentModalViewController:loginscene animated:NO];
    
    
    alertView.tag = tag;
    [alertView show];
    
}

@end
