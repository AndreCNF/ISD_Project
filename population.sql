/*************************  VAT   |      Name     |       Address_street|   Address_city | zip_code */
insert into person values(12345678,'Maria Repolho','Rua da Batata, nº 29','Rebalba','2650-852');
insert into person values(12032014,'Jacinto Leite','Avenida Vasco da Gama, lote 82,3F','Porto','9536-820');
insert into person values(85202652,'Albertina Souza','Rua do escritor, nº 85,8D','Bobadela','6320-652');
insert into person values(96520520,'Penelope Franco','Praceta Ui Ui, nº8','Amadora','8274-653');
insert into person values(85264856,'John Smith','Rua Alvares Cabral, lote 56','Cascais','9525-903');
insert into person values(35263686,'Maria Albertina', 'Praceta Ui Ui, nº8','Amadora','8274-653');
insert into person values(98585856,'João Alves','Rua das Conchas, nº8, 1ºE','Lisboa','2500-132');
insert into person values(65856663,'Tiago Vasques','Praceta da manteiga, lote 3, 5ºD', 'Castanheira do Ribatejo','8641-068');
insert into person values(69630596,'Sara Pimpalho','Rua 25 de Abril, nº 74', 'Grandola','2504-974');
insert into person values(78526209,'Rui Espinola','Avenida Brasil, nº 24, 11º F', 'Tomar','9853-208');
insert into person values(45620852,'Renata Amorim','Rua da Serafina, nº 14', 'Picardães','8524-520');
insert into person values(63065186,'Liliana Santos','Rua das Flores, nº 32','Carregado','2580-410');
insert into person values(53250530,'Mário Fernandes','Rua D. Afonso Henriques, nº 6, 2ºE','Leiria','5320-632');
insert into person values(63520543,'João Serra','Avinida São Paulo, nº5','Guimarães','6304-863');

/*phone_number*/
/*******************************  VAT   |   phone */
insert into phone_number values(12345678,'912345670');
insert into phone_number values(12032014,'269358742');
insert into phone_number values(85202652,'210524896');
insert into phone_number values(96520520,'936210875');
insert into phone_number values(85264856,'263596307');
insert into phone_number values(35263686,'965423580');
insert into phone_number values(98585856,'918520856');
insert into phone_number values(65856663,'920520648');
insert into phone_number values(69630596,'251068266');
insert into phone_number values(78526209,'270352066');
insert into phone_number values(45620852,'930536378');
insert into phone_number values(63065186,'918206630');
insert into phone_number values(53250530,'+63220185206');
insert into phone_number values(63520543,'963025225');

/*client*/
/************************  VAT */
insert into client values(12345678);
insert into client values(96520520);
insert into client values(35263686);
insert into client values(98585856);
insert into client values(65856663);
insert into client values(69630596);
insert into client values(78526209);
insert into client values(45620852);
insert into client values(85264856);

/*veterinary*/
/****************************   VAT    | specializaion    |    bio*/
insert into veterinary values(85264856,'Cirurgia','Especialização em Cirurgia na Faculdade de Clínica Veterinária de Lisboa. Natural de Londres mas há 10 anos em Portugal.');
insert into veterinary values(12032014,'Patologia Clínica','Especialização em Patologia Clínica na Faculdade de Clínica Veterinária de Lisboa. Casado, pai de 5. Muito carinho com os animais');

/*assistant*/
/***************************   VAT*/
insert into assistant values(85202652);
insert into assistant values(63065186);
insert into assistant values(53250530);
insert into assistant values(63520543);

/*species*/
/************************* name    | desc  */
insert into species values('Mammal','Animais que dão de amamentar às crias');

insert into species values('Cat','Animal peludo.');
insert into species values('Pig','O porco doméstico(nome científico: Sus scrofa domesticus), ou simplesmente porco, é um mamífero bunodonte não-ruminante, da família dos suidae.');
	/*Birds*/
insert into species values('Bird', 'Coisa que potencialmente voa.');
insert into species values('Papagaio','Ave falante');
insert into species values('Canário','É um pássaro.');
insert into species values('Águia','Ave de rapina com visão ótima');
insert into species values('Pavão','Ave colorida e vaidosa');
insert into species values('Piriquito','Ave de dimensão muito pequena');
insert into species values('Dog','O cão (nome científico: Canis lupus familiaris),[1] no Brasil também chamado de cachorro, é um mamífero carnívoro da família dos canídeos, subespécie do lobo, e talvez o mais antigo animal domesticado pelo ser humano.');
	/*cão*/
