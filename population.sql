/*************************  VAT   |      Name     |       Address_street|   Address_city | zip_code */
INSERT INTO person VALUES(12345678,'Maria Repolho','Rua da Batata, nº 29','Rebalba','2650-852');
INSERT INTO person VALUES(12032014,'Jacinto Leite','Avenida Vasco da Gama, lote 82,3F','Porto','9536-820');
INSERT INTO person VALUES(85202652,'Albertina Souza','Rua do escritor, nº 85,8D','Bobadela','6320-652');
INSERT INTO person VALUES(96520520,'Penelope Franco','Praceta Ui Ui, nº8','Amadora','8274-653');
INSERT INTO person VALUES(85264856,'John Smith','Rua Alvares Cabral, lote 56','Cascais','9525-903');
INSERT INTO person VALUES(35263686,'Maria Albertina', 'Praceta Ui Ui, nº8','Amadora','8274-653');
INSERT INTO person VALUES(98585856,'John Smith','Rua das Conchas, nº8, 1ºE','Lisboa','2500-132');
INSERT INTO person VALUES(65856663,'John Smith','Praceta da manteiga, lote 3, 5ºD', 'Castanheira do Ribatejo','8641-068');
INSERT INTO person VALUES(69630596,'Sara Pimpalho','Rua 25 de Abril, nº 74', 'Grandola','2504-974');
INSERT INTO person VALUES(78526209,'Rui Espinola','Avenida Brasil, nº 24, 11º F', 'Tomar','9853-208');
INSERT INTO person VALUES(45620852,'Renata Amorim','Rua da Serafina, nº 14', 'Picardães','8524-520');
INSERT INTO person VALUES(63065186,'Liliana Santos','Rua das Flores, nº 32','Carregado','2580-410');
INSERT INTO person VALUES(53250530,'Mário Fernandes','Rua D. Afonso Henriques, nº 6, 2ºE','Leiria','5320-632');
INSERT INTO person VALUES(63520543,'João Serra','Avenida São Paulo, nº5','Guimarães','6304-863');
INSERT INTO person VALUES(54609438,'Manuel Quintas','Rua dos queijos, n˚42','Seia','6270-789');

/*phone_number*/
/*******************************  VAT   |   phone */
INSERT INTO phone_number VALUES(12345678,'912345670');
INSERT INTO phone_number VALUES(12032014,'269358742');
INSERT INTO phone_number VALUES(85202652,'210524896');
INSERT INTO phone_number VALUES(96520520,'936210875');
INSERT INTO phone_number VALUES(85264856,'263596307');
INSERT INTO phone_number VALUES(35263686,'965423580');
INSERT INTO phone_number VALUES(98585856,'918520856');
INSERT INTO phone_number VALUES(65856663,'920520648');
INSERT INTO phone_number VALUES(69630596,'251068266');
INSERT INTO phone_number VALUES(78526209,'270352066');
INSERT INTO phone_number VALUES(45620852,'930536378');
INSERT INTO phone_number VALUES(63065186,'918206630');
INSERT INTO phone_number VALUES(53250530,'+63220185206');
INSERT INTO phone_number VALUES(63520543,'963025225');
INSERT INTO phone_number VALUES(54609438,'936723009');

/*client*/
/************************  VAT */
INSERT INTO client VALUES(12345678);
INSERT INTO client VALUES(96520520);
INSERT INTO client VALUES(35263686);
INSERT INTO client VALUES(98585856);
INSERT INTO client VALUES(65856663);
INSERT INTO client VALUES(69630596);
INSERT INTO client VALUES(78526209);
INSERT INTO client VALUES(45620852);
INSERT INTO client VALUES(85264856);
INSERT INTO client VALUES(54609438);

/*veterinary*/
/****************************   VAT    | specializaion    |    bio*/
INSERT INTO veterinary VALUES(85264856,'Cirurgia','Especialização em Cirurgia na Faculdade de Clínica Veterinária de Lisboa. Natural de Londres mas há 10 anos em Portugal.');
INSERT INTO veterinary VALUES(12032014,'Patologia Clínica','Especialização em Patologia Clínica na Faculdade de Clínica Veterinária de Lisboa. Casado, pai de 5. Muito carinho com os animais');

