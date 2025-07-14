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
				scr_text("*Recebe Revista Choquetel.");
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
			break;
		case "event 7":
			scr_text("Tá esperando oquê? o agente Fraga está lhe esperando.", "delegada patricia");
			break;
			
	}
}