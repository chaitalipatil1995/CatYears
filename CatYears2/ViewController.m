//
//  ViewController.m
//  CatYears2
//
//  Created by Student P_07 on 14/09/16.
//  Copyright © 2016 gunchai. All rights reserved.
//

#import "ViewController.h"
#define kHorizontalPadding 30.0
#define kVerticalPadding 50.0
#define kHeight 60.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.6 alpha:1];

    ScreenWidth =[[UIScreen mainScreen]bounds].size.width;
 
    ScreenHeight= [[UIScreen mainScreen]bounds].size.height;

    
    myTextField = [[UITextField alloc]initWithFrame:CGRectMake(kHorizontalPadding, 100,ScreenWidth-6*kHorizontalPadding,  kHeight)];
    myTextField.backgroundColor=[UIColor whiteColor];
    myTextField.borderStyle=UITextBorderStyleBezel;
    myTextField.borderStyle=UITextBorderStyleRoundedRect;
    myTextField.textColor=[UIColor blackColor];
    
    myTextField.font=[UIFont systemFontOfSize:25];
    myTextField.delegate=self;
    [myTextField setPlaceholder:@"Enter your age"];
    myTextField.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:myTextField];
    
    CatYearsButton=[[UIButton alloc]initWithFrame:CGRectMake(kHorizontalPadding, kHorizontalPadding+kHeight+kVerticalPadding+60, 175, kHeight)];
    
    [CatYearsButton setTintColor:[UIColor blackColor]];
    [CatYearsButton setTitle:@"CatYears" forState:UIControlStateNormal];
    CatYearsButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.4 alpha:1];
    CatYearsButton.layer.cornerRadius = kHeight/2.5;
    [CatYearsButton addTarget:self action:@selector(handleCatyears) forControlEvents:UIControlEventTouchUpInside];
    [CatYearsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CatYearsButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [CatYearsButton.titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];
    
    [[CatYearsButton layer] setBorderWidth:2.0f];
    [self.view addSubview:CatYearsButton];
    
    
    dogYearButton=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-kHorizontalPadding-175, kHorizontalPadding+kHeight+kVerticalPadding+60, 175, kHeight)];
    
    [dogYearButton setTintColor:[UIColor blackColor]];
    [dogYearButton setTitle:@"DogYears" forState:UIControlStateNormal];
    dogYearButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.4 alpha:1];
    dogYearButton.layer.cornerRadius = kHeight/2.5;
    [dogYearButton addTarget:self action:@selector(handleDogYears) forControlEvents:UIControlEventTouchUpInside];
    [dogYearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    dogYearButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [dogYearButton.titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];
    
    [[dogYearButton layer] setBorderWidth:2.0f];
    [self.view addSubview:dogYearButton];

    
    calculateLabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizontalPadding, 100+2*kHeight+kVerticalPadding, ScreenWidth-2*kHorizontalPadding, kHeight)];
    calculateLabel.textColor=[UIColor blackColor ];
    calculateLabel.font= [UIFont boldSystemFontOfSize:20];
    calculateLabel.layer.borderColor=[UIColor blackColor].CGColor;
    calculateLabel.layer.borderWidth= 2;
    calculateLabel.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:calculateLabel];
    
    
    displaylabel = [[UILabel alloc]initWithFrame:CGRectMake(kHorizontalPadding, 175+2*kHeight+kVerticalPadding, ScreenWidth-2*kHorizontalPadding, kHeight)];
    displaylabel.textColor=[UIColor blackColor ];
    displaylabel.font= [UIFont boldSystemFontOfSize:20];
    displaylabel.layer.borderColor=[UIColor blackColor].CGColor;
    displaylabel.layer.borderWidth= 2;
    displaylabel.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:displaylabel];
    
    
    ClearButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-4*kHorizontalPadding, 100, 100, kHeight)];
    [ClearButton setTitle:@"Clear" forState:UIControlStateNormal];
    ClearButton.layer.borderWidth=2;
    ClearButton.backgroundColor = [UIColor whiteColor];
    ClearButton.layer.borderColor=[UIColor blackColor].CGColor;
    ClearButton.titleLabel.font= [UIFont systemFontOfSize:15];
    [ClearButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20.f]];
    [ClearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ClearButton addTarget:self action:@selector(handleClear) forControlEvents:UIControlEventTouchUpInside];
    ClearButton.layer.cornerRadius= kHeight/2.5;
    [self.view addSubview:ClearButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)validateContent:(NSString *) content{
    if(content.length>0)
    {
        calculateLabel.text= content;
        return YES;
    }
    else
        
    {
        return NO;
    }
}

-(void)handleCatyears{
    BOOL checkInput;
    NSString *inputText;
    inputText= myTextField.text;
    checkInput=[self validateContent:inputText];
    
    if(checkInput)
    {
    
displaylabel.text=@" ";
        calculateLabel.text=@" ";
    NSString *currentValue= myTextField.text;
    
    float currentValueFloat= currentValue.floatValue;
    currentValueFloat= currentValueFloat/7;
    NSString *newValue= [NSString stringWithFormat:@"Your Catyears is %0.2f",currentValueFloat];
    
    calculateLabel.text= newValue;
        displaylabel.text=@" ";
    }
    else
    {
        calculateLabel.text=@" ";
        displaylabel.text = @"Please Enter years.";

    }
    
}
-(void)handleClear{
    myTextField.text=@"";
}


-(void)handleDogYears{
    BOOL checkInput;
    NSString *inputText;
    inputText= myTextField.text;
    checkInput=[self validateContent:inputText];
    
    if(checkInput)
    {
        
        displaylabel.text=@" ";
        calculateLabel.text=@" ";
        NSString *currentValue= myTextField.text;
        
        float currentValueFloat= currentValue.floatValue;
        currentValueFloat= currentValueFloat/4;
        NSString *newValue= [NSString stringWithFormat:@"Your Catyears is %0.2f",currentValueFloat];
        
        calculateLabel.text= newValue;
        displaylabel.text=@" ";
    }
    else
    {
        calculateLabel.text=@" ";
        displaylabel.text = @"Please Enter years.";
        
    }
    
}




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