/*assistant*/
/***************************   VAT*/
INSERT INTO assistant VALUES(85202652);
INSERT INTO assistant VALUES(63065186);
INSERT INTO assistant VALUES(53250530);
INSERT INTO assistant VALUES(63520543);

/*species*/
/************************* name    | desc  */
INSERT INTO species VALUES('Mammal','Animais que dão de amamentar às crias');

INSERT INTO species VALUES('Cat','Animal peludo.');
INSERT INTO species VALUES('Pig','O porco doméstico(nome científico: Sus scrofa domesticus), ou simplesmente porco, é um mamífero bunodonte não-ruminante, da família dos suidae.');
	/*Birds*/
INSERT INTO species VALUES('Bird', 'Coisa que potencialmente voa.');
INSERT INTO species VALUES('Parrot Bird','Ave falante');
INSERT INTO species VALUES('Canary Bird','É um pássaro.');
INSERT INTO species VALUES('Eagle','Ave de rapina com visão ótima');
INSERT INTO species VALUES('Peacock','Ave colorida e vaidosa');
INSERT INTO species VALUES('Mockingbird','Ave de dimensão muito pequena');
INSERT INTO species VALUES('Dog','O cão (nome científico: Canis lupus familiaris),[1] no Brasil também chamado de cachorro, é um mamífero carnívoro da família dos canídeos, subespécie do lobo, e talvez o mais antigo animal domesticado pelo ser humano.');
	/*cão*/
