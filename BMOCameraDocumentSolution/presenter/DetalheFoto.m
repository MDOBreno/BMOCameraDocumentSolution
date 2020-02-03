//
//  DetalheFoto.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "DetalheLoja.h"
#import "DetalheFoto.h"
#import "Loja.h"

@interface DetalheFoto ()

@end

@implementation DetalheFoto

AVCaptureSession *sessao;
AVCaptureStillImageOutput *aindaEaImagemDeSaida;
bool *rotacionado;


-(void)viewDidLoad {
    [super viewDidLoad];
    rotacionado = false;
    ivCameraInsta.layer.zPosition = -5;
    quadroParaCaptura.layer.zPosition = 5;
}

- (id)initWithFoto:(UIImage *)fotoInicial andIdentidadeLoja:(NSString *)identidadeInicial andDetalheLoja:(DetalheLoja *)detalheLojaInicial andMainViewController:(MainViewController *)mainViewControllerInicial{
    if(( self = [super init] )) {
        self->foto = fotoInicial;
        self->identidadeLoja = identidadeInicial;
        self->detalheLoja = detalheLojaInicial;
        self->mainViewController = mainViewControllerInicial;
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


- (IBAction)btBaterFoto:(id)sender {
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
            ivImagem.image = imagem;        }
    }];
}

- (IBAction)btSalvarFoto:(id)sender {
    detalheLoja.ivFoto.image = ivImagem.image;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (Loja *lojaAtual in appDelegate->lojas) {
        if ([lojaAtual.identidade isEqual:identidadeLoja]) {
            lojaAtual.foto.image = ivImagem.image;
            break;
        }
    }
    [self dismissModalViewControllerAnimated:YES];
    [mainViewController.tabelaLojas reloadData];
}

- (IBAction)btRotacionarfoto:(id)sender {
    if (!rotacionado) {
        ivImagem.image = [ivImagem.image imageRotatedByDegrees:90.0];
        rotacionado=true;
    }
    ivImagem.image = [ivImagem.image imageRotatedByDegrees:90.0];
}

- (IBAction)btCancelar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}



@end
