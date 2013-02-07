//
//  IXViewController.m
//  Camera-
//
//  Created by Javier García Gallego on 27/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXViewController.h"

@interface IXViewController ()
@property (strong, nonatomic) UIImage *maciza;
@end

@implementation IXViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@" Haz algo !!");
}

- (IBAction)takePicture:(id)sender {
    
    // Creamos el UIImagePickerController
    
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    
    
    // Lo configuramos
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // Habemus camera
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        // Me conformo con el carrete
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    pickerVC.allowsEditing = YES;
    
    // Nos declaramos su delegado
    
    pickerVC.delegate = self;
    
    // Indicamos la transicion
    pickerVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // Lo mostramos
    [self presentViewController:pickerVC animated:YES completion:^{
        // No ponemos nada en el bloque, pero se ejecutaría cuando el ViewController hubiera acabado de presentarse
    }];
    self.photo.image = self.maciza;
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // Sacamos la imagen del diccionario y la guardamos en una propiedad o en el modelo
    
    self.maciza = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // La quitamos de pantalla
    
    [self dismissViewControllerAnimated:YES completion:^{
        // No ponemos nada en el bloque, pero se ejecutaría cuando el ViewController hubiera acabado de desaparecer
    }];
    
}

@end