INSERT INTO species VALUES('Afghan Hound','O porte altivo e sua silhueta ao mesmo tempo forte e flexível.');
INSERT INTO species VALUES('Affenpinscher','Esse pequeno cão de pelos rígidos, de trote muito curto e de grandes olhos redondos, possui uma expressão simiesca característica.');
INSERT INTO species VALUES('Airedale Terrier','Pelagem dura, densa e aramada, mas não tão longa. Ativo, musculoso, ágil e de movimentos rápidos e precisos. Sempre atento a tudo ao seu redor.');
INSERT INTO species VALUES('Akita','O Akita é uma grande e poderosa raça de cão, com uma presença nobre e intimidante.');
INSERT INTO species VALUES('American Staffordshire Terrier','Cão forte, de andar muito ágil.');
INSERT INTO species VALUES('Basenji','Cão bem musculoso, com andar nobre, gracioso como o de uma gazela.');
INSERT INTO species VALUES('Basset Hound','O Basset Hound é um cão sempre bem humorado. Muito tranquilo, mas sempre vigilante se torna um bom cão de guarda. Amigável com outros animais e com crianças também. Não gosta de ficar sozinho.');
INSERT INTO species VALUES('Beagle','Pequeno, compacto e resistente, Beagles são companheiros ativos para crianças e adultos. São alegres e divertidos, mas também podem ser teimosos.');
INSERT INTO species VALUES('Beagle Harrier','Como um tipico cão de caça - sempre trabalham em grupo -o gentil Harrier é extrovertido e simpático , nunca agressivo com outros cães.');
INSERT INTO species VALUES('Bearded Collie','Bearded Collie é cão de muita inteligencia, sem nenhum sinal de nervosismo ou agressividade. Muito peludo e é conhecido por pular demais e alto.');
INSERT INTO species VALUES('Bedlington Terrier','Bem humorado, tendo uma natureza afetuosa, digna, não é tímido ou agressivo. Calmo em repouso, mas cheio de coragem quando excitado.');
INSERT INTO species VALUES('Bichon Frisé','Bichons são ativos e famosos pelos "Bichon Blitz" ou "Bichon Buzz," surtos imprevisíveis de energia que causam frenesi e fazem os cães usarem o quintal ou mesmo a casa como uma pista de corrida, latindo, saltando pulando dentro e fora de móveis.');
INSERT INTO species VALUES('Bloodhound','Particularmente ligado a seu dono. Tolerante com seus companheiros de canil e outros animais domésticos. É antes de tudo reservado e obstinado. É sensível tanto aos elogios quanto às correções. Jamais agressivo. Sua voz é muito grave, mas ele não é um ladrador.');
INSERT INTO species VALUES('Bobtail','Dócil e de temperamento estável. Corajoso, fiel e confiável; não é de forma alguma tímido ou agressivo se não for provocado.');
INSERT INTO species VALUES('Australian Cattle Dog','Cão de tamanho médio é forte, sem ser pesado.');
INSERT INTO species VALUES('Bernese Mountain Dog','Confiável, atencioso, vigilante, corajoso diante de situações do cotidiano; amável e fiel para com a família; seguro de si e pacífico com estranhos; de temperamento moderado e dócil.');
INSERT INTO species VALUES('Border Collie','Muito simplesmente, o Border Collie é muito dinâmico. Sua personalidade é caracteristicamente alerta, energico, trabalhador e inteligente. Ele aprende rápido - tão rápido que às vezes é difícil ter desafios novos para ele.');
INSERT INTO species VALUES('Border Terrier','Esse Terrier tem o corpo um tanto alto e a cabeça peculiar, com grandes olhos muito expressivos.');
INSERT INTO species VALUES('Borzoi','Possui um olhar penetrante, capaz de enxergar muito longe. Sua reação é impetuosa. Cão grande, de aspecto aristocrático e grande harmonia de formas e movimentos. Não é barulhento e, como todo galgo, é um velocista nato');
INSERT INTO species VALUES('Boston Terrier','Adora brincar e passear, mas é preciso cuidado durante os exercícios físicos, pois não tolera atividades intensas nem temperaturas extremas. Pacífico, esse antigo combatente muito ativo, tornou-se um animal de companhia muito apreciado.');
INSERT INTO species VALUES('Boxer','O Boxer é muito inteligente e brincalhão, Leva muito a sério seu papel como cão de guarda. É um excelente companheiro e cuida da sua família com muito zelo.');
INSERT INTO species VALUES('French Bulldog','Frenchies são conhecidos por sua atenção tranquila. Eles seguem seus tutores por toda casa, sem fazer incomodar em nada. Quando eles querem a sua atenção, eles vão carinhosamente cutucar você com a pata.');
INSERT INTO species VALUES('English Bulldog','Cão de pelo curto, com o corpo muito perto do chão e pesado para seu tamanho');
INSERT INTO species VALUES('Bull Terrier','Fortemente estruturado e bem proporcional, esse cão ativo move-se com largas passadas, com um ritmo regular que lhe é próprio.');
INSERT INTO species VALUES('Bulmastife','Cão fortemente estruturado mas harmonioso. passa a impressão de grande força, sem ser pesado.');
INSERT INTO species VALUES('Cairn Terrier','Sua impressão geral é a de um Terrier rústico, sólido, ágil e cheio de ardor.');
INSERT INTO species VALUES('Cane Corso','Um excelente guardião muito apegado ao dono.');
INSERT INTO species VALUES('Portuguese Water Dog','Tem a expressão dura e um olhar penetrante e atento. Possui grande poder visual e apreciável sensibilidade olfativa. Nadador e mergulhador exímio e resistente, é o companheiro inseparável do pescador, a quem presta inúmeros serviços, não só pescando, mas também guardando e defendendo seu barco.');
INSERT INTO species VALUES('Estrela Mountain Dog','A inteligência, lealdade e beleza do Cão da Serra da Estrela fazem dele, para além de um cão de guarda de excelência, um óptimo cão de família.');
INSERT INTO species VALUES('Chinese Crested Dog','Ele é um excelente companheiro e é extremamente inteligente. É pequeno, gracioso, esbelto e ativo. Praticamente não tem pelos.');
INSERT INTO species VALUES('Cavalier King Charles Spaniel','O Cavalier King Charles Spaniel é pequeno, amoroso e brincalhão. O típico Cavalier está sempre feliz, confiante e descontraído, um amigo para todos que encontra. Fiel à sua herança como "cães de cachecol," Cavaliers gostam de estar em uma colo.');
INSERT INTO species VALUES('Chesapeake Bay Retriever','O Chesapeake Bay Retriever é um cão grande e elegante, de belas proporções.');
INSERT INTO species VALUES('Chihuahua','O Chihuahua é muito atento e um vigia barulhento no caso de qualquer intrusão no seu território, real ou imaginado.');
INSERT INTO species VALUES('Chow Chow','Apesar de sua carranca, um bom Chow nunca deve ser agressivo . Ele é independente e digno, normalmente se apega a uma unica pessoa.');
INSERT INTO species VALUES('American Cocker Spaniel','Ele é afetuoso, carinhoso e gosta de participar de atividades familiares. Está disposto para fazer qualquer tipo de exercício ou uma rápida caminhada.');
INSERT INTO species VALUES('English Cocker Spaniel','O Cocker Inglês é descrito como alegre e carinhoso com uma disposição constante. Ele é brincalhão, treinável, e amigável para com as pessoas (embora às vezes reservado com estranhos) e outros cães.');