insert into species values('Afegão Hound','O porte altivo e sua silhueta ao mesmo tempo forte e flexível.');
insert into species values('Affenpinscher','Esse pequeno cão de pelos rígidos, de trote muito curto e de grandes olhos redondos, possui uma expressão simiesca característica.');
insert into species values('Airedale Terrier','Pelagem dura, densa e aramada, mas não tão longa. Ativo, musculoso, ágil e de movimentos rápidos e precisos. Sempre atento a tudo ao seu redor.');
insert into species values('Akita','O Akita é uma grande e poderosa raça de cão, com uma presença nobre e intimidante.');
insert into species values('American Staffordshire Terrier','Cão forte, de andar muito ágil.');
insert into species values('Basenji','Cão bem musculoso, com andar nobre, gracioso como o de uma gazela.');
insert into species values('Basset Hound','O Basset Hound é um cão sempre bem humorado. Muito tranquilo, mas sempre vigilante se torna um bom cão de guarda. Amigável com outros animais e com crianças também. Não gosta de ficar sozinho.');
insert into species values('Beagle','Pequeno, compacto e resistente, Beagles são companheiros ativos para crianças e adultos. São alegres e divertidos, mas também podem ser teimosos.');
insert into species values('Beagle Harrier','Como um tipico cão de caça - sempre trabalham em grupo -o gentil Harrier é extrovertido e simpático , nunca agressivo com outros cães.');
insert into species values('Bearded Collie','Bearded Collie é cão de muita inteligencia, sem nenhum sinal de nervosismo ou agressividade. Muito peludo e é conhecido por pular demais e alto.');
insert into species values('Bedlington Terrier','Bem humorado, tendo uma natureza afetuosa, digna, não é tímido ou agressivo. Calmo em repouso, mas cheio de coragem quando excitado.');
insert into species values('Bichon Frisé','Bichons são ativos e famosos pelos "Bichon Blitz" ou "Bichon Buzz," surtos imprevisíveis de energia que causam frenesi e fazem os cães usarem o quintal ou mesmo a casa como uma pista de corrida, latindo, saltando pulando dentro e fora de móveis.');
insert into species values('Bloodhound','Particularmente ligado a seu dono. Tolerante com seus companheiros de canil e outros animais domésticos. É antes de tudo reservado e obstinado. É sensível tanto aos elogios quanto às correções. Jamais agressivo. Sua voz é muito grave, mas ele não é um ladrador.');
insert into species values('Bobtail','Dócil e de temperamento estável. Corajoso, fiel e confiável; não é de forma alguma tímido ou agressivo se não for provocado.');
insert into species values('Boiadeiro Australiano','sse cão de tamanho médio é forte, sem ser pesado.');
insert into species values('Boiadeiro Bernês','Confiável, atencioso, vigilante, corajoso diante de situações do cotidiano; amável e fiel para com a família; seguro de si e pacífico com estranhos; de temperamento moderado e dócil.');
insert into species values('Border Collie','Muito simplesmente, o Border Collie é muito dinâmico. Sua personalidade é caracteristicamente alerta, energico, trabalhador e inteligente. Ele aprende rápido - tão rápido que às vezes é difícil ter desafios novos para ele.');
insert into species values('Border Terrier','Esse Terrier tem o corpo um tanto alto e a cabeça peculiar, com grandes olhos muito expressivos.');
insert into species values('Borzoi','Possui um olhar penetrante, capaz de enxergar muito longe. Sua reação é impetuosa. Cão grande, de aspecto aristocrático e grande harmonia de formas e movimentos. Não é barulhento e, como todo galgo, é um velocista nato');
insert into species values('Boston Terrier','Adora brincar e passear, mas é preciso cuidado durante os exercícios físicos, pois não tolera atividades intensas nem temperaturas extremas. Pacífico, esse antigo combatente muito ativo, tornou-se um animal de companhia muito apreciado.');
insert into species values('Boxer','O Boxer é muito inteligente e brincalhão, Leva muito a sério seu papel como cão de guarda. É um excelente companheiro e cuida da sua família com muito zelo.');
insert into species values('Buldogue Francês','Frenchies são conhecidos por sua atenção tranquila. Eles seguem seus tutores por toda casa, sem fazer incomodar em nada. Quando eles querem a sua atenção, eles vão carinhosamente cutucar você com a pata.');
insert into species values('Buldogue Inglês','Cão de pelo curto, com o corpo muito perto do chão e pesado para seu tamanho');
insert into species values('Bull Terrier','Fortemente estruturado e bem proporcional, esse cão ativo move-se com largas passadas, com um ritmo regular que lhe é próprio.');
insert into species values('Bulmastife','Cão fortemente estruturado mas harmonioso. passa a impressão de grande força, sem ser pesado.');
insert into species values('Cairn Terrier','Sua impressão geral é a de um Terrier rústico, sólido, ágil e cheio de ardor.');
insert into species values('Cane Corso','Um excelente guardião muito apegado ao dono.');
insert into species values('Cão de Água Português','Tem a expressão dura e um olhar penetrante e atento. Possui grande poder visual e apreciável sensibilidade olfativa. Nadador e mergulhador exímio e resistente, é o companheiro inseparável do pescador, a quem presta inúmeros serviços, não só pescando, mas também guardando e defendendo seu barco.');
insert into species values('Cão de Crista Chinês','Ele é um excelente companheiro e é extremamente inteligente. É pequeno, gracioso, esbelto e ativo. Praticamente não tem pelos.');
insert into species values('Cavalier King Charles Spaniel','O Cavalier King Charles Spaniel é pequeno, amoroso e brincalhão. O típico Cavalier está sempre feliz, confiante e descontraído, um amigo para todos que encontra. Fiel à sua herança como "cães de cachecol," Cavaliers gostam de estar em uma colo.');
insert into species values('Chesapeake Bay Retriever','O Chesapeake Bay Retriever é um cão grande e elegante, de belas proporções.');
insert into species values('Chihuahua','O Chihuahua é muito atento e um vigia barulhento no caso de qualquer intrusão no seu território, real ou imaginado.');
insert into species values('Chow Chow','Apesar de sua carranca, um bom Chow nunca deve ser agressivo . Ele é independente e digno, normalmente se apega a uma unica pessoa.');
insert into species values('Cocker Spaniel Americano','Ele é afetuoso, carinhoso e gosta de participar de atividades familiares. Está disposto para fazer qualquer tipo de exercício ou uma rápida caminhada.');
insert into species values('Cocker Spaniel Inglês','O Cocker Inglês é descrito como alegre e carinhoso com uma disposição constante. Ele é brincalhão, treinável, e amigável para com as pessoas (embora às vezes reservado com estranhos) e outros cães.');

