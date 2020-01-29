//
//  ViewController.m
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 22/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import "HomeViewController.h"
#import "Loja.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadContacts];
}

-(void) loadContacts {
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"lojas" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"lojas"];
    
    lojas =[[NSMutableArray alloc] init];
    for (NSDictionary *item in dados) {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *telefone = [item objectForKey:@"telefone"];
        
        Loja *c = [[Loja alloc] initWithNome:nome andTelefone:telefone];
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
        cell = /* [ */[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle/*Default*//*Value1*//*Value2*/ reuseIdentifier:CelulaLojaCacheID] /* autorelease] */;
    }
    
    Loja *loja = [lojas objectAtIndex:indexPath.row];
    cell.textLabel.text = loja.nome;
    cell.detailTextLabel.text = loja.telefone;
    
    return cell;
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