/*generalization_species*/
/********************************* name1   | name2*/
INSERT INTO generalization_species VALUES('Pig','Mammal');
INSERT INTO generalization_species VALUES('Cat','Mammal');
INSERT INTO generalization_species VALUES('Dog','Mammal');
INSERT INTO generalization_species VALUES('Mockingbird','Bird');
INSERT INTO generalization_species VALUES('Peacock','Bird');
INSERT INTO generalization_species VALUES('Eagle','Bird');
INSERT INTO generalization_species VALUES('Parrot Bird','Bird');
INSERT INTO generalization_species VALUES('Canary Bird','Bird');
INSERT INTO generalization_species VALUES('Afghan Hound','Dog');
INSERT INTO generalization_species VALUES('Affenpinscher','Dog');
INSERT INTO generalization_species VALUES('Airedale Terrier','Dog');
INSERT INTO generalization_species VALUES('Akita','Dog');
INSERT INTO generalization_species VALUES('American Staffordshire Terrier','Dog');
INSERT INTO generalization_species VALUES('Basenji','Dog');
INSERT INTO generalization_species VALUES('Basset Hound','Dog');
INSERT INTO generalization_species VALUES('Beagle','Dog');
INSERT INTO generalization_species VALUES('Beagle Harrier','Dog');
INSERT INTO generalization_species VALUES('Bearded Collie','Dog');
INSERT INTO generalization_species VALUES('Bedlington Terrier','Dog');
INSERT INTO generalization_species VALUES('Bichon Frisé','Dog');
INSERT INTO generalization_species VALUES('Bloodhound','Dog');
INSERT INTO generalization_species VALUES('Bobtail','Dog');
INSERT INTO generalization_species VALUES('Australian Cattle Dog','Dog');
INSERT INTO generalization_species VALUES('Bernese Mountain Dog','Dog');
INSERT INTO generalization_species VALUES('Border Collie','Dog');
INSERT INTO generalization_species VALUES('Border Terrier','Dog');
INSERT INTO generalization_species VALUES('Borzoi','Dog');
INSERT INTO generalization_species VALUES('Boston Terrier','Dog');
INSERT INTO generalization_species VALUES('Boxer','Dog');
INSERT INTO generalization_species VALUES('French Bulldog','Dog');
INSERT INTO generalization_species VALUES('English Bulldog','Dog');
INSERT INTO generalization_species VALUES('Bull Terrier','Dog');
INSERT INTO generalization_species VALUES('Bulmastife','Dog');
INSERT INTO generalization_species VALUES('Cairn Terrier','Dog');
INSERT INTO generalization_species VALUES('Cane Corso','Dog');
INSERT INTO generalization_species VALUES('Portuguese Water Dog','Dog');
INSERT INTO generalization_species VALUES('Estrela Mountain Dog', 'Dog');
INSERT INTO generalization_species VALUES('Chinese Crested Dog','Dog');
INSERT INTO generalization_species VALUES('Cavalier King Charles Spaniel','Dog');
INSERT INTO generalization_species VALUES('Chesapeake Bay Retriever','Dog');
INSERT INTO generalization_species VALUES('Chihuahua','Dog');
INSERT INTO generalization_species VALUES('Chow Chow','Dog');
INSERT INTO generalization_species VALUES('American Cocker Spaniel','Dog');
INSERT INTO generalization_species VALUES('English Cocker Spaniel','Dog');

