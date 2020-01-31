//
//  ViewController.m
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 22/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <RestKit/RestKit.h>

#import "MainViewController.h"
#import "Loja.h"
#import "Endereco.h"
#import "DetalheLoja.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadLojas];
}

-(void) loadLojas {
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"lojas" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"lojas"];
    
    lojas =[[NSMutableArray alloc] init];
    for (NSDictionary *item in dados) {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *identidade = [item objectForKey:@"identidade"];
        NSString *telefone = [item objectForKey:@"telefone"];
        UIImage *foto = [UIImage imageNamed:@"Icone Preenchido"];
        
        NSDictionary *dicioEndereco = [item objectForKey:@"endereco"];
        NSString *complemento = [dicioEndereco objectForKey:@"complemento"];
        NSString *bairro = [dicioEndereco objectForKey:@"bairro"];
        NSString *numero = [dicioEndereco objectForKey:@"numero"];
        NSString *logradouro = [dicioEndereco objectForKey:@"logradouro"];
        Endereco *endereco = [[Endereco alloc] initWithComplemento:complemento andBairro:bairro andNumero:numero andLogradouro:logradouro];
        
        Loja *c = [[Loja alloc] initWithNome:nome  andIdentidade:identidade andTelefone:telefone andEndereco:endereco andFoto:[[UIImageView alloc] initWithImage:foto]];
        [lojas addObject:c];
        // [c release];
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return lojas.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CelulaLojaCacheID = @"CelulaLojaCacheID";
    UITableViewCell *cell = [self.tabelaLojas dequeueReusableCellWithIdentifier:CelulaLojaCacheID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaLojaCacheID];
    }
    
    Loja *loja = [lojas objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Loja com iD: %@", loja.identidade];
    cell.detailTextLabel.text = loja.nome;
    
    UIImage *icone = [UIImage imageNamed:@"Icone Preenchido"];
    cell.imageView.image = icone;
    cell.imageView.layer.cornerRadius = icone.size.height / 4;
    cell.imageView.layer.masksToBounds = YES;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Loja *loja = [lojas objectAtIndex:indexPath.row];
    
    [self showDetalheLoja:loja];
    /*NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", loja.nome, loja.telefone];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detalhes da Loja" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];*/
    
    [self.tabelaLojas deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if (editingStyle == (NSInteger *)UITableViewCellEditingStyleDelete) {
        [lojas removeObjectAtIndex:indexPath.row];
        [self.tabelaLojas reloadData];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remover";
}


-(void) showDetalheLoja:(Loja*)loja {
    DetalheLoja *dl = [[DetalheLoja alloc] initWithLoja:loja];
    
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