/*generalization_species*/
/********************************* name1   | name2*/
insert into generalization_species values('Pig','Mammal');
insert into generalization_species values('Cat','Mammal');
insert into generalization_species values('Dog','Mammal');
insert into generalization_species values('Piriquito','Bird');
insert into generalization_species values('Pavão','Bird');
insert into generalization_species values('Águia','Bird');
insert into generalization_species values('Papagaio','Bird');
insert into generalization_species values('Canário','Bird');
insert into generalization_species values('Afegão Hound','Dog');
insert into generalization_species values('Affenpinscher','Dog');
insert into generalization_species values('Airedale Terrier','Dog');
insert into generalization_species values('Akita','Dog');
insert into generalization_species values('American Staffordshire Terrier','Dog');
insert into generalization_species values('Basenji','Dog');
insert into generalization_species values('Basset Hound','Dog');
insert into generalization_species values('Beagle','Dog');
insert into generalization_species values('Beagle Harrier','Dog');
insert into generalization_species values('Bearded Collie','Dog');
insert into generalization_species values('Bedlington Terrier','Dog');
insert into generalization_species values('Bichon Frisé','Dog');
insert into generalization_species values('Bloodhound','Dog');
insert into generalization_species values('Bobtail','Dog');
insert into generalization_species values('Boiadeiro Australiano','Dog');
insert into generalization_species values('Boiadeiro Bernês','Dog');
insert into generalization_species values('Border Collie','Dog');
insert into generalization_species values('Border Terrier','Dog');
insert into generalization_species values('Borzoi','Dog');
insert into generalization_species values('Boston Terrier','Dog');
insert into generalization_species values('Boxer','Dog');
insert into generalization_species values('Buldogue Francês','Dog');
insert into generalization_species values('Buldogue Inglês','Dog');
insert into generalization_species values('Bull Terrier','Dog');
insert into generalization_species values('Bulmastife','Dog');
insert into generalization_species values('Cairn Terrier','Dog');
insert into generalization_species values('Cane Corso','Dog');
insert into generalization_species values('Cão de Água Português','Dog');
insert into generalization_species values('Cão de Crista Chinês','Dog');
insert into generalization_species values('Cavalier King Charles Spaniel','Dog');
insert into generalization_species values('Chesapeake Bay Retriever','Dog');
insert into generalization_species values('Chihuahua','Dog');
insert into generalization_species values('Chow Chow','Dog');
insert into generalization_species values('Cocker Spaniel Americano','Dog');
insert into generalization_species values('Cocker Spaniel Inglês','Dog');