/*animal*/
/*********************     name |   VAT  |species_name|colour|gender|birth_year|age*/
INSERT INTO animal VALUES('Bobi',12345678,'Boxer','Brown','Male','2013',NULL);
INSERT INTO animal VALUES('Luna',12345678,'Chinese Crested Dog','White','Female','2015',NULL);
INSERT INTO animal VALUES('Pala',96520520,'Bobtail','Dark','Female','2016',NULL);
INSERT INTO animal VALUES('Onitório',96520520,'Basset Hound','Brown','Male','2013',NULL);
INSERT INTO animal VALUES('PiuPiu',35263686,'Mockingbird','Yellow','Male','2018',NULL);
INSERT INTO animal VALUES('FalaFala',69630596,'Parrot Bird','Red','Female','2011',NULL);
INSERT INTO animal VALUES('Rapina',45620852,'Eagle','Brown','Female','2014',NULL);
INSERT INTO animal VALUES('Malandro',69630596,'Parrot Bird','Yellow','Male','2013',NULL);
INSERT INTO animal VALUES('Miau',45620852,'Cat','Dark','Male','2015',NULL); 
INSERT INTO animal VALUES('Bobi',65856663,'Boston Terrier','Orange','Female','2017',NULL);
INSERT INTO animal VALUES('Riscas',45620852,'Boston Terrier','Brown','Male','2016',NULL);
INSERT INTO animal VALUES('Peggy',85264856,'Pig','Pink','Female','2015',NULL);
INSERT INTO animal VALUES('Papinhas',54609438,'Estrela Mountain Dog','Brown','Male','2018',NULL);
INSERT INTO animal VALUES('Iris',54609438,'Peacock','Green','Female','2007',NULL);
INSERT INTO animal VALUES('Matumbe',54609438,'Canary Bird','Yellow','Male','2009',NULL);

/*consult******************* name | VAT_owner | date_timestamp | s | o | a | p | VAT_client | VAT_vet | weight*/
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Bobi',12345678,'2018-09-18 18:00:01',12345678,12032014,'27');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Luna',12345678,'2018-09-18 15:52:56',12345678,12032014,'4.5');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Luna',12345678,'2018-10-18 09:25:58',12345678,12032014,'4.9');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Pala',96520520,'2018-11-01 12:46:38',96520520,85264856,'30');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) VALUES('Onitório',96520520,'2018-11-01 17:06:54',35263686,85264856,'32','This dog is obese. Give him less food.');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) VALUES('Onitório',96520520,'2018-10-01 15:24:54',35263686,12032014,'31.2','This dog is obese. Give him less food.');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Onitório',96520520,'2018-10-20 17:39:54',35263686,12032014,'30.5');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) VALUES('Miau',45620852,'2016-02-06 14:50:30',65856663,85264856,'39','Take into account obesity.');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('PiuPiu',35263686,'2018-05-15 16:35:15',35263686,12032014,'3');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,s,o,a,p) VALUES('PiuPiu',35263686,'2018-08-01 12:45:02',69630596,12032014,'6','There is excess of weight','Piupiu is obese and has a Potassium issue in the blood analysis','Has low obesity and Insect Bites','Give him desparasis - once a month');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Rapina',45620852,'2017-03-20 15:18:15',45620852,12032014,'20');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('FalaFala',69630596,'2015-12-21 25:12:00',69630596,85264856,'12');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,s) VALUES('Miau',45620852,'2017-06-15 16:25:16',45620852,85264856,'30', 'Good loss of weight');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Bobi',65856663,'2018-09-11 18:16:24',65856663,12032014,'15');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Malandro',69630596,'2015-06-16 15:16:17',69630596,85264856,'16');
INSERT into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Riscas',45620852,'2016-05-15 16:32:12',45620852,85264856,'15');
INSERT into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Pala',96520520,'2018-08-10 15:15:15',85264856,12032014,'16');
INSERT INTO consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) VALUES('Peggy',85264856,'2018-05-20 20:15:16',85264856,12032014,'13');

