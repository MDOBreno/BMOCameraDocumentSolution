//
//  ViewController.m
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 22/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//


#import "MainViewController.h"
#import "Loja.h"
#import "Endereco.h"
#import "DetalheLoja.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *dataUrl = @"https://raw.githubusercontent.com/MDOBreno/BMOCameraDocumentSolution/master/jsonRequest.json";
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    NSURLSessionDataTask *requisicao = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ocorreu um erro"
                                                                message:error.localizedDescription
                                                               delegate:nil
                                                      cancelButtonTitle:@"Usar arquivo local: 'lojas.plist'"
                                                      otherButtonTitles:nil, nil];
                [alert show];
                [self loadLojasPlist];
                return;
            };
            [self loadLojasJson:data];
        });
        
    }];
    [requisicao resume];
    
}


-(void) loadLojasJson:(NSData *)data {
    NSError *jsonErro = nil;
    NSJSONSerialization *jsonLojas = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonErro];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate->lojas =[[NSMutableArray alloc] init];
    for (NSDictionary *item in [jsonLojas valueForKey:@"lojas"]) {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *identidade = [item objectForKey:@"id"];
        NSString *telefone = [item objectForKey:@"telefone"];
        UIImage *foto = [UIImage imageNamed:@"Icone Vazado"];

        NSDictionary *dicioEndereco = [item objectForKey:@"endereco"];
        NSString *complemento = [dicioEndereco objectForKey:@"complemento"];
        NSString *bairro = [dicioEndereco objectForKey:@"bairro"];
        NSString *numero = [dicioEndereco objectForKey:@"numero"];
        NSString *logradouro = [dicioEndereco objectForKey:@"logradouro"];
        Endereco *endereco = [[Endereco alloc] initWithComplemento:complemento andBairro:bairro andNumero:numero andLogradouro:logradouro];

        Loja *c = [[Loja alloc] initWithNome:nome  andIdentidade:identidade andTelefone:telefone andEndereco:endereco andFoto:[[UIImageView alloc] initWithImage:foto]];
        [appDelegate->lojas addObject:c];
    // [c release];
    }
    [self.tabelaLojas reloadData];
}

-(void) loadLojasPlist {
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"lojas" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"lojas"];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate->lojas =[[NSMutableArray alloc] init];
    for (NSDictionary *item in dados) {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *identidade = [item objectForKey:@"identidade"];
        NSString *telefone = [item objectForKey:@"telefone"];
        UIImage *foto = [UIImage imageNamed:@"Icone Vazado"];
        
        NSDictionary *dicioEndereco = [item objectForKey:@"endereco"];
        NSString *complemento = [dicioEndereco objectForKey:@"complemento"];
        NSString *bairro = [dicioEndereco objectForKey:@"bairro"];
        NSString *numero = [dicioEndereco objectForKey:@"numero"];
        NSString *logradouro = [dicioEndereco objectForKey:@"logradouro"];
        Endereco *endereco = [[Endereco alloc] initWithComplemento:complemento andBairro:bairro andNumero:numero andLogradouro:logradouro];
        
        Loja *c = [[Loja alloc] initWithNome:nome  andIdentidade:identidade andTelefone:telefone andEndereco:endereco andFoto:[[UIImageView alloc] initWithImage:foto]];
        [appDelegate->lojas addObject:c];
        // [c release];
    }
    [self.tabelaLojas reloadData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate->lojas.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CelulaLojaCacheID = @"CelulaLojaCacheID";
    UITableViewCell *cell = [self.tabelaLojas dequeueReusableCellWithIdentifier:CelulaLojaCacheID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaLojaCacheID];
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Loja *loja = [appDelegate->lojas objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Loja com iD: %@", loja.identidade];
    cell.detailTextLabel.text = loja.nome;

    cell.imageView.image = loja.foto.image;
    cell.imageView.layer.cornerRadius = loja.foto.image.size.height / 4;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Loja *loja = [appDelegate->lojas objectAtIndex:indexPath.row];
    
    [self showDetalheLoja:loja];
    /*NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", loja.nome, loja.telefone];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detalhes da Loja" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];*/
    
    [self.tabelaLojas deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if (editingStyle == (NSInteger *)UITableViewCellEditingStyleDelete) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate->lojas removeObjectAtIndex:indexPath.row];
        [self.tabelaLojas reloadData];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remover";
}


-(void) showDetalheLoja:(Loja*)loja {
    DetalheLoja *dl = [[DetalheLoja alloc] initWithLoja:loja andMainViewController:self];
    
    dl.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentModalViewController:dl animated:YES];
    //[dl release];
}

/* - (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
} */

@end
