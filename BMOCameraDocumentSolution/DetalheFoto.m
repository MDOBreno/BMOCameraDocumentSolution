//
//  DetalheFoto.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DetalheFoto.h"

@interface DetalheFoto ()

@end

@implementation DetalheFoto

AVCaptureSession *sessao;
AVCaptureStillImageOutput *aindaEaImagemDeSaida;

-(void)viewDidLoad {
    [super viewDidLoad];
    ivCameraInsta.layer.zPosition = -5;
    quadroParaCaptura.layer.zPosition = 5;
}

- (id)initWithFoto:(UIImageView *)fotoInicial {
    
    if(( self = [super init] )) {
        self->foto = fotoInicial;
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    sessao = [[AVCaptureSession alloc] init];
    [sessao setSessionPreset:AVCaptureSessionPresetPhoto];

    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];

    if ([sessao canAddInput:deviceInput]) {
        [sessao addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:sessao];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = quadroParaCaptura.frame;

    [previewLayer setFrame:frame];

    [rootLayer insertSublayer:previewLayer atIndex:0];

    aindaEaImagemDeSaida = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecTypeJPEG, AVVideoCodecKey, nil];
    [aindaEaImagemDeSaida setOutputSettings:outputSettings];

    [sessao addOutput:aindaEaImagemDeSaida];

    [sessao startRunning];
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)baterFoto:(id)sender {
    AVCaptureConnection *conexaoDeVideo = nil;
    for (AVCaptureConnection *conexao in aindaEaImagemDeSaida.connections) {
        for (AVCaptureInputPort *porta in [conexao inputPorts]) {
            if ([[porta mediaType] isEqual:AVMediaTypeVideo]) {
                conexaoDeVideo = conexao;
                break;
            }
        }
    }
    [aindaEaImagemDeSaida captureStillImageAsynchronouslyFromConnection:conexaoDeVideo completionHandler:^(CMSampleBufferRef  _Nullable imageDataSampleBuffer, NSError * _Nullable error) {
        if (imageDataSampleBuffer != NULL) {
            NSDate *dadosDaImagem = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *imagem = [UIImage imageWithData:dadosDaImagem];
            ivImagem.image = imagem;
        }
    }];
}


@end