/*participation					name | VAT_owner | date_timestamp | VAT_assistant*/
INSERT INTO participation VALUES('Bobi',12345678,'2018-09-18 18:00:01',85202652);
INSERT INTO participation VALUES('Miau',45620852,'2017-06-15 16:25:16',85202652);
INSERT INTO participation VALUES('Onitório',96520520,'2018-10-20 17:39:54',85202652);
INSERT INTO participation VALUES('Bobi',65856663,'2018-09-11 18:16:24',85202652);
INSERT INTO participation VALUES('Malandro',69630596,'2015-06-16 15:16:17',85202652);
INSERT INTO participation VALUES('Malandro',69630596,'2015-06-16 15:16:17',63065186);
INSERT INTO participation VALUES('Rapina',45620852,'2017-03-20 15:18:15',85202652);

/*diagnosis_code*/
INSERT INTO diagnosis_code VALUES('00002','Anal Gland Disease');
INSERT INTO diagnosis_code VALUES('00008','Breast Cancer');
INSERT INTO diagnosis_code VALUES('00009','Bronchitis');
INSERT INTO diagnosis_code VALUES('00010','Cancer');
INSERT INTO diagnosis_code VALUES('00011','Canine Influenza Virus');
INSERT INTO diagnosis_code VALUES('00012','Cherry Eye');
INSERT INTO diagnosis_code VALUES('00015','Demodectic Mange');
INSERT INTO diagnosis_code VALUES('00016','Dental Disease');
INSERT INTO diagnosis_code VALUES('00017','Depression');
INSERT INTO diagnosis_code VALUES('00018','Diabetes Mellitus (Sugar Diabetes)');
INSERT INTO diagnosis_code VALUES('00019','Diarrhea');
INSERT INTO diagnosis_code VALUES('00020','Distemper');
INSERT INTO diagnosis_code VALUES('00021','Dry Eye');
INSERT INTO diagnosis_code VALUES('00023','Ear Hematoma');
INSERT INTO diagnosis_code VALUES('00025','Ear Infection - Middle');
INSERT INTO diagnosis_code VALUES('00027','Ehrlichiosis');
INSERT INTO diagnosis_code VALUES('00028','Elbow Dysplasia');
INSERT INTO diagnosis_code VALUES('00029','Enteritis');
INSERT INTO diagnosis_code VALUES('00032','Esophagus - Enlarged');
INSERT INTO diagnosis_code VALUES('00033','Eye Infection');
INSERT INTO diagnosis_code VALUES('00034','Eyelid Conditions');
INSERT INTO diagnosis_code VALUES('00035','Fecal impaction');
INSERT INTO diagnosis_code VALUES('00036','Flea Allergy');
INSERT INTO diagnosis_code VALUES('00037','Folliculitis');
INSERT INTO diagnosis_code VALUES('00045','Heartworm Infestation');
INSERT INTO diagnosis_code VALUES('00050','Hookworm Infestation');
INSERT INTO diagnosis_code VALUES('00051','Hot Spots (Acute Moist Dermatitis)');
INSERT INTO diagnosis_code VALUES('00052','Hypoglycemia');
INSERT INTO diagnosis_code VALUES('00059','kidney failure');
INSERT INTO diagnosis_code VALUES('00060','Laryngeal Paralysis');
INSERT INTO diagnosis_code VALUES('00061','Laryngitis');
INSERT INTO diagnosis_code VALUES('00062','Leukemia');
INSERT INTO diagnosis_code VALUES('00063','Lick Granuloma');
INSERT INTO diagnosis_code VALUES('00054','Lipoma');
INSERT INTO diagnosis_code VALUES('00055','Liver Disease');
INSERT INTO diagnosis_code VALUES('00056','Lyme Disease');
INSERT INTO diagnosis_code VALUES('00065','Lymphoma');
INSERT INTO diagnosis_code VALUES('09002','Obesity');

