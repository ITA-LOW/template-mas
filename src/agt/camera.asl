acessou_entrada("Jonas", "entrada").
acessou_saida("Jonas", "saida").


!inicializar_camera.

+!inicializar_camera
  <- 	makeArtifact("camera_quarto","artifacts.Camera",[],D);
  	   	focus(D).


+movimento 
  <-  !!verificar_pessoa.

+closed  <-  .print("Close event from GUIInterface").

+!verificar_pessoa: pessoa_presente(P) & local("entrada")
 	<-  .print("Pessoa: ", P, " reconhecida no local ", L);
  !!conceder(P,L).

+!verificar_pessoa: pessoa_presente(P) & local("saida")
 	<-  .print("Pessoa: ", P, " reconhecida no local ", L);
  !!saida(P,L).

+!verificar_pessoa: pessoa_presente(P) & local(L) & P \== "Jonas"
 	<-  .print("Pessoa desconhecida observada no local ", L);
  !!protocolo_de_seguranca(P,L).

+!conceder(P,L): acessou_entrada(P, L) 
  <- .print("Acesso concedido a ", P);
  .send(fechadura, achieve, destrancar_porta);
  .send(ar_condicionado, tell, climatizar_pref(P));
  .send(cortina, achieve, abrir_cortina_pref(P));
  .send(lampada, achieve, ajustar_iluminacao_pref(P)).

+!saida(P,L): acessou_saida(P,L)
  <- .print(P, " saiu de casa");
      .send(fechadura, achieve, fechar_porta);
      .send(cortina, achieve, fechar_cortinas);
      .send(lampada, achieve, desligar_lampada).
  
+!protocolo_de_seguranca(P,L)
  <-  .print("Alguém quebrou a segurança e foi identificado no local ", L);
      .print("Ativando Hell Mode, todos os agentes em posição de batalha");
      .print("Alexa: coloca aquela do Linkin Park que o pau vai quebrar.");
      .broadcast(achieve, hell_mode).