/*animal*/
/*********************     name |   VAT  |species_name|colour|gender|birth_year|age*/
insert into animal values('Bobi',12345678,'Boxer','castanho','masculino','2013',null);
insert into animal values('Luna',12345678,'Cão de Crista Chinês','branco','feminino','2015',null);
insert into animal values('Pala',96520520,'Bobtail','preto','feminino','2016',null);
insert into animal values('Onitório',96520520,'Basset Hound','castanho','masculino','2013',null);
insert into animal values('PiuPiu',35263686,'Piriquito','Amarelo','masculino','2018',null);
insert into animal values('FalaFala',69630596,'Papagaio','Vermelho','feminino','2011',null);
insert into animal values('Rapina',45620852,'Aguia','Castanho','feminino','2014',null);
insert into animal values('Malandro',69630596,'Papagaio','Amarelo','masculino','2013',null);
insert into animal values('Miau',45620852,'Cat','Preto','masculino','2015',null); 
insert into animal values('Bobi',65856663,'Boston Terrier','Laranja','feminino','2017',null);
insert into animal values('Riscas',45620852,'Boston Terrier','Castanho','masculino','2016',null);
insert into animal values('Peggy',85264856,'Pig','Rosa','feminino','2015',null);

/*consult******************* name | VAT_owner | date_timestamp | s | o | a | p | VAT_client | VAT_vet | weight*/
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Bobi',12345678,'2018-09-18 18:00:01',12345678,12032014,'27');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Luna',12345678,'2018-09-18 15:52:56',12345678,12032014,'4.5');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Luna',12345678,'2018-10-18 09:25:58',12345678,12032014,'4.9');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Pala',96520520,'2018-11-01 12:46:38',96520520,85264856,'30');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) values('Onitório',96520520,'2018-11-01 17:06:54',35263686,85264856,'32','This dog is obese. Give him less food.');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) values('Onitório',96520520,'2018-10-01 15:24:54',35263686,12032014,'31.2','This dog is obese. Give him less food.');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Onitório',96520520,'2018-10-20 17:39:54',35263686,12032014,'30.5');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,o) values('Miau',45620852,'2016-02-06 14:50:30',65856663,85264856,'39','Take into account obesity.');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('PiuPiu',35263686,'2018-05-15 16:35:15',35263686,12032014,'3');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,s,o,a,p) values('PiuPiu',35263686,'2018-08-01 12:45:02',69630596,12032014,'6','There is excess of weight','Piupiu is obese and has a Potassium issue in the blood analysis','Has low obesity and Insect Bites','Give him desparasis - once a month');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Rapina',45620852,'2017-03-20 15:18:15',45620852,12032014,'20');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('FalaFala',69630596,'2015-12-21 25:12:00',69630596,85264856,'12');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight,s) values('Miau',45620852,'2017-06-15 16:25:16',45620852,85264856,'30', 'Good loss of weight');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Bobi',65856663,'2018-09-11 18:16:24',65856663,12032014,'15');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Malandro',69630596,'2015-06-16 15:16:17',69630596,85264856,'16');
INSERT into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Riscas',45620852,'2016-05-15 16:32:12',45620852,85264856,'15');
INSERT into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Pala',96520520,'2018-08-10 15:15:15',85264856,12032014,'16');
insert into consult(name,VAT_owner,date_timestamp,VAT_client,VAT_vet,weight) values('Peggy',85264856,'2018-05-20 20:15:16',85264856,12032014,'13');