/*consult_diagnosis               code | name | VAT_owner | date_timestamp*/
INSERT INTO consult_diagnosis VALUES('00016','Bobi',12345678,'2018-09-18 18:00:01');
INSERT INTO consult_diagnosis VALUES('00051','Onitório',96520520,'2018-10-01 15:24:54');
INSERT INTO consult_diagnosis VALUES('09002','Miau',45620852,'2016-02-06 14:50:30');
INSERT INTO consult_diagnosis VALUES('09002','Onitório',96520520,'2018-10-01 15:24:54');
INSERT INTO consult_diagnosis VALUES('00059','PiuPiu',35263686,'2018-08-01 12:45:02');
INSERT INTO consult_diagnosis VALUES('09002','PiuPiu',35263686,'2018-08-01 12:45:02');
INSERT INTO consult_diagnosis VALUES('00062','Bobi',65856663,'2018-09-11 18:16:24');
INSERT INTO consult_diagnosis VALUES('00045','PiuPiu',35263686,'2018-08-01 12:45:02');
INSERT INTO consult_diagnosis VALUES('00056','PiuPiu',35263686,'2018-08-01 12:45:02');
INSERT INTO consult_diagnosis VALUES('00054','Luna',12345678,'2018-09-18 15:52:56');
INSERT INTO consult_diagnosis VALUES('00028','Rapina',45620852,'2017-03-20 15:18:15');
INSERT INTO consult_diagnosis VALUES('00060','Riscas',45620852,'2016-05-15 16:32:12');
INSERT into consult_diagnosis VALUEs('00002','Pala',96520520,'2018-08-10 15:15:15');
INSERT INTO consult_diagnosis VALUES('00060','Bobi',65856663,'2018-09-11 18:16:24');

/*medication				name | lab | dosage*/
INSERT INTO medication VALUES('levicim','emagricon','5 comprimidos de 20 mg');
INSERT INTO medication VALUES('benouron','SLS','20 comprimidos de 500 mg');
INSERT INTO medication VALUES('laxil','intestiniti','10 capsulas de 100 mL');
INSERT INTO medication VALUES('benouron','SLS','20 comprimidos de 250 mg');
INSERT INTO medication VALUES('CliniDent','Bayer','5 biscoitos');
INSERT INTO medication VALUES('PelFri','SAY','1 frasco de 1 L');
INSERT INTO medication VALUES('Brufen','JAOS','20 comprimidos de 26g');
INSERT INTO medication VALUES('Figaro','Figo','1 frasco de 0.5L');
INSERT INTO medication VALUES('RiLimp','BTW','1 pomada de 250 mL');
INSERT INTO medication VALUES('Desparasis','TiraBicho','3 Capsulas de 20 mL');
INSERT INTO medication VALUES('Bracite','Novosso','25 comprimidos de 150 mg');

/*prescription              code | name | VAT_owner | date_timestamp | name_med | lab | dosage | regime*/
INSERT INTO prescription VALUES('00016','Bobi',12345678,'2018-09-18 18:00:01','CliniDent','Bayer','5 biscoitos','Dar 1 por dia');
INSERT INTO prescription VALUES('00016','Bobi',12345678,'2018-09-18 18:00:01','benouron','SLS','20 comprimidos de 250 mg','1 comprimido de 8 em 8 horas');
INSERT INTO prescription VALUES('09002','Miau',45620852,'2016-02-06 14:50:30','levicim','emagricon','5 comprimidos de 20 mg','1 comprimido por dia');
INSERT INTO prescription VALUES('09002','Miau',45620852,'2016-02-06 14:50:30','laxil','intestiniti','10 capsulas de 100 mL','1 comprimido por dia');
INSERT INTO prescription VALUES('09002','Onitório',96520520,'2018-10-01 15:24:54','levicim','emagricon','5 comprimidos de 20 mg','2 comprimido por dia');
INSERT INTO prescription VALUES('09002','Onitório',96520520,'2018-10-01 15:24:54','laxil','intestiniti','10 capsulas de 100 mL','1 comprimido por dia');
INSERT INTO prescription VALUES('09002','PiuPiu',35263686,'2018-08-01 12:45:02','levicim','emagricon','5 comprimidos de 20 mg','0.5 comprimido por dia');
INSERT INTO prescription VALUES('09002','PiuPiu',35263686,'2018-08-01 12:45:02','laxil','intestiniti','10 capsulas de 100 mL','0.5 comprimido por dia');
INSERT INTO prescription VALUES('00045','PiuPiu',35263686,'2018-08-01 12:45:02','Desparasis','TiraBicho','3 Capsulas de 20 mL','1 capsula por mês');
INSERT INTO prescription VALUES('00028','Rapina',45620852,'2017-03-20 15:18:15','Bracite','Novosso','25 comprimidos de 150 mg','1 comprimido por dia');
INSERT INTO prescription VALUES('00028','Rapina',45620852,'2017-03-20 15:18:15','Brufen','JAOS','20 comprimidos de 26g','1 comprimido de 8 em 8 horas');
INSERT INTO prescription VALUES('00028','Rapina',45620852,'2017-03-20 15:18:15','benouron','SLS','20 comprimidos de 250 mg','1 comprimido por dia');
INSERT INTO prescription VALUES('00028','Rapina',45620852,'2017-03-20 15:18:15','benouron','SLS','20 comprimidos de 500 mg','1 comprimido por dia');


