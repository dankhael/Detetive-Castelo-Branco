/// @param text_id
function scr_game_text(_text_id){
	switch(_text_id) {
		case "event 1":
			scr_text("Droga, dormi demais, tenho que correr pra delegacia!", "castelo atrasado");
			scr_text("Não posso esquecer do meu bloco de anotações e do distintivo!", "castelo branco");
			scr_text("Acho que deixei eles na mesa...", "castelo tedio");
			break;
		case "event 2":
			scr_text("Tá, agora tenho que ir pra delegacia.", "castelo branco");
			break;
		case "event 3":
			scr_text("Atrasado de novo né Castelo, você não toma jeito.", "guarda belo")
			scr_text("Qual é a desculpa da vez?", "guarda belo");
				scr_option("Transito", "event 3 - transito");
				scr_option("Sudoku", "event 3 - sudoku");				
				scr_option("Não é da sua conta", "event 3 - nao");
			break;
			case "event 3 - sudoku":
				scr_text("Passei a madrugada jogando sudoku...", "castelo tedio");
				scr_text("É bem a sua cara! Por falar em sudoku...", "guarda belo");
				scr_text("Achei essa revista de quebra-cabeças na copa, acho que é seu.", "guarda belo");
				scr_text("* Recebe Revista Choquetel.");
				global.received_magazine = true;
				scr_text("A chefe quer falar com você, parece que chegou um caso novo.", "guarda belo");
				break;
			case "event 3 - transito":
				scr_text("O trânsito estava terrível!", "castelo branco");
				scr_text("Inventa outra cara, você mora do lado da delegacia.", "guarda belo");
				scr_text("A chefe quer falar com você, parece que chegou um caso novo.", "guarda belo");
				break;
			case "event 3 - nao":
				scr_text("Não é da sua conta.", "castelo tedio");
				scr_text("É só uma brincadeira, não precisava ser ignorante desse jeito!", "belo surpreso");
				scr_text("A chefe quer falar com você, parece que chegou um caso novo.", "guarda belo");
				break;
		case "event 4":
			scr_text("Não posso sair sem meu distintivo nem meu caderno!", "castelo atrasado");
			break;
		case "event 5":
			scr_text("Tá olhando oquê? vai trabalhar.", "guarda belo");
			break;
		case "event 6":
			scr_text("Bom dia detetive Branco, ainda bem que você chegou.", "delegada patricia");
			scr_text("Preciso que você vá no parque de Casa Fraca, encontraram um corpo lá, 1 hora atrás, possível homicídio.", "delegada patricia");
			scr_text("O agente Fraga já está no local, ele vai te dar mais detalhes.", "delegada patricia");
			scr_text("Acho que você vai gostar do caso...", "patricia sorriso");
			scr_text("* Parque Casa Fraca Desbloqueado");
			break;
		case "event 7":
			scr_text("Tá esperando oquê? o agente Fraga está lhe esperando.", "delegada patricia");
			break;
		case "event 8":
			scr_text("Às vezes eu queria ser que nem uma nuvem, indo onde a vida me levar...", "agente fraga");
			scr_text("Bom dia agente Fraga...", "castelo branco");
			scr_text("Ah! Não tinha visto você Castelo, quer dizer que você é o investigador do caso.", "agente fraga");
			scr_text("Isso, a delegada Patrícia me deixou como encarregado.", "castelo branco");
			scr_text("Mais um caso de homicídio para o detetive prodígio de Vila Pinhal.", "fraga rindo");
			scr_text("Você tem resolvido casos como quem bebe um copo d'água.", "fraga rindo");
			scr_text("É só sorte de principiante, ainda tenho muito o que aprender...", "castelo branco");
			scr_text("De qualquer forma, o que aconteceu aqui?", "castelo branco");
			scr_text("A vítima é Vinicius Carvalho, 32 anos, mora a algumas quadras daqui.", "agente fraga");
			scr_text("Aparentemente um palhaço atirou pelas costas e cortou o dedo dele.", "agente fraga");
			scr_text("Um palhaço?! Que dedo ele tirou?", "castelo branco");
			scr_text("O indicador direito, bem estranho né?", "agente fraga");
			scr_text("Alguma testemunha?", "castelo branco");
			scr_text("O dono de uma barraquinha ouviu o tiro e viu de relance o suspeito fugindo.", "agente fraga");
			scr_text("Acho que o atirador o encurralou nas árvores e o matou ali.", "agente fraga");
			scr_text("Não encontramos o dedo, provavelmente o assassino o levou. O que você acha que significa o dedo amputado?", "agente fraga");
				scr_option("Mensagem Oculta", "event 8 - oculto");
				scr_option("Tortura", "event 8 - tortura");				
				scr_option("Utilidade", "event 8 - utilidade");
			break;
			case "event 8 - oculto":
				scr_text("Talvez o assassino quisesse mandar uma mensagem, é uma prática comum no crime organizado.", "castelo branco");
				scr_text("Faz sentido, os crimes de máfia têm aumentado nessa região...", "agente fraga");
				scr_text("Enfim, fizemos uma varredura, procuramos testemunhas e publicamos uma descrição do agressor.", "agente fraga");
				scr_text( "O caso parece bem encaminhado, deve ser fácil achar um suspeito com essa descrição nas redondezas, por que me chamaram?", "castelo branco");
				scr_text("Bem, só tem um probleminha...", "fraga rindo");
				break;
			case "event 8 - tortura":
				scr_text("A vítima sabia de algo e estava sendo torturada para liberar a informação.", "castelo branco");
				scr_text("Impossível, por que o atirador torturaria a vítima em praça pública vestido de palhaço, e qual seria a motivação para levar o dedo com ele?", "agente fraga");
				scr_text("Parece que o detetive prodígio ainda tem muito a aprender com o Fraga aqui.", "fraga rindo");
				scr_text("Enfim, fizemos uma varredura, procuramos testemunhas e publicamos uma descrição do agressor.", "agente fraga");
				scr_text( "O caso parece bem encaminhado, deve ser fácil achar um suspeito com essa descrição nas redondezas, por que me chamaram?", "castelo branco");
				scr_text("Bem, só tem um probleminha...", "fraga rindo");
				break;
			case "event 8 - utilidade":
				scr_text("Acho que o assassino pretende usar o dedo de alguma forma...", "castelo branco");
				scr_text("Interessante, mas quais as utilidades de um indicador amputado?", "agente fraga");
				scr_text("Ótima pergunta.", "castelo branco");
				scr_text("Enfim, fizemos uma varredura, procuramos testemunhas e publicamos uma descrição do agressor.", "agente fraga");
				scr_text( "O caso parece bem encaminhado, deve ser fácil achar um suspeito com essa descrição nas redondezas, por que me chamaram?", "castelo branco");
				scr_text("Bem, só tem um probleminha...", "fraga rindo");
				break;
		case "event 9":
			scr_text("Divirta-se entrevistando os palhaços, depois vai investigar a cena do crime", "fraga rindo");
			break;
		case "event 10":
			scr_text("Ainda não terminamos a analise do corpo!", "pericia 1");
			break;
		case "event 11":
			scr_text("Ainda não terminamos a analise do corpo!", "pericia 2");
			break;
		case "event 12":
			scr_text("Acho que eu fiz papel de palhaço...", "castelo tedio");
			break;
		case "event 13":
			scr_text("Pode inspecionar a cena do crime agora, o corpo está no canto direito do parque", "pericia 1");
			break;
		case "event 14":
			scr_text("Cena do crime liberada, ela está no jardim a direita", "pericia 2");
			break;
		case "event 15":
			scr_text("Eu tô atrasado pra uma festa de criança, me libera logo", "palhaço");
			scr_text("Só precisamos fazer mais algumas perguntas e você está liberado", "agente fraga");
			break;
		case "event 16":
			scr_text("Me falaram que hoje era o dia do festival dos palhaços no parque", "palhaço");
			scr_text("Aparentemente o assassino planejou chamar esses palhaços pra distrair a gente...", "agente fraga");
			scr_text("Acho que falar com esses palhaços não vai ajudar em nada.", "castelo branco");
			break;
		case "event 17":
			scr_text("Eu posso fazer um coelho sumir, quer ver?", "palhaço");
			scr_text("Não sabia que palhaços faziam magica", "castelo tedio");
			scr_text("Temos que diversificar, os clientes são muito exigentes hoje em dia...", "palhaço");
			break;
		case "event 18":
			scr_text("Quer um balão de cachorro?", "palhaço");
			scr_text("Não obrigado, já passei da idade", "castelo tedio");
			scr_text("Ei, eu quero! nunca conseguia fazer um desses...", "fraga rindo");
			break;
		case "event 19":
			scr_text("Acho que isso é tudo, vou falar com o Fraga pra ver se descobriram alguma coisa", "castelo branco");
			break;
		case "event 20":
			scr_text("Entramos em contato com a esposa e o irmão da vitima, eles estão em casa no momento", "agente fraga");
			scr_text("Você devia ir lá e vê se descobre alguma coisa", "agente fraga");
			scr_text("* Casa de Vinicius desbloqueada");
			break;
		case "event 21":
			scr_text("Ele era tão jovem, não acredito que fizeram isso com ele...", "nicole chorando");
			scr_text("Como vocês se conheceram?", "castelo branco");
			scr_text("Ele frequentava a cafeteria que eu trabalhava, Noite Azul, sempre ficava fazendo palavras cruzadas lá, um dia ele me chamou e perguntou se eu sabia como resolver a ultima palavra...", "nicole chorando");
			scr_text("Tenho certeza que ele sabia a resposta, mas fez isso só pra chamar minha atenção, depois disso começamos a sair, e eu sempre gostei de caras mais inteligentes...", "nicole triste");
			scr_text("Agora ele morreu...", "nicole triste");
			scr_text("Vou fazer algumas perguntas sobre o Vinicius e dar uma olhada na mesa da sala, parece que tem coisas interessantes lá", "castelo branco");
			break
		case "event 22":
			scr_text("Pode me perguntar qualquer coisa", "nicole carvalho");
				scr_option("Inimigos", "event 22 - inimigos");
				scr_option("Trabalho", "event 22 - trabalho");
				scr_option("Familia", "event 22 - familia");
				if (global.completed_vini_house_game) {
					scr_option("Xadrez", "event 22 - xadrez");
				}
			break;
			case "event 22 - inimigos":
				scr_text("Ële tinha inimigos ou alguém que quisesse fazer mal a ele?", "castelo branco");
				scr_text("Não, meu Vinicius não fazia mal a uma mosca...", "nicole triste");
				scr_text("Nem vem, ele sempre foi um pé no saco, vivia se gabando de quanto era inteligente, falando aquelas coisas de nerd que ninguém entende", "lucas carvalho");
				scr_text("Ele era incompreendido, não era de proposito.", "nicole carvalho");
				break;
			case "event 22 - trabalho":
				scr_text("Oque ele fazia da vida?", "castelo branco");
				scr_text("Ele era formado em matemática, sempre foi um prodigio, publicou alguns papers e artigos, mas isso não dá muito dinheiro...", "nicole carvalho");
				scr_text("Estava tentando ser professor universitário, mas ele tinha problemas de se comunicar com as pessoas", "nicole carvalho");
				scr_text("Recentemente ele estava trabalhando com operações financeiras, day trading, estava se dando bem...", "nicole carvalho");
				scr_text("Nós sobreviviamos com o meu salário de garçonete, mas tenho certeza que eventualmente ele iria fazer alguma descoberta incrivel e ficariamos ricos", "nicole carvalho");
				scr_text("Pelo que sei ele estava fazendo uns bicos de entregador, todos aqueles diplomas pra nada...", "lucas carvalho");
				scr_text("Cala a boca!", "nicole chorando");
				break;
			case "event 22 - familia":
				scr_text("Qual era a relação do Vinicius com a familia?", "castelo branco");
				scr_text("Os pais deles morreram há muito tempo, pelo que eu sei a única coisa que ele tinha é isso que ele chamava de irmão...", "nicole carvalho");
				scr_text("......", "lucas carvalho");
				break;
			case "event 22 - xadrez":
				scr_text("E esse jogo de xadrez incompleto, vocês jogavam juntos?", "castelo branco");
				scr_text("Costumavamos jogar na cafeteria onde eu trabalhava, ele até tinha um armário lá pra guardar as peças, ele sempre ganhava de mim... ", "nicole triste");
				scr_text("Mas desde que eu saí de lá paramos de jogar, depois ele começou a jogar com o Tomás Xavier, toda semana ele visitava aquela loja de jogos", "nicole carvalho");
				scr_text("Aquela loja de jogos? você ta falando da Casa de Orfeu?", "castelo branco");
				scr_text("Essa mesmo, o Vinicius amava ir lá pra jogar contra o Tomás, passava tempo até demais lá", "nicole carvalho");
				scr_text("Apesar de que recentemente do nada ele parou de ir lá, perguntei o motivo mas ele não quis me dizer...", "nicole carvalho");
				scr_text("Interessante... melhor eu fazer uma visita lá", "castelo branco");
				global.orpheus_house_unlocked = true;
				scr_text("* Casa de Orfeu desbloqueada");
				scr_text("Ele dizia que eu era a rainha dele...", "nicole triste");
				break;
		case "event 23":
			scr_text("Um jogo de xadrez incompleto, e parece que o Vinicius estava preso em uma jogada dificil, melhor eu perguntar a Nicole sobre isso...", "castelo branco");
			break;
		case "event 24":
			scr_text("De uma coisa eu sei, o Vinicius morria de medo de palhaços", "lucas carvalho");
			scr_text("O desgraçado que fez isso deve ser um sádico", "lucas carvalho");
			break;
		case "event 25":
			scr_text("Bom dia senhor, bem vindo a Casa de Orfeu, posso ajuda-lo?", "tomás xavier");
			scr_text("Bom dia, eu sou o detetive Castelo Branco, estou investigando a morte do Vinicius, queria fazer algumas perguntas", "castelo branco");
			scr_text("Eu soube do que aconteceu, que horrivel, quem diria que jogariamos nossa ultima partida de xadrez sem saber...", "tomás xavier");
			scr_text("A esposa dele disse que ele tinha parado de vir aqui recentemente, poderia me dizer o motivo?", "castelo branco");
			scr_text("Bem, duas semanas atrás ele quis jogar uma partida apostando dinheiro...", "tomás xavier");
			scr_text("E você aceitou?", "castelo branco");
			scr_text("Claro que não, eu tenho amor ao meu dinheiro, quando eu recusei ele ficou frustrado e foi embora, depois disso nunca mais apareceu...", "tomás xavier");
			scr_text("Não diga que fui eu que falei, mas ele começou a se envolver com gente barra pesada", "tomás xavier");
			scr_text("Gente barra pesada?", "castelo branco");
			scr_text("Ele estava dando dicas de resultados esportivos para alguns apostadores profissionais por dinheiro", "tomás xavier");
			scr_text("Esses caras são do tipo não aceitam perder dinheiro, uma maré de azar e você sofre as consequências...", "tomás xavier");
			scr_text("Uma vez ele me disse que se encontrava com um deles na cafeteria Noite Azul", "tomás xavier");
			scr_text("Estranho... mas acho que vale a pena dar uma olhada", "castelo branco");
			scr_text("* Cafeteria Noite Azul desbloqueada");
			break;
		case "event 26":
			scr_text("Bom dia senhor, já viu as novas edições da revista choquetel? são as minhas favoritas, e estão em promoção", "julia alves");
			break;
		case "event 73":
			scr_text("Além disso, não tenho muito para ajudar, você realmente deveria tentar falar com esses apostadores", "tomás xavier");
			break;
		case "event 27":
			scr_text("Tá olhando oquê?", "pedro melo");
			scr_text("Por acaso você conhecia algúem chamado Vinicius?", "castelo branco");
			scr_text("O cara que morreu? Não sei...", "pedro melo");
			scr_text("Talvez sim, talvez não...", "pedro melo");
			scr_text("Dependendo da situação talvez algo consiga refrescar minha memoria...", "pedro melo");
			scr_text("Acho que ele tá me pedindo dinheiro...", "castelo entediado");
			scr_text("Pena que não tenho nenhum! talvez eu tenha algum item que ele queira...", "castelo branco");
			break;
		case "event 29":
			scr_text("Eae, oque você tem pra mim?", "pedro melo");
			break;
		case "event 71":
			scr_text("Oque é isso?! vai ter que tentar algo melhor...", "pedro melo");
			break;
		case "event 30":
			scr_text("Essas são as previsões de apostas do Vinicius? Interessante...", "pedro melo");
			scr_text("Não é muito, mas dá pro gasto", "pedro melo");
			scr_text("Vocês negociavam?", "castelo branco");
			scr_text("Dá pra se dizer que sim, nos encontravamos aqui e ele dava algumas dicas de quais resultados apostar", "pedro melo");
			scr_text("E ele era bom?", "castelo branco");
			scr_text("Muito bom, ele era conhecido como Vini tiro certo, estavamos faturando uma grana boa", "pedro melo");
			scr_text("Não foi oque a mulher dele disse, aparentemente ela quem sustenteva a casa", "castelo branco");
			scr_text("Acho que o Vini não falava pra patroa, pelo oque eu sei ele investia todo o dinheiro em um projeto pessoal", "pedro melo");
			scr_text("Projeto pessoal?", "castelo branco");
			scr_text("Ele não me dizia muito a respeito, só falava que ia mudar a vida dele, que era algo revolucionario", "pedro melo");
			scr_text("Mas eu tenho certeza que aquele velho da Casa de Orfeu estava envolvido", "pedro melo");
			scr_text("O Tomás Xavier?", "castelo branco");
			scr_text("Esse aí, qualquer que fosse o esquema, certeza que ele sabia", "pedro melo");
			scr_text("Ah é, quase ia esquecendo, na ultima vez que nos encontramos, o Vini me deu esse pendrive com algumas estatisticas e dicas de apostas", "pedro melo");
			scr_text("Mas quando eu abri, era uma serie de arquivos criptografados, acho que ele trocou os pendrives e me deu o errado", "pedro melo");
			global.received_pendrive = true;
			scr_text("* Pendrive recebido");
			scr_text("Enfim, é isso, boa sorte, espero que encontre quem fez isso com o Vini", "pedro melo");
			break;
		case "event 31":
			scr_text("Alguma dica de apostas? estou precisando...", "pedro melo");
			break;
		case "event 32":
			scr_text("Meu celular ta tocando... Delegada Patricia?", "castelo branco");
			scr_text("Detetive Castelo? preciso de você na casa do Vinicius Carvalho, agora!", "delegada patricia");
			scr_text("Oque aconteceu?!", "castelo branco");
			scr_text("Aparentemente alguém arrombou e invadiu a casa...", "delegada patricia");
			scr_text("OK! estou a caminho", "castelo branco");
			break;
		case "event 33":
			scr_text("Quando eu cheguei tinham arrombado a casa e mexido no armário", "nicole triste");
			scr_text("Não sabia que o Vinicius tinha um cofre escondido no quarto...", "nicole triste");
			break;
		case "event 34":
			scr_text("Projeto secreto, e agora um cofre escondido", "castelo branco");
			scr_text("Preciso falar com o Tomás de novo, ele sabe de algo...", "castelo branco");
			break;
		case "event 35":
			scr_text("Boa tarde senhor Castelo, em que posso ajuda-lo?", "tomás xavier");
			scr_text("Eu sei que você está escondendo alguma coisa Tomás", "castelo branco");
			scr_text("Você e o Vinicius eram mais do que parceiros de xadrez", "castelo branco");
			scr_text("É melhor que você me revele logo, caso não seja o assassino", "castelo branco");
			scr_text("Não faço a minima ideia do que você está falando", "tomás xavier");
			scr_text("Se veio pra fazer acusações vazias, é melhor que saia da minha loja!", "tomás xavier");
			scr_text("Ele não vai dizer nada se eu não tiver algo concreto, preciso de alguma evidência...", "castelo branco");
			scr_text(".....", "julia alves");
			break;
		case "event 36":
			scr_text(".....", "julia alves");
			scr_text("Talvez eu possa te ajudar...", "julia alves");
			scr_text("Eu gostava do Vinicius, ele era um cara legal, oque o senhor Xavier está fazendo não é certo...", "julia alves");
			scr_text("Oque ele está fazendo?", "castelo branco");
			scr_text("Não posso te falar diretamente...", "julia alves");
			scr_text("Além disso, não sei se confio em você...", "julia alves");
			scr_text("Se você responder o meu super quiz de quebra cabeças, talvez eu te ajude...", "julia alves");
			break;
		case "event 37":
			scr_text("Preparado?", "julia alves");
			scr_text("Eu nasci preparado...", "castelo entediado");
			scr_text("Pera, isso é uma revista edição especial da choquetel?!!", "julia alves");
			scr_text("É sim, eu ganhei de natal da delegada Patricia...", "castelo entediado");
			scr_text("Ela é muito rara! vamos trocar a minha ajuda por ela", "julia alves");
			scr_text("Ok...", "castelo entediado");
			break;
		case "event 38":
			scr_text("Primeira pergunta!", "julia animada");
			scr_text("Qual é o objetivo principal do jogo de tabuleiro 'Jogo da Vida'?", "julia animada");
				scr_option("Ser o primeiro a se aposentar", "event 38 - errada");
				scr_option("Acumular o maior número de filhos", "event 38 - errada");
				scr_option("Juntar o máximo de dinheiro possível", "event 39");
				scr_option("Comprar todas as casas do tabuleiro", "event 38 - errada");
			break;
			case "event 38 - errada":
				scr_text("Errado! Mas tudo bem, pode tentar de novo!", "julia alves");
				break;
			case "event 39":
				scr_text("Segunda pergunta!", "julia animada");
				scr_text("Em Sudoku, qual é a regra básica para preencher os números na grade?", "julia animada");
					scr_option("Os números devem somar 15 em cada linha", "event 38 - errada");
					scr_option("As diagonais devem ter apenas números pares", "event 38 - errada");
					scr_option("Nenhum número pode se repetir na mesma linha, coluna ou bloco 3x3", "event 40");
					scr_option("Cada número só pode aparecer uma vez em toda a grade", "event 38 - errada");
			break;
			case "event 40":
				scr_text("Última pergunta!", "julia animada");
				scr_text("Qual desses é um jogo clássico do gênero point-and-click adventure?", "julia animada");
				scr_option("Tetris", "event 40 - errada");
				scr_option("Monkey Island", "event 41");
				scr_option("Uno", "event 40 - errada");
				scr_option("Just Dance", "event 40 - errada");
				break;
			case "event 40 - errada":
				scr_text("Quase, só faltava uma...", "julia alves");
				break;
		case "event 41":
			scr_text("Você conseguiu! Ok, vou te contar o segredo", "julia animada");
			scr_text("A Casa de Orfeu não é só uma loja de jogos, é uma fachada pra algo muito maior...","julia alves");
			scr_text("Toma essa foto","julia alves");
			scr_text("* Recebe foto secreta");
			global.received_photo = true;
			scr_text("Mas não fala pro senhor Xavier que eu te dei!","julia alves");
			break;
		case "event 42":
			scr_text("Muito obrigado! Ok, vou te contar o segredo", "julia animada");
			scr_text("A Casa de Orfeu não é só uma loja de jogos, ela esconde algo muito maior...","julia alves");
			scr_text("Toma essa foto","julia alves");
			scr_text("* Recebe foto secreta");
			global.received_photo = true;
			scr_text("Mas não fala pro senhor Xavier que eu te dei!","julia alves");
			break;
		case "event 43":
			scr_text("Oque é isso? se foi alguma piada, não entendi a graça", "tomás xavier");
			scr_text("Droga! tenho que mostrar alguma evidência da parceria dos dois", "castelo branco");
			scr_text("......", "julia alves");
			break;
		case "event 44":
			scr_text("Será que isso refresca sua memória...", "castelo branco");
			scr_text("Oquê?! Como você conseguiu essa foto?", "tomás xavier");
			scr_text("......", "julia alves");
			scr_text("Encontramos ela no computador da vitíma, parece que ele estava guardando provas caso algo acontecesse com ele...", "castelo branco");
			scr_text("Droga! Mas não é nada disso que você está pensando, eu não matei ele!", "tomás xavier");
			scr_text("A data da foto é de 3 dias antes do crime, parece que você mentiu sobre não ter encontrado ele recentemente, a sua situação está ficando cada vez pior", "castelo branco");
			scr_text("Ok, vou falar a verdade...", "tomás xavier");
			scr_text("Me siga...", "tomás xavier");
			break;
		case "event 45":
			scr_text("A Casa de Orfeu é uma fachada para minha organização", "tomás xavier");
			scr_text("Nós reuníamos genios e prodígios para resolver problemas milenares, e Vinicius era um deles", "tomás xavier");
			scr_text("Ele estava trabalhando em um projeto muito importante, o DecodeX", "tomás xavier");
			scr_text("E oque seria isso?", "castelo branco");
			scr_text("Um dispositivo que conseguiria quebrar qualquer criptografia no mundo", "tomás xavier");
			scr_text("Imagine as possibilidades, nenhum sistema seria seguro frente ao DecodeX, bancos, governos, empresas, todos vulneraveis, o valor de algo assim seria inestimavel!", "tomás xavier");
			scr_text("Parece bem perigoso...", "castelo branco");
			scr_text("Não importa, no final nem o Vinicius conseguiu desenvolver algo assim", "tomás xavier");
			scr_text("A foto que você mostrou foi do dia que ele veio aqui e me disse que tinha desistido do projeto, que não era possível", "tomás xavier");
			scr_text("Depois ele foi embora e essa foi a ultima vez que nos vimos", "tomás xavier");
			scr_text("Isso é tudo?", "castelo branco");
			scr_text("Tem mais uma coisa, ele deixou uma caixa de metal na mesa, parece um dos quebra cabeças dele, pode tentar resolver se quiser", "tomás xavier");
			scr_text("Quebra Cabeça? Será que foi isso que roubaram no cofre Vinicius? se esse for o caso, isso significaria que Tomás é o assassino...", "castelo branco");
			scr_text("Bem, como não tenho provas, melhor não questionar, talvez tenha algo interessante no quebra cabeça...", "castelo branco");
			break;
		case "event 46":
			scr_text("Oque foi? não tenho mais nada pra ajudar, não me complica com o chefe!", "julia alves");
			break;
		case "event 47":
			scr_text("Certo, parece que tem alguma alavanca dentro da caixa de metal, talvez eu consiga fazer algo para ativa-la", "castelo branco");
			break;
		case "event 48":
			scr_text("Consegui! agora é só abrir...", "castelo branco");
			scr_text("Tem outro quebra cabeça? Esse cara era misterioso mesmo", "castelo entediado");
			break;
		case "event 49":
			scr_text("Uma chave de armário e um papel escrito 'Um rei sempre protege sua rainha', oque significa? ", "castelo branco");
			scr_text("Não faço ideia, mas acho que alguém pode saber...", "tomás xavier");
			scr_text("Vinicius não era o unico no projeto DecodeX, ele trabalhava junto com o Gabriel, eles se davam muito bem, e eu não conseguia entender metade das converas dos dois", "tomás xavier");
			scr_text("Se tem alguém que pode entender essa mensagem é o Gabriel", "tomás xavier");
			scr_text("E onde esse gabriel está?", "castelo branco");
			scr_text("Ele é funcionário no museu do parque Casa Fraca, irônico, foi onde o Vinicius morreu...", "tomás xavier");
			break;
		case "event 50":
			scr_text("É só isso que eu tenho a dizer, não espalhe o segredo da Casa de Orfeu, não quero curiosos bisbilhotando", "tomás xavier");
			scr_text("E outra, se achar o DecodeX, devolva-o a mim! eu investi muito dinheiro nesse projeto", "tomás xavier");
			break;
		case "event 51":
			scr_text("Até que enfim você chegou a mim, estava te esperando", "gabriel borges");
			scr_text("Oque você sabe sobre o DecodeX?", "castelo branco");
			scr_text("O bastante pra saber que não foi completado...", "gabriel borges");
			scr_text("Vinicius não tinha oque era necessário para resolver o enigma, e mesmo que tivesse, o faltava coragem pra quebrar as barreiras do senso comum...", "gabriel borges");
			scr_text("Oque você quer dizer?", "castelo branco");
			scr_text("Ele vivia falando sobre complicações eticas e consequências de resolver um problema como aquele", "gabriel borges");
			scr_text("Pensamentos pequenos como esse não podem mudar o mundo", "gabriel borges");
			scr_text("Provavelmente foram esses pensamentos pequenos que o mataram...", "gabriel borges");
			scr_text("Acho que você estava errado", "castelo branco");
			scr_text("Oque?", "gabriel borges");
			scr_text("Você o subestimou, veja por si próprio, encontramos isso em um de seus quebra cabeças", "castelo branco");
			scr_text("Essa chave de armário... é do metrô que ele frequentava, e o bilhete...", "gabriel borges");
			scr_text("Sabe o que significa?", "castelo branco");
			scr_text("O rei era a peça favorita dele no xadrez, ele sempre fazia jogadas inesperadas com ele", "gabriel borges");
			scr_text("A posição inicial do rei no tabuleiro, E1!", "gabriel borges");
			break;
		case "event 52":
			scr_text("Droga! ele saiu correndo, melhor ir atrás dele", "castelo atrasado");
			scr_text("* Metro desbloqueado");
			break;
		case "event 53":
			scr_text("Droga! Não tinha nada no armário E1, alguém deve ter chegado antes de mim!", "gabriel borges");
			scr_text("Eae Castelo, pegamos esse meliante arrombando um dos armários do metrô, vamos leva-lo na delegacia", "guarda belo");
			scr_text("Ainda bem que você pegou ele, menos um problema pra mim", "castelo entediado");
			scr_text("'Um rei sempre protege sua rainha', acho que esse enigma vai além do xadrez...", "castelo branco");
			scr_text("Se considerarmos que ele é o rei, quem seria sua rainha? e oque isso significaria...", "castelo branco");
			scr_text("Acho que tenho uma ideia...", "castelo branco");
			break;
		case "event 54":
			scr_text("Boa tarde senhor, deseja alguma coisa", "garconete");
			break;
		case "event 55":
			scr_text("Boa tarde senhor, deseja alguma coisa", "garconete");
			scr_text("Poderia me dizer onde fica o armario do Vinicius Carvalho?", "castelo branco");
			scr_text("É esse do lado do balcão", "garconete");
			break;
		case "event 56":
			scr_text("O DecodeX! E um notebook...", "castelo branco");
			scr_text("É muito perigoso levar isso pra delegacia, tenho que investigar esse notebook em casa!", "castelo branco");
			break;
		case "event 57":
			scr_text("Ok, uma senha numerica de 4 digitos, será que ele deixou alguma pista de quais números", "castelo branco");
			break;
		case "event 58":
			scr_text("Consegui! Pera, agora eu preciso inserir uma chave?", "castelo branco");
			scr_text("Oque seria uma chave que se insere no computador...", "castelo branco");
			break;
		case "event 59":
			scr_text("Era aquele pendrive mesmo...", "castelo branco");
			scr_text("Hã? Agora eu preciso ganhar um jogo?! se esse cara não fosse obcecado por enigmas talvez ainda estivesse vivo", "castelo entediado");
			break;
		case "event 60":
			scr_text("Consegui desbloquear! Parece que só tem um arquivo de audio aqui, vamos ver o que é...", "castelo branco");
			scr_text("Eu não posso vende-lo, é poder demais na mão de uma pessoa só", "vinicius carvalho");
			scr_text("Eu sustentei você por anos, apoiando esses seus enigmas inuteis! e quando eu preciso de você...", "misterioso");
			scr_text("Você tem que me entender, não posso fazer isso", "vinicius carvalho");
			scr_text("Nós precisamos desse dinheiro, mais 3 meses e o banco vai tomar a nossa casa!", "misterioso");
			scr_text("Vamos achar outro jeito, nós sempre achamos, minha rainha...", "vinicius carvalho");
			scr_text("Cala a boca! Você tem até amanhã pra vender isso, senão... ", "misterioso");
			scr_text("* Recebe audio secreto");
			global.received_audio = True;
			scr_text("Entendo, acho que já tenho o suficiente para fechar o caso, vou ligar para delegada Patricia", "castelo branco");
			scr_text("Alô, Delegada Patricia falando", "delegada patricia");
			scr_text("Reuna todos os suspeitos na delegacia, e eu cuido do resto", "castelo branco");
			scr_text("Parece que alguém fez uma descoberta...", "patricia sorriso");
			scr_text("Ok, pode vir que os suspeitos estarão aqui", "delegada patricia");
			break;
		case "event 61":
			scr_text("Fale com a delegada Patricia quando for revelar o culpado", "agente fraga");
			break;
		case "event 62":
			scr_text("Está pronto para revelar o culpado? A escolha que você fizer será definitiva...", "delegada patricia");
				scr_option("Ainda não", "event 62 - ainda nao");
				scr_option("Estou pronto", "event 63");
				break;
			case "event 62 - ainda nao":
				scr_text("Ainda não, me dê mais tempo...", "castelo branco");
				scr_text("Ok, só não demore muito", "delegada patricia");
				break;
		case "event 63":
			scr_text("O culpado é...", "castelo branco");
				scr_option("Lucas", "event 64");
				scr_option("Nicole", "event 65");
				scr_option("Tomás", "event 66");
				scr_option("Gabriel", "event 67");
				break;
		case "event 64":
			scr_text("Eu?! de onde você tirou isso?", "lucas carvalho");
			scr_text("Poderia me mostrar as evidências que provam essa conclusão?", "delegada patricia");
			break;
		case "event 65":
			scr_text("Como pode me acusar de matar o meu marido? seu monstro!", "nicole chorando");
			global.case_solved = true;
			scr_text("Poderia me mostrar as evidências que provam essa conclusão?", "delegada patricia");
			break;
		case "event 66":
			scr_text("Você deve ter ficado louco! espero que tenha provas do que está falando", "tomás xavier");
			scr_text("Poderia me mostrar as evidências que provam essa conclusão?", "delegada patricia");
			break;
		case "event 67":
			scr_text("Ei! só porque eu arrombei um armário não significa que eu sou um homicida", "gabriel borges");
			scr_text("Poderia me mostrar as evidências que provam essa conclusão?", "delegada patricia");
			break;
		case "event 68":
			scr_text("Isso não faz muito sentido, nenhum promotor vai fazer uma acusação com essas provas...", "delegada patricia");
			scr_text("Mas... Eu tenho certeza, por favor, me dê mais uma chance", "castelo branco");
			scr_text("Infelizmente não é assim que funciona, vou passar esse caso para outro detetive", "delegada patricia");
			scr_text("Estou decepcionada com você Castelo...", "delegada patricia");
			scr_text("Nãoooooooo....", "castelo atrasado");
			global.game_over = true;
			break;
		case "event 69":
			scr_text("Okay, tenho que provar 3 coisas:", "castelo branco");
			scr_text("Que o assassino podia se vestir da palhaço", "castelo branco");
			scr_text("Que o DecodeX existe", "castelo branco");
			scr_text("E que o assassino tinha motivação para o crime", "castelo branco");
			scr_text("Você consegue Castelo!", "castelo branco");
		case "event 70":
			scr_text("Primeiro, esse recibo, que eu encontrei na casa da vítima, registra uma compra de uma roupa de palhaço, oque você tem a dizer sobre isso?", "castelo branco");
			scr_text("Isso não prova nada! O lucas estava teve acesso a casa também, ele poderia ter plantado esse recibo para me incriminar", "nicole triste");
			scr_text("Além do mais, isso não prova que quem comprou essa roupa de palhaço cometeu o crime", "nicole triste");
			scr_text("Eu ainda não terminei, você o matou para pegar o DecodeX, porque ele se recusou a vende-lo", "castelo branco");
			scr_text("Mas você primeiro precisaria provar que o DecodeX de fato existe, e todos nós sabemos que ele desistiu do projeto", "tomás xavier");
			scr_text("Exatamente! E outra, eu nem sei oque é esse treco aí", "nicole triste");
			scr_text("Como você é cinica... Felizmente eu segui as pistas que o Vinicius deixou e fiz oque vocês não conseguiram", "castelo branco");
			scr_text("Achei o DecodeX! Podem ver, e nem pensem que é falso, uma inspeção da pericia basta pra provar que ele é real", "castelo branco");
			scr_text("É de verdade! como esse desgraçado conseguiu?", "gabriel borges");
			scr_text("Mesmo que seja real, o Vinicius nunca me falou nada sobre isso, além do mais, eu apoiaria o meu marido independente da decisão dele", "nicole triste");
			scr_text("Uma mentira atrás da outra, como é fácil pra você...", "castelo branco");
			scr_text("Você sairia impune desse crime, mas o Vinicius deixou uma ultima peça do quebra cabeça antes de morrer, escutem isso...", "castelo branco");
			scr_text("Eu não posso vende-lo, é poder demais na mão de uma pessoa só", "vinicius carvalho");
			scr_text("Eu sustentei você por anos, apoiando esses seus enigmas inuteis! e quando eu preciso de você...", "nicole carvalho");
			scr_text("Você tem que me entender, não posso fazer isso", "vinicius carvalho");
			scr_text("Nós precisamos desse dinheiro, mais 3 meses e o banco vai tomar a nossa casa!", "nicole carvalho");
			scr_text("Vamos achar outro jeito, nós sempre achamos, minha rainha...", "vinicius carvalho");
			scr_text("Cala a boca! Você tem até amanhã pra vender isso, senão... ", "nicole carvalho");
			scr_text("OQUÊ! ONDE VOCÊ ACHOU ISSO!!!", "nicole carvalho");
			scr_text("Aparentemente o seu marido já tinha medo que algo lhe acontecesse, e por garantia, gravou essa discussão", "castelo branco");
			scr_text("É lamentavel que ele, que se via como um rei protetor, tomou cheque-mate de sua propria rainha traidora ", "castelo branco");
			scr_text("CALA A BOCA SEU DESGRAÇADO!! EU MERECIA AQUILO! ANOS AJUDANDO AQUELE VAGABUNDO E ELE SE RECUSOU A ME DAR A VIDA QUE EU SONHAVA QUANDO TEVE A CHANCE", "nicole carvalho");
			scr_text("Tudo por conta de questões morais! Como pode ser tão inteligente e tão burro ao mesmo tempo", "nicole carvalho");
			scr_text("É verdade, eu matei ele, e ele mereceu!", "nicole chorando");
			scr_text("Bem, parece que temos o suficiente, pode levar ela guarda belo", "delegada patricia");
			scr_text("Impressionante detetive Castelo, tudo acaba bem quando termina bem né, agora pode me passar o DecodeX, tenho negocios a fazer", "tomás xavier");
			scr_text("Pode pegar, mas acho que não vai te ajudar muito...", "castelo branco");
			scr_text("Hã?", "tomás xavier");
			scr_text("Eu quebrei, esse era o desejo do Vinicius antes de morrer e eu vou respeita-lo, além do mais, agora que o assassino confessou, não preciso mais dele pra provar nada", "castelo branco");
			scr_text("Então você estava blefando pra conseguir a confissão, seu desgraçado!", "tomás xavier");
			scr_text("Tudo termina bem quando acaba bem né?", "castelo entediado");
			scr_text("Parabéns Castelo Branco, mais uma vez você mostrou porque é o detetive prodigio, estou orgulhosa de você!", "patricia sorriso");
			global.case_finished = true;
			break;
		case "event 72":
			scr_text("Tá fazendo oquê aí? meu marido morreu e você quer bisbilhotar meu quarto?!", "nicole chorando");
			break;
	}
}