/*participation					name | VAT_owner | date_timestamp | VAT_assistant*/
insert into participation values('Bobi',12345678,'2018-09-18 18:00:01',85202652);
insert into participation values('Miau',45620852,'2017-06-15 16:25:16',85202652);
insert into participation values('Onitório',96520520,'2018-10-20 17:39:54',85202652);
insert into participation values('Bobi',65856663,'2018-09-11 18:16:24',85202652);
insert into participation values('Malandro',69630596,'2015-06-16 15:16:17',85202652);
insert into participation values('Malandro',69630596,'2015-06-16 15:16:17',63065186);

/*diagnosis_code*/
insert into diagnosis_code values('00000','Allergies - Flea');
insert into diagnosis_code values('00001','Allergies - Food');
insert into diagnosis_code values('00002','Allergies - Skin');
insert into diagnosis_code values('00003','Anal Gland Disease');
insert into diagnosis_code values('00004','Arthritis');
insert into diagnosis_code values('00005','Bladder Stones');
insert into diagnosis_code values('00006','Bloat');
insert into diagnosis_code values('00007','Bone Cancer');
insert into diagnosis_code values('00008','Breast Cancer');
insert into diagnosis_code values('00009','Bronchitis');
insert into diagnosis_code values('00010','Cancer');
insert into diagnosis_code values('00011','Canine Influenza Virus');
insert into diagnosis_code values('00012','Cherry Eye');
insert into diagnosis_code values('00013','Cysts');
insert into diagnosis_code values('00014','Deafness');
insert into diagnosis_code values('00015','Demodectic Mange');
insert into diagnosis_code values('00016','Dental Disease');
insert into diagnosis_code values('00017','Depression');
insert into diagnosis_code values('00018','Diabetes Mellitus (Sugar Diabetes)');
insert into diagnosis_code values('00019','Diarrhea');
insert into diagnosis_code values('00020','Distemper');
insert into diagnosis_code values('00021','Dry Eye');
insert into diagnosis_code values('00022','Ear Conditions');
insert into diagnosis_code values('00023','Ear Hematoma');
insert into diagnosis_code values('00024','Ear Infection - External');
insert into diagnosis_code values('00025','Ear Infection - Middle');
insert into diagnosis_code values('00026','Ear Mites');
insert into diagnosis_code values('00027','Ehrlichiosis');
insert into diagnosis_code values('00028','Elbow Dysplasia');
insert into diagnosis_code values('00029','Enteritis');
insert into diagnosis_code values('00030','Entropion');
insert into diagnosis_code values('00031','Epiphora');
insert into diagnosis_code values('00032','Esophagus - Enlarged');
insert into diagnosis_code values('00033','Eye Infection');
insert into diagnosis_code values('00034','Eyelid Conditions');
insert into diagnosis_code values('00035','Fecal impaction');
insert into diagnosis_code values('00036','Flea Allergy');
insert into diagnosis_code values('00037','Folliculitis');
insert into diagnosis_code values('00038','Foreign Body (Intestinal)');
insert into diagnosis_code values('00039','Foreign Body (Nasal and Oral)');
insert into diagnosis_code values('00040','Fractures');
insert into diagnosis_code values('00041','Frostbite');
insert into diagnosis_code values('00042','Gastritis');
insert into diagnosis_code values('00043','Glaucoma');
insert into diagnosis_code values('00044','Head Injuries');
insert into diagnosis_code values('00045','Heartworm Infestation');
insert into diagnosis_code values('00046','Heat Stroke');
insert into diagnosis_code values('00047','Herpes Virus');
insert into diagnosis_code values('00048','Hip Dysplasia');
insert into diagnosis_code values('00049','Histoplasmosis');
insert into diagnosis_code values('00050','Hookworm Infestation');
insert into diagnosis_code values('00051','Hot Spots (Acute Moist Dermatitis)');
insert into diagnosis_code values('00052','Hypoglycemia');
insert into diagnosis_code values('00053','Hypothyroidism');
insert into diagnosis_code values('00054','Incontinence (Urinary)');
insert into diagnosis_code values('00055','Inflammatory Bowel Disease');
insert into diagnosis_code values('00056','Insect Bites');
insert into diagnosis_code values('00057','Intestinal Obstruction');
insert into diagnosis_code values('00058','Kennel Cough');
insert into diagnosis_code values('00059','kidney failure');
insert into diagnosis_code values('00060','Laryngeal Paralysis');
insert into diagnosis_code values('00061','Laryngitis');
insert into diagnosis_code values('00062','Leukemia');
insert into diagnosis_code values('00063','Lick Granuloma');
insert into diagnosis_code values('00064','Lipoma');
insert into diagnosis_code values('00065','Liver Disease');
insert into diagnosis_code values('00066','Lyme Disease');
insert into diagnosis_code values('00067','Lymphoma');
insert into diagnosis_code values('09002','Obesity');