/*indicator					name | reference_value | units | description*/
INSERT INTO indicator VALUES('Blood-Sodium',320,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-Potassium',17.5,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-Chloride',355,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-Ionized Calcium',4.4,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-Total Calcium',9,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-Total Serum Iron',100,'micrograms','Medido em ug/dL');
INSERT INTO indicator VALUES('Blood-Magnesium',2,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Blood-cholesterol',140,'milligrams','Medido em mg/dL');
INSERT INTO indicator VALUES('Urine-Potassium',60,'millimole','Medido em mmol/24h'); 
INSERT INTO indicator VALUES('Urine-Protein',10,'milligrams','Medido em mg/dL'); 
INSERT INTO indicator VALUES('Urine-Urea',16,'grams','Medido em g/24h'); 
INSERT INTO indicator VALUES('Urine-Uric Acid',400,'milligrams','Medido em mg/24h'); 
INSERT INTO indicator VALUES('Urine-pH',6,'pH','Sem unidade');
INSERT INTO indicator VALUES('creatinine level',0.5,'milligrams','Medido em mg/24h');


/*_procedure				name | VAT_owner | date_timestamp | num | description*/
INSERT INTO _procedure VALUES('PiuPiu',35263686,'2018-08-01 12:45:02',1042,'Kidney transplant');
INSERT INTO _procedure VALUES('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'Blood test');
INSERT INTO _procedure VALUES('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood test');
INSERT INTO _procedure VALUES('Rapina',45620852,'2017-03-20 15:18:15',2903,'Elbow X-ray');
INSERT INTO _procedure VALUES('Rapina',45620852,'2017-03-20 15:18:15',1892,'Elbow joint operation');


/*test_procedure			name | VAT_owner | date_timestamp | num | type*/
INSERT INTO test_procedure VALUES('Luna',12345678,'2018-09-18 15:52:56',6136,'blood');
INSERT INTO test_procedure VALUES('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'blood');
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();
-- INSERT INTO test_procedure VALUES();


/*radiography				name | VAT_owner | date_timestamp | num | file*/
INSERT INTO radiography VALUES('Rapina',45620852,'2017-03-20 15:18:15',2903,'/Users/Vet/Documents/RapinaElbow.xray');


/*produced_indicator		name | VAT_owner | date_timestamp | num | indicator_name | value*/
INSERT INTO produced_indicator VALUES('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Sodium',322);
INSERT INTO produced_indicator VALUES('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Total Serum Iron',150);
INSERT INTO produced_indicator VALUES('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Ionized Calcium',4.4);
INSERT INTO produced_indicator VALUES('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'creatinine level',1.1);
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();
-- INSERT INTO produced_indicator VALUES();


/*performed					name | VAT_owner | date_timestamp | num | VAT_assistant*/
INSERT INTO performed VALUES('Rapina',45620852,'2017-03-20 15:18:15',2903,85202652);