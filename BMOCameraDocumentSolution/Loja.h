//
//  Loja.h
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loja : NSObject {
    NSString *nome;
    NSString *id;
    NSString *telefone;
}

-(id) initWithNome:(NSString *) nomeInicial
       andIdentidade:(NSString *) idInicial
       andTelefone:(NSString *) telInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *telefone;

@end

NS_ASSUME_NONNULL_END
