//
//  ViewController.m
//  calculator
//
//  Created by kariman eltawel on 08/01/2023.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)operationaction:(UIButton*)sender {
    if(self.expresionlabel.text==@""){
        return;
    }
    else{
        NSString *expresion=[NSString stringWithFormat:@"%@%@",self.expresionlabel.text,sender.titleLabel.text];
        self.expresionlabel.text=expresion;
    }
}
- (IBAction)numberAction:(UIButton*)sender {
    NSString *number=[NSString stringWithFormat:@"%@%@",self.expresionlabel.text,sender.titleLabel.text];
    self.expresionlabel.text=number;
}
- (IBAction)equalaction:(id)sender {
    if(self.expresionlabel.text==@""){
        return;
    }
    else{
        @try {
        NSString *numericExpression = [NSString stringWithFormat:@"%@.0", self.expresionlabel.text];
                   
        NSExpression *expression = [NSExpression expressionWithFormat:numericExpression];
                   
                   
        NSNumber *result = [expression expressionValueWithObject:nil context:nil];
                   
        NSLog(@"%@", [NSString stringWithFormat:@"%@", result]);
                   
        self.resultlabel.text = [NSString stringWithFormat:@"= %@", result];
            
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
                    
        } @finally {
            
        }
    }}
    
- (IBAction)clearaction:(id)sender {
    if(self.expresionlabel.text==@""){
            return;
        }
    self.resultlabel.text=@"";
        NSString *numericExpression = self.expresionlabel.text;
    numericExpression = [numericExpression substringToIndex:[numericExpression length]-1];
    self.expresionlabel.text=numericExpression;
    //self.resultlabel.text=@"";
}


@end