/*consult_diagnosis               code | name | VAT_owner | date_timestamp*/
insert into consult_diagnosis values('00016','Bobi',12345678,'2018-09-18 18:00:01');
insert into consult_diagnosis values('00051','Onitório',96520520,'2018-10-01 15:24:54');
insert into consult_diagnosis values('09002','Miau',45620852,'2016-02-06 14:50:30');
insert into consult_diagnosis values('09002','Onitório',96520520,'2018-10-01 15:24:54');
insert into consult_diagnosis values('00059','PiuPiu',35263686,'2018-08-01 12:45:02');
insert into consult_diagnosis values('09002','PiuPiu',35263686,'2018-08-01 12:45:02');
insert into consult_diagnosis values('00062','Bobi',65856663,'2018-09-11 18:16:24');
insert into consult_diagnosis values('00045','PiuPiu',35263686,'2018-08-01 12:45:02');
insert into consult_diagnosis values('00056','PiuPiu',35263686,'2018-08-01 12:45:02');
insert into consult_diagnosis values('00054','Luna',12345678,'2018-09-18 15:52:56');
insert into consult_diagnosis values('00028','Rapina',45620852,'2017-03-20 15:18:15');
insert into consult_diagnosis values('00060','Riscas',45620852,'2016-05-15 16:32:12');
INSERT into consult_diagnosis VALUEs('00002','Pala',96520520,'2018-08-10 15:15:15');
insert into consult_diagnosis values('00060','Bobi',65856663,'2018-09-11 18:16:24');
/*medication				name | lab | dosage*/
insert into medication values('levicim','emagricon','5 comprimidos de 20 mg');
insert into medication values('benouron','SLS','20 comprimidos de 500 mg');
insert into medication values('laxil','intestiniti','10 capsulas de 100 mL');
insert into medication values('benouron','SLS','20 comprimidos de 250 mg');
insert into medication values('CliniDent','Bayer','5 biscoitos');
insert into medication values('PelFri','SAY','1 frasco de 1 L');
insert into medication values('Brufen','JAOS','20 comprimidos de 26g');
insert into medication values('Figaro','Figo','1 frasco de 0.5L');
insert into medication values('RiLimp','BTW','1 pomada de 250 mL');
insert into medication values('Desparasis','TiraBicho','3 Capsulas de 20 mL');
insert into medication values('Bracite','Novosso','25 comprimidos de 150 mg');

