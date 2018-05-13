package javamysql;


import java.awt.BorderLayout;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;

import java.awt.event.KeyEvent;

import java.awt.event.KeyListener;

import java.io.BufferedReader;

import java.io.BufferedWriter;

import java.io.IOException;

import java.io.InputStreamReader;

import java.io.OutputStreamWriter;

import java.net.Socket;

import java.net.UnknownHostException;



import javax.swing.JButton;

import javax.swing.JFrame;

import javax.swing.JScrollPane;

import javax.swing.JTextArea;

import javax.swing.JTextField;



//윈도우창은 개발자가 명시하지 않으면 디폴트로 BorderLayout이 적용된다.

public class ChatClient extends JFrame implements ActionListener,KeyListener{

	

	JButton btn;

	JTextArea area;

	JScrollPane scoll;

	JTextField input;

	Socket client;	//대화형 소켓

	String ip = "203.252.218.95";

	int port = 7777;



	BufferedReader bufferR;

	BufferedWriter bufferW;

	
	
	

	public ChatClient() {

		btn = new JButton("접속");

		area = new JTextArea();

		scoll = new JScrollPane(area);

		input = new  JTextField();

		

		btn.addActionListener(this);

		input.addKeyListener(this);

		connect();

		this.add(btn, BorderLayout.NORTH);

		this.add(scoll);

		this.add(input,BorderLayout.SOUTH);

		setSize(300,400);

		setVisible(true);

	}

	//채팅서버에 접속

	public void connect(){

		try {

			client = new Socket(ip, port);
			
			if(client != null) {
				System.out.println(client.toString());
			}

			//연결된 소켓으로부터 대화를 나눌 스트림을 얻자

			bufferR = new BufferedReader(new InputStreamReader(client.getInputStream()));

			bufferW = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()));

			

		} catch (UnknownHostException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		}

	}

	//서버에 메시지 보내기

	public void listen(){

		String msg="";

		

		try {

			msg = bufferR.readLine();

			area.append(msg+"\n");

			

		} catch (IOException e) {

			e.printStackTrace();

		}

		

		

		

	}

	//서버에서 메시지 청취하기

	public void send(){

		String v = input.getText();

		try {

			bufferW.write(v+"\n");

			bufferW.flush();

		} catch (IOException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}

	

	public void actionPerformed(ActionEvent e) {

		System.out.println("클릭");

		connect();

	}

	public static void main(String[] args) {

		

		new ChatClient();

	}

	

	//키를 누르골 있을때

	public void keyPressed(KeyEvent e) {

		

	}

	//키를 눌렀다 땠을때

	public void keyReleased(KeyEvent e) {

		System.out.println("키:"+e.getKeyCode());

		if(e.getKeyCode()==KeyEvent.VK_ENTER){

			System.out.println("엔터");

			send();

			input.setText("");

			listen();

			

			

		}

		

	}

	//타이핑하면

	public void keyTyped(KeyEvent e) {

		

	}



}