/*prescription              code | name | VAT_owner | date_timestamp | name_med | lab | dosage | regime*/
insert into prescription values('00016','Bobi',12345678,'2018-09-18 18:00:01','CliniDent','Bayer','5 biscoitos','Dar 1 por dia');
insert into prescription values('00016','Bobi',12345678,'2018-09-18 18:00:01','benouron','SLS','20 comprimidos de 250 mg','1 comprimido de 8 em 8 horas');
insert into prescription values('09002','Miau',45620852,'2016-02-06 14:50:30','levicim','emagricon','5 comprimidos de 20 mg','1 comprimido por dia');
insert into prescription values('09002','Miau',45620852,'2016-02-06 14:50:30','laxil','intestiniti','10 capsulas de 100 mL','1 comprimido por dia');
insert into prescription values('09002','Onitório',96520520,'2018-10-01 15:24:54','levicim','emagricon','5 comprimidos de 20 mg','2 comprimido por dia');
insert into prescription values('09002','Onitório',96520520,'2018-10-01 15:24:54','laxil','intestiniti','10 capsulas de 100 mL','1 comprimido por dia');
insert into prescription values('09002','PiuPiu',35263686,'2018-08-01 12:45:02','levicim','emagricon','5 comprimidos de 20 mg','0.5 comprimido por dia');
insert into prescription values('09002','PiuPiu',35263686,'2018-08-01 12:45:02','laxil','intestiniti','10 capsulas de 100 mL','0.5 comprimido por dia');
insert into prescription values('00045','PiuPiu',35263686,'2018-08-01 12:45:02','Desparasis','TiraBicho','3 Capsulas de 20 mL','1 capsula por mês');
insert into prescription values('00028','Rapina',45620852,'2017-03-20 15:18:15','Bracite','Novosso','25 comprimidos de 150 mg','1 comprimido por dia');
insert into prescription values('00028','Rapina',45620852,'2017-03-20 15:18:15','Brufen','JAOS','20 comprimidos de 26g','1 comprimido de 8 em 8 horas');
insert into prescription values('00028','Rapina',45620852,'2017-03-20 15:18:15','benouron','SLS','20 comprimidos de 250 mg','1 comprimido por dia');
insert into prescription values('00028','Rapina',45620852,'2017-03-20 15:18:15','benouron','SLS','20 comprimidos de 500 mg','1 comprimido por dia');


/*indicator					name | reference_value | units | description*/
insert into indicator values('Blood-Sodium',320,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-Potassium',17.5,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-Chloride',355,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-Ionized Calcium',4.4,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-Total Calcium',9,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-Total Serum Iron',100,'micrograms','Medido em ug/dL');
insert into indicator values('Blood-Magnesium',2,'milligrams','Medido em mg/dL');
insert into indicator values('Blood-cholesterol',140,'milligrams','Medido em mg/dL');
insert into indicator values('Urine-Potassium',60,'millimole','Medido em mmol/24h'); 
insert into indicator values('Urine-Protein',10,'milligrams','Medido em mg/dL'); 
insert into indicator values('Urine-Urea',16,'grams','Medido em g/24h'); 
insert into indicator values('Urine-Uric Acid',400,'milligrams','Medido em mg/24h'); 
insert into indicator values('Urine-pH',6,'pH','Sem unidade');
insert into indicator values('creatinine level',0.5,'milligrams','Medido em mg/24h');


/*_procedure				name | VAT_owner | date_timestamp | num | description*/
insert into _procedure values('PiuPiu',35263686,'2018-08-01 12:45:02',1042,'Kidney transplant');
insert into _procedure values('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'Blood test');
insert into _procedure values('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood test');
insert into _procedure values('Rapina',45620852,'2017-03-20 15:18:15',2903,'Elbow X-ray');
insert into _procedure values('Rapina',45620852,'2017-03-20 15:18:15',1892,'Elbow joint operation');


/*test_procedure			name | VAT_owner | date_timestamp | num | type*/
insert into test_procedure values('Luna',12345678,'2018-09-18 15:52:56',6136,'blood');
insert into test_procedure values('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'blood');
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();
-- insert into test_procedure values();


/*radiography				name | VAT_owner | date_timestamp | num | file*/
insert into radiography values('Rapina',45620852,'2017-03-20 15:18:15',2903,'/Users/Vet/Documents/RapinaElbow.xray');


/*produced_indicator		name | VAT_owner | date_timestamp | num | indicator_name | value*/
insert into produced_indicator values('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Sodium',322);
insert into produced_indicator values('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Total Serum Iron',150);
insert into produced_indicator values('Luna',12345678,'2018-09-18 15:52:56',6136,'Blood-Ionized Calcium',4.4);
insert into produced_indicator values('PiuPiu',35263686,'2018-08-01 12:45:02',8256,'creatinine level',1.1);
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();
-- insert into produced_indicator values();


/*performed					name | VAT_owner | date_timestamp | num | VAT_assistant*/